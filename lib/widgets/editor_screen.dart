import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/built_collection.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:path_provider/path_provider.dart';

import '../providers.dart';

class EditorScreen extends HookConsumerWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedAudioIdProvider);
    final items = ref.watch(audioItemListProvider);
    final audioItem = items.firstWhere((item) => item.id == id);

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
      if (audioItem.generatedPath != null) {
        print('using cache');
        Audio.loadFromAbsolutePath(audioItem.generatedPath!).play();
        return;
      }

      final audioQuery = AudioQuery((builder) {
        builder.accentPhrases = ListBuilder(audioItem.accentPhrases!);
        builder.intonationScale = audioItem.intonationScale;
        builder.pitchScale = audioItem.pitchScale;
        builder.speedScale = audioItem.speedScale;
      });

      final res = await api.synthesisSynthesisPost(
          speaker: audioItem.speaker, audioQuery: audioQuery);

      final path =
          '${(await getApplicationDocumentsDirectory()).path}/${audioItem.id}.wav';
      print(path);
      await File(path).writeAsBytes(res.data!);

      ref
          .read(audioItemListProvider.notifier)
          .update(id: id, generatedPath: path);

      Audio.loadFromAbsolutePath(path).play();
    }, [api, audioItem]);

    final onChangeText = useCallback((nextText) async {
      ref.read(audioItemListProvider.notifier).update(id: id, text: nextText);
    }, [id]);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: textController,
                focusNode: textFocusNode,
                onChanged: onChangeText,
                autofocus: audioItem.accentPhrases == null,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: audioItem.accentPhrases == null ? null : onPlay,
                  child: const Text('再生'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
