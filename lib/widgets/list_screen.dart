import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(audioItemListProvider);
    final version = ref.watch(versionProvider).state;
    final host = ref.watch(hostProvider).state;

    final scrollController = useScrollController();
    final textController = useTextEditingController(text: host);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voivo',
          textScaleFactor: 1.4,
          style: TextStyle(fontFamily: 'KaushanScript'),
        ),
        brightness: Brightness.dark,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 84,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(host),
                    Text(version),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('APIホスト変更'),
              onTap: () {
                Navigator.pop(context);
                _showApiHostDialog(context, ref, textController);
              },
            ),
            ListTile(
              title: const Text('VOICEVOX'),
              onTap: () {
                Navigator.pop(context);
                launch('https://github.com/Hiroshiba/voicevox');
              },
            ),
            ListTile(
              title: const Text('その他のライセンス情報'),
              onTap: () {
                Navigator.pop(context);
                showLicensePage(
                  context: context,
                  applicationName: 'Voivo',
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Dismissible(
            key: ValueKey(item.id),
            onDismissed: (_) {
              ref.read(audioItemListProvider.notifier).delete(item.id);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text('S${item.speaker}'),
              ),
              title: Text(item.text),
              onTap: () {
                Navigator.pushNamed(context, '/edit/${item.id}');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(audioItemListProvider.notifier).add('');

          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showApiHostDialog(BuildContext context, WidgetRef ref,
      TextEditingController textController) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('APIホスト変更'),
            content: TextField(
              onChanged: (value) {},
              controller: textController,
            ),
            actions: [
              TextButton(
                child: const Text('キャンセル'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  // FIXME: A TextEditingController was used after being disposed.
                  Future.delayed(const Duration(milliseconds: 300)).then((_) {
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setString('host', textController.value.text);
                      ref.read(hostUpdatedAtProvider).state = DateTime.now();
                    });
                  });
                  // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  //   ref.read(hostProvider).state = textController.value.text;
                  // });
                },
              ),
            ],
          );
        });
  }
}
