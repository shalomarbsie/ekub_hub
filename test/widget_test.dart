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

    await tester.tap(find.text('Continue to demo'));
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

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('Equb Details'), findsNothing);
    expect(find.text('Merchant Equb'), findsOneWidget);
  });
}
