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
              return MapEntry(
                accentPhraseIndex,
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: accentPhrase.moras
                          .asMap()
                          .map((moraIndex, mora) {
                            return MapEntry(
                              moraIndex,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Radio<int>(
                                        value: moraIndex + 1,
                                        groupValue: accentPhrase.accent,
                                        onChanged: (nextAccent) async {
                                          final accentPhrases = [
                                            ...audioItem.accentPhrases!
                                          ];
                                          accentPhrases[accentPhraseIndex] =
                                              AccentPhrase((builder) {
                                            builder.moras =
                                                ListBuilder(accentPhrase.moras);
                                            if (accentPhrase.pauseMora !=
                                                null) {
                                              final pauseMora = MoraBuilder();
                                              pauseMora.replace(
                                                  accentPhrase.pauseMora!);
                                              builder.pauseMora = pauseMora;
                                            }
                                            builder.accent = nextAccent;
                                          });

                                          final nextAccentPhrases =
                                              await api.moraPitchMoraPitchPost(
                                                  speaker: audioItem.speaker,
                                                  accentPhrase:
                                                      BuiltList(accentPhrases));
                                          ref
                                              .read(audioItemListProvider
                                                  .notifier)
                                              .update(
                                                  id: audioItem.id,
                                                  accentPhrases:
                                                      nextAccentPhrases.data
                                                          ?.toList());
                                        },
                                      ),
                                      Text(mora.text),
                                    ],
                                  ),
                                  if (moraIndex < accentPhrase.moras.length - 1)
                                    SizedBox(
                                      width: 6,
                                      height: 24,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          final nextAccentPhrase1 =
                                              AccentPhrase((builder) {
                                            builder.moras = ListBuilder(
                                                accentPhrase.moras
                                                    .sublist(0, moraIndex + 1));
                                            builder.accent =
                                                accentPhrase.accent > moraIndex
                                                    ? moraIndex + 1
                                                    : accentPhrase.accent;
                                          });

                                          final nextAccentPhrase2 =
                                              AccentPhrase((builder) {
                                            builder.moras = ListBuilder(
                                                accentPhrase.moras
                                                    .sublist(moraIndex + 1));
                                            if (accentPhrase.pauseMora !=
                                                null) {
                                              final pauseMora = MoraBuilder();
                                              pauseMora.replace(
                                                  accentPhrase.pauseMora!);
                                              builder.pauseMora = pauseMora;
                                            }
                                            builder.accent =
                                                accentPhrase.accent >
                                                        moraIndex + 1
                                                    ? accentPhrase.accent -
                                                        moraIndex -
                                                        1
                                                    : 1;
                                          });

                                          final accentPhrases = [
                                            ...audioItem.accentPhrases!
                                                .sublist(0, accentPhraseIndex),
                                            nextAccentPhrase1,
                                            nextAccentPhrase2,
                                            ...audioItem.accentPhrases!
                                                .sublist(accentPhraseIndex + 1),
                                          ];

                                          final nextAccentPhrases =
                                              await api.moraPitchMoraPitchPost(
                                                  speaker: audioItem.speaker,
                                                  accentPhrase:
                                                      BuiltList(accentPhrases));
                                          ref
                                              .read(audioItemListProvider
                                                  .notifier)
                                              .update(
                                                  id: audioItem.id,
                                                  accentPhrases:
                                                      nextAccentPhrases.data
                                                          ?.toList());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                        ),
                                        child: null,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    if (accentPhraseIndex <
                        (audioItem.accentPhrases ?? []).length - 1)
                      SizedBox(
                        width: 40,
                        child: TextButton(
                          child: Transform.rotate(
                            angle: 0.75,
                            child: const Icon(Icons.close_fullscreen),
                          ),
                          onPressed: () {
                            print('merge');
                          },
                        ),
                      ),
                  ],
                ),
              );
            })
            .values
            .toList(),
      ),
    );
  }
}
