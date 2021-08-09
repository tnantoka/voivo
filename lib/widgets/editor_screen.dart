import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:voivo/models/audio_item.dart';
import 'package:voivo/widgets/audio_accent_form.dart';
import 'package:voivo/widgets/audio_general_form.dart';
import 'package:voivo/widgets/audio_intonation_form.dart';

import '../providers.dart';

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

        final response = await api.accentPhrasesAccentPhrasesPost(
            text: audioItem.text, speaker: audioItem.speaker);
        final accentPhrases = response.data!.toList();

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
                const PopupMenuItem(
                  child: Text('エクスポート'),
                  value: 'export',
                ),
                const PopupMenuItem(
                  child: Text('削除'),
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
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
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
                    child: const Text('再生'),
                  ),
                ),
                ToggleButtons(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('設定'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('アクセント'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('イントネーション'),
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
        ]),
      ),
    );
  }
}
