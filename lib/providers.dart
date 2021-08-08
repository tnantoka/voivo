import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openapi/openapi.dart';

final defaultApiProvider = StateProvider<DefaultApi>(
  (ref) => Openapi().getDefaultApi(),
);
final versionProvider = StateProvider<String>(
  (ref) => '',
);
final speakerProvider = StateProvider<int>(
  (ref) => 0,
);

final initializeProvider = FutureProvider<void>((ref) async {
  await dotenv.load(fileName: '.env');

  final dio = Openapi().dio;
  dio.options.connectTimeout = 30000;
  dio.options.baseUrl = dotenv.env['API_BASE_PATH'] ?? '';

  final defaultApi = Openapi(dio: dio).getDefaultApi();
  final version = await defaultApi.versionVersionGet();

  ref.read(defaultApiProvider).state = defaultApi;
  ref.read(versionProvider).state = version.toString();

  return;
});
