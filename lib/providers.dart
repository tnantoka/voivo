import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openapi/openapi.dart';

final defaultApiProvider = StateProvider<DefaultApi>(
  (ref) => Openapi().getDefaultApi(),
);
final versionProvider = StateProvider<String>(
  (ref) => '',
);

final initializeProvider = FutureProvider<void>((ref) async {
  await dotenv.load(fileName: '.env');

  final defaultApi =
      Openapi(basePathOverride: dotenv.env['API_BASE_PATH']).getDefaultApi();
  final version = await defaultApi.versionVersionGet();

  ref.read(defaultApiProvider).state = defaultApi;
  ref.read(versionProvider).state = version.toString();

  return;
});
