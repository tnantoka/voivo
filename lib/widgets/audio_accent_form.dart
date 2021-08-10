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
                                        if (accentPhrase.pauseMora != null) {
                                          final pauseMora = MoraBuilder();
                                          pauseMora
                                              .replace(accentPhrase.pauseMora!);
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
                                          .read(audioItemListProvider.notifier)
                                          .update(
                                              id: audioItem.id,
                                              accentPhrases: nextAccentPhrases
                                                  .data
                                                  ?.toList());
                                    },
                                  ),
                                  Text(mora.text),
                                ],
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    // TextButton(
                    //   child: Text('a'),
                    //   onPressed: () {},
                    // ),
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
