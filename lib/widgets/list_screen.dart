import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(audioItemListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voivo'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
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
                child: Text(item.speaker.toString()),
              ),
              title: Text(item.text),
              onTap: () {
                Navigator.pushNamed(context, '/edit/${item.id}');
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
