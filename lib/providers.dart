import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/audio_item.dart';
import 'models/audio_item_list.dart';

final defaultApiProvider = StateProvider<DefaultApi>(
  (ref) => Openapi().getDefaultApi(),
);
final versionProvider = StateProvider<String>(
  (ref) => '',
);
final hostProvider = StateProvider<String>(
  (ref) => '',
);
final hostUpdatedAtProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
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
    FutureProvider.family<void, DateTime>((ref, hostUpdatedAt) async {
  final dio = Openapi().dio;

  final prefs = await SharedPreferences.getInstance();
  final host = prefs.getString('host') ?? dotenv.env['API_BASE_PATH'] ?? '';

  dio.options.baseUrl = host;
  ref.read(hostProvider).state = host;

  final defaultApi = Openapi(dio: dio).getDefaultApi();

  dio.options.connectTimeout = 1000;
  final version = await defaultApi.versionVersionGet();
  ref.read(versionProvider).state = version.toString();

  dio.options.connectTimeout = 60000;
  ref.read(defaultApiProvider).state = defaultApi;

  return;
});
