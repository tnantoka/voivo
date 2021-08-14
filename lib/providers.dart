import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

import 'models/audio_item.dart';
import 'models/audio_item_list.dart';
import 'utils.dart';

final defaultApiProvider = StateProvider<DefaultApi>(
  (ref) => Openapi().getDefaultApi(),
);
final versionProvider = StateProvider<String>(
  (ref) => '',
);
final hostProvider = StateProvider<String>(
  (ref) => '',
);

final audioItemListProvider =
    StateNotifierProvider<AudioItemList, List<AudioItem>>((ref) {
  return AudioItemList([
    AudioItem(text: 'あ、こんにちは'),
    AudioItem(text: 'いいお天気ですね', speaker: 1),
  ]);
});

final selectedAudioIdProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

final initializeApiProvider =
    FutureProvider.family<void, String>((ref, host) async {
  final dio = Openapi().dio;
  dio.options.baseUrl = apiBase(host);

  final defaultApi = Openapi(dio: dio).getDefaultApi();

  dio.options.connectTimeout = 1000;
  final version = await defaultApi.versionVersionGet();

  dio.options.connectTimeout = 60000;
  ref.read(defaultApiProvider).state = defaultApi;
  ref.read(versionProvider).state = version.toString();

  return;
});
