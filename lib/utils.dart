import 'package:flutter_dotenv/flutter_dotenv.dart';

apiBase(host) => host.isEmpty ? dotenv.env['API_BASE_PATH'] ?? '' : host;
