import 'package:ekub_hub/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Dashboard renders Equb groups and tapping one opens Equb Details with roster and AI summary',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Sign in as Member'));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Merchant Equb'), findsOneWidget);
      expect(
        find.text('2000 ETB • Weekly • 10 members max'),
        findsOneWidget,
      );
      expect(find.text('Family Equb'), findsOneWidget);

      await tester.tap(find.text('Merchant Equb'));
      await tester.pumpAndSettle();

      expect(find.text('Equb Details'), findsOneWidget);
      expect(find.text('Merchant Equb'), findsOneWidget);
      expect(
        find.text('Members declare a weekly contribution of 2,000 ETB.'),
        findsOneWidget,
      );
      expect(find.text('Round 3 • Open'), findsOneWidget);

      expect(find.text('AI Summary'), findsOneWidget);
      expect(find.text('Sample'), findsOneWidget);
      expect(
        find.text(
          'Round 3 is open: 1 of 2 active members have paid (2000 of 4000 ETB). 1 contribution(s) remaining.',
        ),
        findsOneWidget,
      );

      expect(find.text('Member Roster'), findsOneWidget);
      expect(find.text('Demo Organizer'), findsOneWidget);
      expect(find.text('Demo Member'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.text('Pending'), findsOneWidget);
    },
  );
}
