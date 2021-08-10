import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/built_collection.dart';

import '../models/audio_item.dart';
import '../providers.dart';

class AudioIntonationForm extends HookConsumerWidget {
  const AudioIntonationForm({Key? key, required this.audioItem})
      : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: (audioItem.accentPhrases ?? [])
            .asMap()
            .map((accentPhraseIndex, accentPhrase) {
              return MapEntry(
                  accentPhraseIndex,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: accentPhrase.moras
                        .asMap()
                        .map((moraIndex, mora) {
                          return MapEntry(
                              moraIndex,
                              Column(
                                children: [
                                  if (mora.pitch > 0)
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Slider(
                                        min: 3,
                                        max: 6.5,
                                        divisions: 35,
                                        value: mora.pitch.toDouble(),
                                        onChanged: (nextPitch) {
                                          final nextAccentPhrases = [
                                            ...audioItem.accentPhrases!
                                          ];
                                          nextAccentPhrases[accentPhraseIndex] =
                                              AccentPhrase((builder) {
                                            builder.moras = ListBuilder(
                                                accentPhrase.moras
                                                    .asMap()
                                                    .map((i, mora) {
                                              return MapEntry(i,
                                                  Mora((moraBuilder) {
                                                moraBuilder.text =
                                                    accentPhrase.moras[i].text;
                                                moraBuilder.consonant =
                                                    accentPhrase
                                                        .moras[i].consonant;
                                                moraBuilder.vowel =
                                                    accentPhrase.moras[i].vowel;
                                                moraBuilder.pitch =
                                                    i == moraIndex
                                                        ? nextPitch
                                                        : accentPhrase
                                                            .moras[i].pitch;
                                              }));
                                            }).values);

                                            if (accentPhrase.pauseMora !=
                                                null) {
                                              final pauseMora = MoraBuilder();
                                              pauseMora.replace(
                                                  accentPhrase.pauseMora!);
                                              builder.pauseMora = pauseMora;
                                            }
                                            builder.accent =
                                                accentPhrase.accent;
                                          });

                                          ref
                                              .read(audioItemListProvider
                                                  .notifier)
                                              .update(
                                                  id: audioItem.id,
                                                  accentPhrases:
                                                      nextAccentPhrases);
                                        },
                                      ),
                                    ),
                                  Text(mora.text),
                                ],
                              ));
                        })
                        .values
                        .toList(),
                  ));
            })
            .values
            .toList(),
      ),
    );
  }
}
