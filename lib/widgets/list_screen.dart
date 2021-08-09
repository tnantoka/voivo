import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(audioItemListProvider);
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voivo'),
      ),
      body: ListView.separated(
        controller: scrollController,
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
                child: Text('S${item.speaker}'),
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
}
