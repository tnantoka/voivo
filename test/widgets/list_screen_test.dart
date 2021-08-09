import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:voivo/widgets/list_screen.dart';
import 'package:voivo/providers.dart';

void main() async {
  testWidgets('ListScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            initializeApiProvider.overrideWithProvider(
                (value) => Provider((ref) => const AsyncValue.data(null))),
            hostProvider
                .overrideWithValue(StateController('http://example.com')),
          ],
          child: const ListScreen(),
        ),
      ),
    );

    expect(find.text('こんにちは'), findsOneWidget);
    expect(find.text('いいお天気ですね'), findsOneWidget);

    await tester.drag(find.text('こんにちは'), const Offset(1000, 0));
    await tester.pumpAndSettle();
    expect(find.text('こんにちは'), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.byType(ListTile), findsNWidgets(2));
  });
}
