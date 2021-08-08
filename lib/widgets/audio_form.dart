import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/built_collection.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:path_provider/path_provider.dart';

import '../providers.dart';

class AudioForm extends HookConsumerWidget {
  const AudioForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    textController.text = 'こんにちは';
    final textFocusNode = useFocusNode();

    final api = ref.watch(defaultApiProvider).state;
    final speaker = ref.watch(speakerProvider).state;

    useEffect(() {
      textFocusNode.addListener(() async {
        if (!textFocusNode.hasFocus) {
          print(textController.value.text);
        }
      });
    }, [textFocusNode, api, speaker]);

    final onPlay = useCallback(() async {
      final response = await api.accentPhrasesAccentPhrasesPost(
          text: textController.value.text, speaker: speaker);
      final accentPhrases = response.data!.toList();
      print(accentPhrases);

      final audioQuery = AudioQuery((builder) {
        builder.accentPhrases = ListBuilder(accentPhrases);
        builder.intonationScale = 1.0;
        builder.pitchScale = 0.0;
        builder.speedScale = 1.0;
      });

      final res = await api.synthesisSynthesisPost(
          speaker: speaker, audioQuery: audioQuery);

      final path =
          '${(await getApplicationDocumentsDirectory()).path}/audio.wav';
      print(path);
      await File(path).writeAsBytes(res.data!);

      Audio.loadFromAbsolutePath(path)..play();
    }, [textFocusNode, api, speaker]);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: textController,
              focusNode: textFocusNode,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPlay,
                child: const Text('再生'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
