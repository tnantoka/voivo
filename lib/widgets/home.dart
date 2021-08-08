import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import 'audio_form.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(initializeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voivo'),
      ),
      body: initialize.when(
        data: (_) => const AudioForm(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) {
          print(err);
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            _showErrorDialog(context);
          });
        },
      ),
    );
  }

  _showErrorDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('エラー'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('初期化に失敗しました.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
