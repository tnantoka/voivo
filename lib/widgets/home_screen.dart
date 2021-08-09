import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers.dart';
import '../utils.dart';
import 'list_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final host = ref.watch(hostProvider).state;

    final initializeApi = ref.watch(initializeApiProvider(host));
    final textController = useTextEditingController(text: apiBase(host));

    return initializeApi.when(
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
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(hostProvider).state = textController.value.text;
                    },
                    child: const Text('接続'),
                  ),
                ),
              ],
            ),
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
