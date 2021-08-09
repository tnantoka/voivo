import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'list_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(initializeProvider);

    return initialize.when(
      data: (_) => const ListScreen(),
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Voivo'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) {
        print(err); // ignore: avoid_print

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          _showErrorDialog(context);
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text('Voivo'),
          ),
        );
      },
    );
  }

  _showErrorDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('エラー'),
          content: const Text('初期化に失敗しました.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
