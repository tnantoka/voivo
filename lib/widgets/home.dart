import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class Home extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(initializeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Example')),
      body: initialize.when(
        data: (_) {},
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) {
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
                const Text('初期化に失敗しました.'),
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
