import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:voivo/widgets/list_screen.dart';
import 'package:voivo/providers.dart';
import 'package:voivo/models/audio_item.dart';
import 'package:voivo/models/audio_item_list.dart';

void main() async {
  testWidgets('ListScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            audioItemListProvider.overrideWithValue(
              AudioItemList([
                AudioItem(id: 'id-0', text: 'テストです'),
              ]),
            ),
            initializeProvider.overrideWithProvider(
                (value) => Provider((ref) => const AsyncValue.data(null))),
            hostProvider
                .overrideWithValue(StateController('http://example.com')),
          ],
          child: const ListScreen(),
        ),
      ),
    );

    expect(find.text('テストです'), findsOneWidget);

    await tester.drag(find.text('テストです'), const Offset(1000, 0));
    await tester.pumpAndSettle();
    expect(find.text('テストです'), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.byType(ListTile), findsOneWidget);
  });
}
