import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:share/share.dart';

import '../providers.dart';
import '../models/audio_item.dart';
import '../widgets/audio_accent_form.dart';
import '../widgets/audio_general_form.dart';
import '../widgets/audio_intonation_form.dart';

final placeholder = AudioItem(text: '');

final _selectedTabIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final _isPlayingProvider = StateProvider<bool>(
  (ref) => false,
);

class EditorScreen extends HookConsumerWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedAudioIdProvider);
    final items = ref.watch(audioItemListProvider);

    final audioItem =
        items.firstWhere((item) => item.id == id, orElse: () => placeholder);

    final selectedTabIndex = ref.watch(_selectedTabIndexProvider).state;
    final isPlaying = ref.watch(_isPlayingProvider).state;

    final textController = useTextEditingController(text: audioItem.text);
    final textFocusNode = useFocusNode();

    final api = ref.watch(defaultApiProvider).state;

    useEffect(() {
      listener() async {
        if (textFocusNode.hasFocus || audioItem.text.isEmpty) {
          return;
        }

        final accentPhrases = await audioItem.fetchAccentPhrases(
            api, audioItem.text, audioItem.speaker);
        ref
            .read(audioItemListProvider.notifier)
            .update(id: id, accentPhrases: accentPhrases);
      }

      textFocusNode.addListener(listener);
      return () => textFocusNode.removeListener(listener);
    }, [textFocusNode, audioItem]);

    final onPlay = useCallback(() async {
      ref.read(_isPlayingProvider).state = true;

      final path = await audioItem.play(api);
      ref
          .read(audioItemListProvider.notifier)
          .update(id: id, generatedPath: path);

      Audio.loadFromAbsolutePath(path).play();

      ref.read(_isPlayingProvider).state = false;
    }, [api, audioItem]);

    final onChangeText = useCallback((nextText) async {
      ref.read(audioItemListProvider.notifier).update(id: id, text: nextText);
    }, [id]);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              initialValue: '',
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 'export':
                    Share.shareFiles([audioItem.generatedPath!]);
                    break;
                  case 'delete':
                    Navigator.pop(context);
                    ref
                        .read(audioItemListProvider.notifier)
                        .delete(audioItem.id);
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                if (audioItem.generatedPath?.isNotEmpty ?? false)
                  const PopupMenuItem(
                    child: Text('??????????????????'),
                    value: 'export',
                  ),
                const PopupMenuItem(
                  child: Text('??????'),
                  value: 'delete',
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Visibility(
            child: const LinearProgressIndicator(),
            visible: isPlaying,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: textController,
                    focusNode: textFocusNode,
                    onChanged: onChangeText,
                    autofocus: audioItem.accentPhrases == null,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: audioItem.accentPhrases == null || isPlaying
                          ? null
                          : onPlay,
                      child: const Text('??????'),
                    ),
                  ),
                  ToggleButtons(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text('??????'),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text('???????????????'),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text('????????????????????????'),
                      ),
                    ],
                    onPressed: (int index) {
                      ref.read(_selectedTabIndexProvider).state = index;
                    },
                    isSelected:
                        [0, 1, 2].map((i) => i == selectedTabIndex).toList(),
                  ),
                  if (selectedTabIndex == 0)
                    AudioGeneralForm(audioItem: audioItem),
                  if (selectedTabIndex == 1)
                    AudioAccentForm(audioItem: audioItem),
                  if (selectedTabIndex == 2)
                    AudioIntonationForm(audioItem: audioItem),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
