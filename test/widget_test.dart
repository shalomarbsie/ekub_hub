import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Opens Merchant Equb details and returns to Dashboard', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
    await tester.pumpAndSettle();

    expect(find.text('Sign In'), findsOneWidget);

    await tester.tap(find.text('Sign in as Member'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DrawerButton));
    await tester.pumpAndSettle();

    final dashboardDrawerItem = find.descendant(
      of: find.byType(Drawer),
      matching: find.text('Dashboard'),
    );
    await tester.tap(dashboardDrawerItem);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Merchant Equb'));
    await tester.pumpAndSettle();

    expect(find.text('Equb Details'), findsOneWidget);
    expect(find.text('Equb ID: equb-merchant'), findsOneWidget);

    expect(find.text('Contribution Review'), findsNothing);

    await tester.tap(find.text('Contribution Submission'));
    await tester.pumpAndSettle();

    expect(
      find.text('Equb ID: equb-merchant\nRound ID: round-merchant-03'),
      findsOneWidget,
    );

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('Equb Details'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('Equb Details'), findsNothing);
    expect(find.text('Merchant Equb'), findsOneWidget);

    await tester.tap(find.text('Family Equb'));
    await tester.pumpAndSettle();

    expect(find.text('Contribution Submission'), findsNothing);

    await tester.tap(find.text('Payout & Draw'));
    await tester.pumpAndSettle();

    expect(
      find.text('Equb ID: equb-family\nRound ID: round-family-02'),
      findsOneWidget,
    );

    await tester.tap(find.byType(DrawerButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign out'));
    await tester.pumpAndSettle();

    expect(find.text('Sign In'), findsOneWidget);
  });
}
