import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:voivo/widgets/editor_screen.dart';
import 'package:voivo/providers.dart';
import 'package:voivo/models/audio_item.dart';
import 'package:voivo/models/audio_item_list.dart';

void main() {
  testWidgets('EditorScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            audioItemListProvider.overrideWithValue(
              AudioItemList([
                AudioItem(id: 'id-0', text: 'テストです'),
              ]),
            ),
            initializeApiProvider.overrideWithProvider(
                (value) => Provider((ref) => const AsyncValue.data(null))),
            selectedAudioIdProvider.overrideWithValue('id-0'),
          ],
          child: const EditorScreen(),
        ),
      ),
    );

    expect(find.text('テストです'), findsOneWidget);
  });
}
