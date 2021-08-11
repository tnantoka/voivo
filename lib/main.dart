import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'providers.dart';
import 'widgets/home_screen.dart';
import 'widgets/editor_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return null;
        }

        final components = settings.name!.split('/');
        Widget? result;
        if (settings.name!.startsWith('/edit/') && components.length == 3) {
          result = ProviderScope(
            overrides: [
              selectedAudioIdProvider.overrideWithValue(components.last),
            ],
            child: const EditorScreen(),
          );
        }

        if (result == null) {
          return null;
        }

        return MaterialPageRoute<void>(builder: (context) => result!);
      },
    );
  }
}
