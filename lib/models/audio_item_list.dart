import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:openapi/openapi.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'audio_item.dart';

class AudioItemList extends StateNotifier<List<AudioItem>> {
  AudioItemList([List<AudioItem>? audioItems]) : super(audioItems ?? []);

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();

    super.dispose();
  }

  void set(List<AudioItem> audioItems) {
    state = [...audioItems];
  }

  void add(String text) {
    state = [
      ...state,
      AudioItem(
        text: text,
      ),
    ];
  }

  void update({
    required String id,
    String? text,
    int? speacker,
    List<AccentPhrase>? accentPhrases,
    num? intonationScale,
    num? pitchScale,
    num? speedScale,
    String? generatedPath,
  }) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final prevItem = state.firstWhere((item) => item.id == id);
      final nextItem = prevItem.copyWith(
        text: text,
        speaker: speacker,
        accentPhrases: accentPhrases,
        intonationScale: intonationScale,
        pitchScale: pitchScale,
        speedScale: speedScale,
        generatedPath: generatedPath,
      );

      state = state.map((item) {
        if (item.id == id) {
          return nextItem;
        } else {
          return item;
        }
      }).toList();

      save(nextItem);
    });
  }

  void delete(String id) async {
    state = state.where((item) => item.id != id).toList();

    final file = await _file(id);
    if (await file.exists()) {
      (await _file(id)).delete();
    }
  }

  void save(AudioItem item) async {
    (await _file(item.id)).writeAsString(json.encode(item));
  }

  Future<File> _file(id) async {
    return File(
        '${(await getApplicationDocumentsDirectory()).path}/items/$id.json');
  }
}
