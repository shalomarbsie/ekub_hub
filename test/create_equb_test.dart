import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Create Equb form validates input, updates Dashboard, and opens Equb Details',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Sign in as Organizer'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DrawerButton));
      await tester.pumpAndSettle();

      final createEqubDrawerItem = find.descendant(
        of: find.byType(Drawer),
        matching: find.text('Create Equb'),
      );
      await tester.tap(createEqubDrawerItem);
      await tester.pumpAndSettle();

      final submitButton = find.widgetWithText(FilledButton, 'Create Equb');
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(find.text('Enter an Equb name.'), findsOneWidget);
      expect(find.text('Enter a positive amount.'), findsOneWidget);
      expect(find.text('Enter at least 2 members.'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Equb name'),
        'Neighbors Equb',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Contribution amount (ETB)'),
        '1500',
      );

      await tester.tap(find.text('Weekly'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Monthly').last);
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Max members'),
        '8',
      );

      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Neighbors Equb'), findsOneWidget);
      expect(
        find.text('1500 ETB • Monthly • 8 members max'),
        findsOneWidget,
      );

      await tester.tap(find.text('Neighbors Equb'));
      await tester.pumpAndSettle();

      expect(find.text('Equb Details'), findsOneWidget);
      expect(find.text('Neighbors Equb'), findsOneWidget);
      expect(find.text('1 / 8 members'), findsOneWidget);
      expect(find.text('Round 1 • Open'), findsOneWidget);
      expect(find.text('AI Summary'), findsOneWidget);
      expect(find.text('Demo Organizer'), findsOneWidget);
    },
  );
}
