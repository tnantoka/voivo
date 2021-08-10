import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/built_collection.dart';

import '../providers.dart';
import '../models/audio_item.dart';

class AudioAccentForm extends HookConsumerWidget {
  const AudioAccentForm({Key? key, required this.audioItem}) : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(defaultApiProvider).state;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: (audioItem.accentPhrases ?? [])
            .asMap()
            .map((accentPhraseIndex, accentPhrase) {
              final width = accentPhrase.moras.length * 40.0;
              return MapEntry(
                  accentPhraseIndex,
                  Column(
                    children: [
                      SizedBox(
                        width: width,
                        child: Slider(
                          min: 1,
                          max: accentPhrase.moras.length.toDouble(),
                          value: accentPhrase.accent.toDouble(),
                          divisions: accentPhrase.moras.length - 1,
                          onChanged: (nextAccent) async {
                            final accentPhrases = [...audioItem.accentPhrases!];
                            accentPhrases[accentPhraseIndex] =
                                AccentPhrase((builder) {
                              builder.moras = ListBuilder(accentPhrase.moras);
                              if (accentPhrase.pauseMora != null) {
                                final pauseMora = MoraBuilder();
                                pauseMora.replace(accentPhrase.pauseMora!);
                                builder.pauseMora = pauseMora;
                              }
                              builder.accent = nextAccent.toInt();
                            });

                            final nextAccentPhrases =
                                await api.moraPitchMoraPitchPost(
                                    speaker: audioItem.speaker,
                                    accentPhrase: BuiltList(accentPhrases));
                            ref.read(audioItemListProvider.notifier).update(
                                id: audioItem.id,
                                accentPhrases:
                                    nextAccentPhrases.data?.toList());
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: accentPhrase.moras.map((mora) {
                            return Text(mora.text);
                          }).toList(),
                        ),
                      ),
                    ],
                  ));
            })
            .values
            .toList(),
      ),
    );
  }
}
