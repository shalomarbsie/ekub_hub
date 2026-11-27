import 'dart:math';

import 'package:ekub_hub/core/demo/demo_ids.dart';
import 'package:ekub_hub/features/auth/presentation/providers/session_provider.dart';
import 'package:ekub_hub/features/contributions/presentation/contribution_providers.dart';
import 'package:ekub_hub/features/payouts/data/in_memory_payout_repository.dart';
import 'package:ekub_hub/features/payouts/domain/payout_draw.dart';
import 'package:ekub_hub/features/payouts/domain/payout_repository.dart';
import 'package:ekub_hub/features/payouts/presentation/payout_draw_screen.dart';
import 'package:ekub_hub/features/payouts/presentation/payout_providers.dart';
import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Payout readiness and draw providers', () {
    test('loads seeded Family winner history and Merchant live readiness', () {
      final container = ProviderContainer.test();

      final familyReadiness = container.read(
        payoutReadinessProvider((
          equbId: DemoIds.familyEqubId,
          roundId: DemoIds.familyRoundId,
        )),
      )!;
      expect(familyReadiness.currentRoundDraw?.winnerName, 'Demo Member');
      expect(familyReadiness.pastDraws, hasLength(2));
      expect(familyReadiness.pastDraws.first.draw.periodNumber, 2);
      expect(familyReadiness.pastDraws.last.winnerName, 'Demo Organizer');
      expect(familyReadiness.eligibleMembers, isEmpty);
      expect(familyReadiness.isReadyForDraw, isFalse);

      final merchantReadiness = container.read(
        payoutReadinessProvider((
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        )),
      )!;
      expect(merchantReadiness.totalActiveMembers, 2);
      expect(merchantReadiness.approvedCount, 1);
      expect(merchantReadiness.notSubmittedCount, 1);
      expect(merchantReadiness.isContributionComplete, isFalse);
      expect(merchantReadiness.isReadyForDraw, isFalse);
      expect(merchantReadiness.eligibleMembers, hasLength(1));
      expect(
        merchantReadiness.eligibleMembers.single.membership.id,
        DemoIds.merchantMemberMembershipId,
      );
      expect(merchantReadiness.pastDraws, hasLength(1));
    });

    test('enforces organizer, contribution readiness, and single-draw guards', () {
      final container = ProviderContainer.test();
      final session = container.read(sessionProvider.notifier);
      final payouts = container.read(payoutDrawsProvider.notifier);

      expect(
        () => payouts.runDraw(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        ),
        throwsA(isA<PayoutValidationException>()),
      );

      session.signInAsDemo(DemoIds.memberUserId);
      expect(
        () => payouts.runDraw(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        ),
        throwsA(isA<PayoutValidationException>()),
      );

      session.signInAsDemo(DemoIds.organizerUserId);
      expect(
        () => payouts.runDraw(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        ),
        throwsA(isA<PayoutValidationException>()),
      );
    });

    test(
      'flips ready after contribution approval and executes draw once',
      () {
        final container = ProviderContainer.test();
        final session = container.read(sessionProvider.notifier);
        final contributions = container.read(contributionsProvider.notifier);
        final payouts = container.read(payoutDrawsProvider.notifier);

        session.signInAsDemo(DemoIds.memberUserId);
        final pending = contributions.submitContributionForCurrentUser(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
          declaredAmount: 2000,
        );

        session.signInAsDemo(DemoIds.organizerUserId);
        expect(
          container
              .read(
                payoutReadinessProvider((
                  equbId: DemoIds.merchantEqubId,
                  roundId: DemoIds.merchantRoundId,
                )),
              )!
              .isReadyForDraw,
          isFalse,
        );

        contributions.approveContribution(
          equbId: DemoIds.merchantEqubId,
          contributionId: pending.id,
        );

        final readyState = container.read(
          payoutReadinessProvider((
            equbId: DemoIds.merchantEqubId,
            roundId: DemoIds.merchantRoundId,
          )),
        )!;
        expect(readyState.isContributionComplete, isTrue);
        expect(readyState.isReadyForDraw, isTrue);

        final result = payouts.runDraw(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        );
        expect(result.selectedWinnerMemberId, DemoIds.merchantMemberMembershipId);

        final postDraw = container.read(
          payoutReadinessProvider((
            equbId: DemoIds.merchantEqubId,
            roundId: DemoIds.merchantRoundId,
          )),
        )!;
        expect(postDraw.currentRoundDraw?.winnerName, 'Demo Member');
        expect(postDraw.pastDraws, hasLength(2));
        expect(postDraw.eligibleMembers, isEmpty);
        expect(postDraw.isReadyForDraw, isFalse);

        expect(
          () => payouts.runDraw(
            equbId: DemoIds.merchantEqubId,
            roundId: DemoIds.merchantRoundId,
          ),
          throwsA(isA<PayoutValidationException>()),
        );
      },
    );

    test('resets eligible rotation turns once all active members have won', () {
      final repo = InMemoryPayoutRepository(
        random: Random(0),
        initialDraws: [
          PayoutDraw(
            id: 'draw-m-1',
            equbId: DemoIds.merchantEqubId,
            cyclePeriodId: 'round-merchant-01',
            periodNumber: 1,
            eligibleMemberIds: const [
              DemoIds.merchantOrganizerMembershipId,
              DemoIds.merchantMemberMembershipId,
            ],
            selectedWinnerMemberId: DemoIds.merchantOrganizerMembershipId,
            drawnAt: DateTime.utc(2026, 11, 8),
          ),
          PayoutDraw(
            id: 'draw-m-2',
            equbId: DemoIds.merchantEqubId,
            cyclePeriodId: 'round-merchant-02',
            periodNumber: 2,
            eligibleMemberIds: const [DemoIds.merchantMemberMembershipId],
            selectedWinnerMemberId: DemoIds.merchantMemberMembershipId,
            drawnAt: DateTime.utc(2026, 11, 15),
          ),
        ],
      );
      final container = ProviderContainer.test(
        overrides: [payoutRepositoryProvider.overrideWithValue(repo)],
      );

      final readiness = container.read(
        payoutReadinessProvider((
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        )),
      )!;
      expect(readiness.eligibleMembers, hasLength(2));
      expect(readiness.pastDraws, hasLength(2));
    });
  });

  group('PayoutDrawScreen widget tests', () {
    testWidgets(
      'shows member-only wait state on open round and winner history on Family Equb',
      (tester) async {
        final container = ProviderContainer.test();
        container
            .read(sessionProvider.notifier)
            .signInAsDemo(DemoIds.memberUserId);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: PayoutDrawScreen(
                  equbId: DemoIds.merchantEqubId,
                  roundId: DemoIds.merchantRoundId,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Waiting for contributions'), findsOneWidget);
        expect(find.text('Run draw'), findsNothing);
        expect(
          find.textContaining('only the group organizer can run the draw'),
          findsOneWidget,
        );

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: PayoutDrawScreen(
                  equbId: DemoIds.familyEqubId,
                  roundId: DemoIds.familyRoundId,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Round 2 winner'), findsOneWidget);
        expect(find.text('Past winners (2)'), findsOneWidget);
        expect(find.text('Back to Equb'), findsOneWidget);
      },
    );

    testWidgets(
      'updates live from Waiting -> Ready -> Winner across Contributions and Payouts',
      (tester) async {
        await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in as Member'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Merchant Equb'));
        await _tapVisible(tester, find.text('Contribution Submission'));

        await _tapVisible(
          tester,
          find.byKey(const ValueKey('send-for-review-button')),
        );

        await tester.tap(find.byType(DrawerButton));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Sign out'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in as Organizer'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Merchant Equb'));
        await _tapVisible(tester, find.text('Payout & Draw'));

        expect(find.text('Waiting for contributions'), findsOneWidget);
        final disabledButton = tester.widget<FilledButton>(
          find.byKey(const ValueKey('run-draw-button')),
        );
        expect(disabledButton.onPressed, isNull);

        await tester.tap(find.byTooltip('Back'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Contribution Review'));
        await _tapVisible(
          tester,
          find.byKey(const ValueKey('approve-btn-contrib-100')),
        );

        await tester.tap(find.byTooltip('Back'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Payout & Draw'));

        expect(find.text('Ready for draw'), findsOneWidget);
        final enabledButton = tester.widget<FilledButton>(
          find.byKey(const ValueKey('run-draw-button')),
        );
        expect(enabledButton.onPressed, isNotNull);

        await _tapVisible(
          tester,
          find.byKey(const ValueKey('run-draw-button')),
        );

        expect(find.text('Round 3 winner'), findsOneWidget);
        expect(find.text('Past winners (2)'), findsOneWidget);
        expect(find.text('Back to Equb'), findsOneWidget);
      },
    );
  });
}

Future<void> _tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}
