import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

apiBase(String host, SharedPreferences? prefs) {
  if (host.isNotEmpty) {
    return host;
  }

  return prefs?.getString('host') ?? dotenv.env['API_BASE_PATH'] ?? '';
}
