import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                                children: [
                                  Column(
                                    children: [
                                      Radio<int>(
                                        value: moraIndex + 1,
                                        groupValue: accentPhrase.accent,
                                        onChanged: (nextAccent) async {
                                          final nextAccentPhrases =
                                              await audioItem.updateAccent(
                                                  api,
                                                  accentPhraseIndex,
                                                  moraIndex,
                                                  nextAccent!);
                                          ref
                                              .read(audioItemListProvider
                                                  .notifier)
                                              .update(
                                                  id: audioItem.id,
                                                  accentPhrases:
                                                      nextAccentPhrases);
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
                                          final nextAccentPhrases =
                                              await audioItem
                                                  .splitAccentPhrases(
                                                      api,
                                                      accentPhraseIndex,
                                                      moraIndex);
                                          ref
                                              .read(audioItemListProvider
                                                  .notifier)
                                              .update(
                                                  id: audioItem.id,
                                                  accentPhrases:
                                                      nextAccentPhrases);
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
                          onPressed: () async {
                            final nextAccentPhrases = await audioItem
                                .mergeAccentPhrases(api, accentPhraseIndex);
                            ref.read(audioItemListProvider.notifier).update(
                                id: audioItem.id,
                                accentPhrases: nextAccentPhrases);
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
