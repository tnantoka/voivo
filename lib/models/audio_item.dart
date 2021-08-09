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
}
