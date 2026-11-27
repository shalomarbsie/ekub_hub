import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Cross-feature flow: Prospect joins via QR, Organizer creates Equb and checks Payout & Draw',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
      await tester.pumpAndSettle();

      // 1. Prospect signs in and requests to join Merchant Equb via QR scan.
      await tester.tap(find.text('Sign in as Prospect'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DrawerButton));
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(
          of: find.byType(Drawer),
          matching: find.text('QR Scanner & Join'),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('scan-button')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('equb-preview-card')), findsOneWidget);
      expect(find.text('Merchant Equb'), findsOneWidget);

      await tester.tap(find.byKey(const Key('request-join-button')));
      await tester.pumpAndSettle();
      expect(find.text('Pending approval'), findsOneWidget);

      await tester.tap(find.byType(DrawerButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sign out'));
      await tester.pumpAndSettle();
      expect(find.text('Sign In'), findsOneWidget);

      // 2. Organizer signs in, creates a new Equb, and inspects Details & Payout.
      await tester.tap(find.text('Sign in as Organizer'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DrawerButton));
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(
          of: find.byType(Drawer),
          matching: find.text('Create Equb'),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Equb name'),
        'Office Equb',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Contribution amount (ETB)'),
        '1000',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Max members'),
        '4',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Create Equb'));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Office Equb'), findsOneWidget);

      await tester.tap(find.text('Office Equb'));
      await tester.pumpAndSettle();
      expect(find.text('Equb Details'), findsOneWidget);
      expect(find.text('1 / 4 members'), findsOneWidget);
      expect(find.text('Round 1 • Open'), findsOneWidget);
      expect(find.text('AI Summary'), findsOneWidget);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Merchant Equb'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Payout & Draw'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Payout & Draw'));
      await tester.pumpAndSettle();
      expect(find.text('Payout & draw'), findsOneWidget);
    },
  );
}
