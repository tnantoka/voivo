import 'dart:io';

import 'package:openapi/openapi.dart';
import 'package:uuid/uuid.dart';
import 'package:built_collection/built_collection.dart';
import 'package:path_provider/path_provider.dart';

const _uuid = Uuid();

class AudioItem {
  AudioItem(
      {id,
      required this.text,
      this.speaker = 0,
      this.accentPhrases,
      this.intonationScale = 1.0,
      this.pitchScale = 0.0,
      this.speedScale = 1.0,
      this.generatedPath,
      createdAt,
      updatedAt})
      : id = id ?? _uuid.v4(),
        createdAt = createdAt ?? DateTime.now().toUtc(),
        updatedAt = updatedAt ?? DateTime.now().toUtc();

  final String id;
  final String text;
  final int speaker;
  List<AccentPhrase>? accentPhrases;
  final DateTime createdAt;
  final DateTime updatedAt;
  final num intonationScale;
  final num pitchScale;
  final num speedScale;
  final String? generatedPath;

  AudioItem copyWith({
    String? text,
    int? speaker,
    List<AccentPhrase>? accentPhrases,
    num? intonationScale,
    num? pitchScale,
    num? speedScale,
    String? generatedPath,
  }) =>
      AudioItem(
        id: id,
        text: text ?? this.text,
        speaker: speaker ?? this.speaker,
        accentPhrases: accentPhrases ?? this.accentPhrases,
        intonationScale: intonationScale ?? this.intonationScale,
        pitchScale: pitchScale ?? this.pitchScale,
        speedScale: speedScale ?? this.speedScale,
        generatedPath: generatedPath,
        createdAt: createdAt,
        updatedAt: DateTime.now().toUtc(),
      );

  AudioQuery _buildQuery() {
    return AudioQuery((builder) {
      builder.accentPhrases = ListBuilder(accentPhrases!);
      builder.intonationScale = intonationScale;
      builder.pitchScale = pitchScale;
      builder.speedScale = speedScale;
    });
  }

  play(DefaultApi api) async {
    if (generatedPath != null) {
      return generatedPath;
    }

    final res = await api.synthesisSynthesisPost(
        speaker: speaker, audioQuery: _buildQuery());

    final path = '${(await getApplicationDocumentsDirectory()).path}/$id.wav';
    await File(path).writeAsBytes(res.data!);

    return path;
  }

  fetchAccentPhrases(DefaultApi api, String text, int speaker) async {
    final res =
        await api.accentPhrasesAccentPhrasesPost(text: text, speaker: speaker);
    return res.data?.toList();
  }

  updateAccent(DefaultApi api, int accentPhraseIndex, int moraIndex,
      int nextAccent) async {
    final accentPhrase = accentPhrases![accentPhraseIndex];

    final nextAccentPhrases = [...accentPhrases!];
    nextAccentPhrases[accentPhraseIndex] = AccentPhrase((builder) {
      builder.moras = ListBuilder(accentPhrase.moras);

      if (accentPhrase.pauseMora != null) {
        final pauseMora = MoraBuilder();
        pauseMora.replace(accentPhrase.pauseMora!);
        builder.pauseMora = pauseMora;
      }

      builder.accent = nextAccent;
    });

    final res = await api.moraPitchMoraPitchPost(
        speaker: speaker, accentPhrase: BuiltList(nextAccentPhrases));
    return res.data?.toList();
  }

  updatePicth(
      DefaultApi api, int accentPhraseIndex, int moraIndex, double nextPitch) {
    final accentPhrase = accentPhrases![accentPhraseIndex];

    final nextAccentPhrases = [...accentPhrases!];
    nextAccentPhrases[accentPhraseIndex] = AccentPhrase((builder) {
      builder.moras = ListBuilder(accentPhrase.moras.asMap().map((i, mora) {
        return MapEntry(i, Mora((moraBuilder) {
          moraBuilder.text = accentPhrase.moras[i].text;
          moraBuilder.consonant = accentPhrase.moras[i].consonant;
          moraBuilder.vowel = accentPhrase.moras[i].vowel;
          moraBuilder.pitch =
              i == moraIndex ? nextPitch : accentPhrase.moras[i].pitch;
        }));
      }).values);

      if (accentPhrase.pauseMora != null) {
        final pauseMora = MoraBuilder();
        pauseMora.replace(accentPhrase.pauseMora!);
        builder.pauseMora = pauseMora;
      }
      builder.accent = accentPhrase.accent;
    });

    return nextAccentPhrases;
  }

  splitAccentPhrases(
    DefaultApi api,
    int accentPhraseIndex,
    int moraIndex,
  ) async {
    final accentPhrase = accentPhrases![accentPhraseIndex];

    final nextAccentPhrase1 = AccentPhrase((builder) {
      builder.moras = ListBuilder(accentPhrase.moras.sublist(0, moraIndex + 1));
      builder.accent =
          accentPhrase.accent > moraIndex ? moraIndex + 1 : accentPhrase.accent;
    });

    final nextAccentPhrase2 = AccentPhrase((builder) {
      builder.moras = ListBuilder(accentPhrase.moras.sublist(moraIndex + 1));
      if (accentPhrase.pauseMora != null) {
        final pauseMora = MoraBuilder();
        pauseMora.replace(accentPhrase.pauseMora!);
        builder.pauseMora = pauseMora;
      }
      builder.accent = accentPhrase.accent > moraIndex + 1
          ? accentPhrase.accent - moraIndex - 1
          : 1;
    });

    final nextAccentPhrases = [
      ...accentPhrases!.sublist(0, accentPhraseIndex),
      nextAccentPhrase1,
      nextAccentPhrase2,
      ...accentPhrases!.sublist(accentPhraseIndex + 1),
    ];

    final res = await api.moraPitchMoraPitchPost(
        speaker: speaker, accentPhrase: BuiltList(nextAccentPhrases));
    return res.data?.toList();
  }

  mergeAccentPhrases(
    DefaultApi api,
    int accentPhraseIndex,
  ) async {
    final accentPhrase = accentPhrases![accentPhraseIndex];

    final nextAccentPhrase = AccentPhrase((builder) {
      builder.moras = ListBuilder([
        ...accentPhrase.moras,
        ...accentPhrases![accentPhraseIndex + 1].moras,
      ]);
      if (accentPhrases![accentPhraseIndex + 1].pauseMora != null) {
        final pauseMora = MoraBuilder();
        pauseMora.replace(accentPhrases![accentPhraseIndex + 1].pauseMora!);
        builder.pauseMora = pauseMora;
      }
      builder.accent = accentPhrase.accent;
    });

    final nextAccentPhrases = [
      ...accentPhrases!.sublist(0, accentPhraseIndex),
      nextAccentPhrase,
      ...accentPhrases!.sublist(accentPhraseIndex + 2),
    ];

    final res = await api.moraPitchMoraPitchPost(
        speaker: speaker, accentPhrase: BuiltList(nextAccentPhrases));
    return res.data?.toList();
  }
}
