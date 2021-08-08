import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voivo/main.dart';

import 'package:voivo/providers.dart';

void main() {
  testWidgets('main', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            initializeProvider.overrideWithValue(const AsyncValue.loading()),
          ],
          child: const App(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
