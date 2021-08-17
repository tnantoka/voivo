import 'dart:io';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';

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

final initializeProvider = FutureProvider.family<void, DateTime>(
    (ProviderRef<AsyncValue<void>> ref, hostUpdatedAt) async {
  await initializeItems(ref);
  await initializeApi(ref);

  return;
});

initializeItems(ProviderRef<AsyncValue<void>> ref) async {
  final directory =
      Directory('${(await getApplicationDocumentsDirectory()).path}/items');
  await directory.create();

  final List<AudioItem> items = [];
  await for (final entry in directory.list()) {
    if (!entry.path.endsWith('.json')) {
      continue;
    }

    final jsonString = await File(entry.path).readAsString();
    Map<String, dynamic> audioItemMap = json.decode(jsonString);
    final audioItem = AudioItem.fromJson(audioItemMap);

    items.add(audioItem);
  }

  items.sort((a, b) => a.createdAt.compareTo(b.createdAt));

  if (items.isNotEmpty) {
    ref.read(audioItemListProvider.notifier).set(items);
  } else {
    ref.read(audioItemListProvider).forEach((item) {
      ref.read(audioItemListProvider.notifier).save(item);
    });
  }
}

initializeApi(ref) async {
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
}
