import 'package:ekub_hub/core/demo/demo_ids.dart';
import 'package:ekub_hub/features/auth/presentation/providers/session_provider.dart';
import 'package:ekub_hub/features/contributions/domain/contribution_record.dart';
import 'package:ekub_hub/features/contributions/domain/contribution_repository.dart';
import 'package:ekub_hub/features/contributions/presentation/contribution_providers.dart';
import 'package:ekub_hub/features/contributions/presentation/contribution_screens.dart';
import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Contributions Riverpod providers with PR #2 session and Equbs', () {
    test('seeds Merchant organizer approved and member unsubmitted', () {
      final container = ProviderContainer.test();

      final merchantRoster = container.read(
        roundRosterStatusProvider((
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        )),
      );
      expect(merchantRoster.totalMembers, 2);
      expect(merchantRoster.approvedCount, 1);
      expect(merchantRoster.pendingCount, 0);
      expect(merchantRoster.notSubmittedCount, 1);
      expect(merchantRoster.notSubmittedEntries.single.memberName, 'Demo Member');
      expect(merchantRoster.isAllApproved, isFalse);

      final familyRoster = container.read(
        roundRosterStatusProvider((
          equbId: DemoIds.familyEqubId,
          roundId: DemoIds.familyRoundId,
        )),
      );
      expect(familyRoster.totalMembers, 2);
      expect(familyRoster.approvedCount, 2);
      expect(familyRoster.isAllApproved, isTrue);
    });

    test('enforces active membership, open round, and organizer role guards', () {
      final container = ProviderContainer.test();
      final session = container.read(sessionProvider.notifier);
      final contributions = container.read(contributionsProvider.notifier);

      expect(
        () => contributions.submitContributionForCurrentUser(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
          declaredAmount: 2000,
        ),
        throwsA(isA<ContributionValidationException>()),
      );

      session.signInAsDemo(DemoIds.prospectUserId);
      expect(
        () => contributions.submitContributionForCurrentUser(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
          declaredAmount: 2000,
        ),
        throwsA(isA<ContributionValidationException>()),
      );

      session.signInAsDemo(DemoIds.memberUserId);
      expect(
        () => contributions.submitContributionForCurrentUser(
          equbId: DemoIds.familyEqubId,
          roundId: DemoIds.familyRoundId,
          declaredAmount: 500,
        ),
        throwsA(isA<ContributionValidationException>()),
      );

      final pending = contributions.submitContributionForCurrentUser(
        equbId: DemoIds.merchantEqubId,
        roundId: DemoIds.merchantRoundId,
        declaredAmount: 2000,
        note: 'Telebirr 421',
      );

      expect(
        () => contributions.approveContribution(
          equbId: DemoIds.merchantEqubId,
          contributionId: pending.id,
        ),
        throwsA(isA<ContributionValidationException>()),
      );
    });

    test('rejects NaN, Infinity, and non-positive declared amounts', () {
      final container = ProviderContainer.test();
      final session = container.read(sessionProvider.notifier);
      final contributions = container.read(contributionsProvider.notifier);

      session.signInAsDemo(DemoIds.memberUserId);

      for (final invalidAmount in [
        double.nan,
        double.infinity,
        double.negativeInfinity,
        0.0,
        -50.0,
      ]) {
        expect(
          () => contributions.submitContributionForCurrentUser(
            equbId: DemoIds.merchantEqubId,
            roundId: DemoIds.merchantRoundId,
            declaredAmount: invalidAmount,
          ),
          throwsA(isA<ContributionValidationException>()),
        );
      }
    });

    test('persists across sign-out and supports reject, resubmit, and approve', () {
      final container = ProviderContainer.test();
      final session = container.read(sessionProvider.notifier);
      final contributions = container.read(contributionsProvider.notifier);

      session.signInAsDemo(DemoIds.memberUserId);
      final submitted = contributions.submitContributionForCurrentUser(
        equbId: DemoIds.merchantEqubId,
        roundId: DemoIds.merchantRoundId,
        declaredAmount: 2000,
        note: 'Cash',
      );

      expect(
        () => contributions.submitContributionForCurrentUser(
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
          declaredAmount: 2000,
        ),
        throwsA(isA<ContributionValidationException>()),
      );

      session.signOut();
      expect(
        container.read(
          contributionsForRoundProvider((
            equbId: DemoIds.merchantEqubId,
            roundId: DemoIds.merchantRoundId,
          )),
        ),
        hasLength(2),
      );

      session.signInAsDemo(DemoIds.organizerUserId);
      expect(
        () => contributions.rejectContribution(
          equbId: DemoIds.merchantEqubId,
          contributionId: submitted.id,
          reason: '  ',
        ),
        throwsA(isA<ContributionValidationException>()),
      );

      final rejected = contributions.rejectContribution(
        equbId: DemoIds.merchantEqubId,
        contributionId: submitted.id,
        reason: 'Missing transfer reference',
      );
      expect(rejected.status, ContributionStatus.rejected);
      expect(rejected.reviewerId, DemoIds.organizerUserId);

      session.signInAsDemo(DemoIds.memberUserId);
      final resubmitted = contributions.submitContributionForCurrentUser(
        equbId: DemoIds.merchantEqubId,
        roundId: DemoIds.merchantRoundId,
        declaredAmount: 2000,
        note: 'Telebirr ref 8841',
      );
      expect(resubmitted.id, submitted.id);
      expect(resubmitted.status, ContributionStatus.pending);

      session.signInAsDemo(DemoIds.organizerUserId);
      final approved = contributions.approveContribution(
        equbId: DemoIds.merchantEqubId,
        contributionId: resubmitted.id,
      );
      expect(approved.status, ContributionStatus.approved);

      final roster = container.read(
        roundRosterStatusProvider((
          equbId: DemoIds.merchantEqubId,
          roundId: DemoIds.merchantRoundId,
        )),
      );
      expect(roster.approvedCount, 2);
      expect(roster.isAllApproved, isTrue);
    });
  });

  group('Contribution screens widget tests', () {
    testWidgets(
      'blocks non-organizer review and completed round submission',
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
                body: ContributionReviewScreen(
                  equbId: DemoIds.merchantEqubId,
                  roundId: DemoIds.merchantRoundId,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text(
            'Only an active organizer of Merchant Equb can review contribution declarations.',
          ),
          findsOneWidget,
        );
        expect(find.text('Approve'), findsNothing);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: ContributionSubmissionScreen(
                  equbId: DemoIds.familyEqubId,
                  roundId: DemoIds.familyRoundId,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Round completed'), findsOneWidget);
        expect(
          find.text(
            'This round is completed. New contribution declarations are closed.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'rejects NaN and Infinity amounts in ContributionSubmissionScreen form',
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
                body: ContributionSubmissionScreen(
                  equbId: DemoIds.merchantEqubId,
                  roundId: DemoIds.merchantRoundId,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        for (final invalidText in ['NaN', 'Infinity', '-Infinity']) {
          await tester.enterText(
            find.byKey(const ValueKey('submission-amount-field')),
            invalidText,
          );
          await _tapVisible(
            tester,
            find.byKey(const ValueKey('send-for-review-button')),
          );

          expect(
            find.text('Enter a valid finite amount greater than 0.'),
            findsOneWidget,
          );
          expect(find.text('Not submitted'), findsOneWidget);
        }
      },
    );

    testWidgets(
      'runs full member submit -> sign out -> organizer review -> updated roster and member status',
      (tester) async {
        final container = ProviderContainer.test();

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const EqubHubApp(),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in as Member'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Merchant Equb'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Contribution Submission'));

        expect(find.text('Not submitted'), findsOneWidget);
        await tester.enterText(
          find.byKey(const ValueKey('submission-note-field')),
          'Paid via Telebirr',
        );
        await _tapVisible(
          tester,
          find.byKey(const ValueKey('send-for-review-button')),
        );

        expect(find.text('Pending review'), findsOneWidget);
        expect(find.text('Submitted (Pending review)'), findsOneWidget);

        await tester.tap(find.byType(DrawerButton));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Sign out'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in as Organizer'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Merchant Equb'));
        await tester.pumpAndSettle();

        await _tapVisible(tester, find.text('Contribution Review'));

        expect(find.text('Pending review (1)'), findsOneWidget);
        expect(find.text('Demo Member'), findsOneWidget);
        expect(find.text('Approved records (1)'), findsOneWidget);

        final memberRecord = container.read(
          memberRoundContributionProvider((
            roundId: DemoIds.merchantRoundId,
            memberId: DemoIds.merchantMemberMembershipId,
          )),
        )!;

        await tester.tap(
          find.byKey(ValueKey('reject-btn-${memberRecord.id}')),
        );
        await tester.pumpAndSettle();
        expect(
          find.text('Reason is required to reject a contribution.'),
          findsOneWidget,
        );

        await tester.tap(
          find.byKey(ValueKey('approve-btn-${memberRecord.id}')),
        );
        await tester.pumpAndSettle();

        expect(find.text('Pending review (0)'), findsOneWidget);
        expect(find.text('Approved records (2)'), findsOneWidget);

        await tester.tap(find.byTooltip('Back'));
        await tester.pumpAndSettle();

        expect(find.text('Equb Details'), findsOneWidget);
        expect(find.text('Paid'), findsNWidgets(2));
        expect(find.text('Pending'), findsNothing);
        expect(
          find.text(
            'Round 3 is open: 2 of 2 active members have paid (4000 of 4000 ETB). 0 contribution(s) remaining.',
          ),
          findsOneWidget,
        );

        await tester.tap(find.byType(DrawerButton));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Sign out'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in as Member'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Merchant Equb'));
        await tester.pumpAndSettle();

        expect(find.text('Paid'), findsNWidgets(2));
        expect(find.text('Pending'), findsNothing);

        await _tapVisible(tester, find.text('Contribution Submission'));

        expect(find.text('Approved'), findsOneWidget);
        expect(find.text('Approved for this round'), findsOneWidget);
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
