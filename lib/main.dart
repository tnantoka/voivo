import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openapi/openapi.dart';

import 'widgets/home.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  final api =
      Openapi(basePathOverride: dotenv.env['API_BASE_PATH']).getDefaultApi();
  final response = await api.versionVersionGet();
  print(response);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
