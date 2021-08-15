import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'audio_detail_base_form.dart';

class AudioAccentForm extends AudioDetailBaseForm {
  const AudioAccentForm({Key? key, audioItem})
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
                leading: Visibility(
                  child: Radio<int>(
                    value: moraIndex + 1,
                    groupValue: accentPhrase.accent,
                    onChanged: (nextAccent) async {
                      final nextAccentPhrases = await audioItem.updateAccent(
                          api, accentPhraseIndex, moraIndex, nextAccent!);
                      ref.read(audioItemListProvider.notifier).update(
                          id: audioItem.id, accentPhrases: nextAccentPhrases);
                    },
                  ),
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: accentPhrase.moras.length > 1,
                ),
                title: Text(mora.text),
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
