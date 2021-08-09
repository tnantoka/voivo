import 'package:openapi/openapi.dart';
import 'package:riverpod/riverpod.dart';

import 'audio_item.dart';

class AudioItemList extends StateNotifier<List<AudioItem>> {
  AudioItemList([List<AudioItem>? audioItems]) : super(audioItems ?? []);

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
  }

  void updateAccent(String id, int index, int accent) {}

  void delete(String id) async {
    state = state.where((item) => item.id != id).toList();
  }
}
