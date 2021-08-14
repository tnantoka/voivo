import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'audio_detail_base_form.dart';

class AudioIntonationForm extends AudioDetailBaseForm {
  const AudioIntonationForm({Key? key, audioItem})
      : super(key: key, audioItem: audioItem);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(defaultApiProvider).state;

    final List<Widget> children = [];

    (audioItem.accentPhrases ?? []).asMap().forEach(
      (accentPhraseIndex, accentPhrase) {
        accentPhrase.moras.asMap().forEach(
          (moraIndex, mora) {
            children.add(
              ListTile(
                leading: Text(mora.text),
                title: (mora.pitch > 0)
                    ? Slider(
                        min: 3,
                        max: 6.5,
                        divisions: 35,
                        value: mora.pitch.toDouble(),
                        onChanged: (nextPitch) {
                          final nextAccentPhrases = audioItem.updatePicth(
                              api, accentPhraseIndex, moraIndex, nextPitch);
                          ref.read(audioItemListProvider.notifier).update(
                              id: audioItem.id,
                              accentPhrases: nextAccentPhrases);
                        },
                      )
                    : null,
                trailing: splitButton(
                    api, accentPhraseIndex, moraIndex, accentPhrase, ref),
              ),
            );
          },
        );
        addMergeButton(api, accentPhraseIndex, ref, children);
      },
    );

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: children.length,
          itemBuilder: (BuildContext context, int index) => children[index],
        ),
      ),
    );
  }
}
