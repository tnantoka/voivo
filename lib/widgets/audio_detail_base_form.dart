import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

import '../models/audio_item.dart';
import '../providers.dart';

class AudioDetailBaseForm extends HookConsumerWidget {
  const AudioDetailBaseForm({Key? key, required this.audioItem})
      : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }

  splitButton(
    DefaultApi api,
    int accentPhraseIndex,
    int moraIndex,
    AccentPhrase accentPhrase,
    WidgetRef ref,
  ) {
    return (moraIndex < accentPhrase.moras.length - 1)
        ? PopupMenuButton<String>(
            initialValue: '',
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              switch (value) {
                case 'split':
                  final nextAccentPhrases = await audioItem.splitAccentPhrases(
                      api, accentPhraseIndex, moraIndex);
                  ref.read(audioItemListProvider.notifier).update(
                      id: audioItem.id, accentPhrases: nextAccentPhrases);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('分割'),
                value: 'split',
              ),
            ],
          )
        : IconButton(
            icon: Container(),
            onPressed: null,
          );
  }

  addMergeButton(
    DefaultApi api,
    int accentPhraseIndex,
    WidgetRef ref,
    List<Widget> children,
  ) {
    if (accentPhraseIndex < (audioItem.accentPhrases ?? []).length - 1) {
      children.add(
        ListTile(
          trailing: IconButton(
            icon: const Icon(Icons.vertical_align_center),
            onPressed: () async {
              final nextAccentPhrases =
                  await audioItem.mergeAccentPhrases(api, accentPhraseIndex);
              ref
                  .read(audioItemListProvider.notifier)
                  .update(id: audioItem.id, accentPhrases: nextAccentPhrases);
            },
          ),
        ),
      );
    }
  }
}
