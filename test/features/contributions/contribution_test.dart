import 'package:ekub_hub/features/contributions/domain/contribution_record.dart';
import 'package:ekub_hub/features/contributions/domain/contribution_repository.dart';
import 'package:ekub_hub/features/contributions/presentation/contribution_providers.dart';
import 'package:ekub_hub/features/contributions/presentation/contribution_screens.dart';
import 'package:ekub_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Contributions Riverpod state and repository', () {
    test('loads seeded roster counts for Merchant and Family Equbs', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final merchantRoster = container.read(
        roundRosterStatusProvider((
          equbId: 'equb-merchant',
          roundId: 'round-merchant-03',
        )),
      );
      expect(merchantRoster.totalMembers, 10);
      expect(merchantRoster.approvedCount, 8);
      expect(merchantRoster.pendingCount, 1);
      expect(merchantRoster.notSubmittedCount, 1);
      expect(merchantRoster.isAllApproved, isFalse);

      final familyRoster = container.read(
        roundRosterStatusProvider((
          equbId: 'equb-family',
          roundId: 'round-family-02',
        )),
      );
      expect(familyRoster.totalMembers, 5);
      expect(familyRoster.approvedCount, 5);
      expect(familyRoster.isAllApproved, isTrue);
    });

    test('submits contribution and prevents duplicate submission', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(contributionsProvider.notifier);
      final submitted = notifier.submitContribution(
        equbId: 'equb-merchant',
        cyclePeriodId: 'round-merchant-03',
        memberId: 'membership-merchant-member',
        memberName: 'Dawit B.',
        declaredAmount: 2000,
        note: 'Telebirr ref 123',
      );

      expect(submitted.status, ContributionStatus.pending);
      expect(submitted.note, 'Telebirr ref 123');

      final roster = container.read(
        roundRosterStatusProvider((
          equbId: 'equb-merchant',
          roundId: 'round-merchant-03',
        )),
      );
      expect(roster.pendingCount, 2);
      expect(roster.notSubmittedCount, 0);

      expect(
        () => notifier.submitContribution(
          equbId: 'equb-merchant',
          cyclePeriodId: 'round-merchant-03',
          memberId: 'membership-merchant-member',
          memberName: 'Dawit B.',
          declaredAmount: 2000,
        ),
        throwsA(isA<ContributionValidationException>()),
      );
    });

    test(
      'requires rejection reason, rejects, and allows resubmission',
      () {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(contributionsProvider.notifier);

        expect(
          () => notifier.rejectContribution(
            contributionId: 'contrib-m-09',
            reviewerId: 'user-organizer',
            reason: '   ',
          ),
          throwsA(isA<ContributionValidationException>()),
        );

        final rejected = notifier.rejectContribution(
          contributionId: 'contrib-m-09',
          reviewerId: 'user-organizer',
          reason: 'Transfer reference missing',
        );
        expect(rejected.status, ContributionStatus.rejected);
        expect(rejected.rejectionReason, 'Transfer reference missing');

        final resubmitted = notifier.submitContribution(
          equbId: 'equb-merchant',
          cyclePeriodId: 'round-merchant-03',
          memberId: 'membership-merchant-09',
          memberName: 'Selam M.',
          declaredAmount: 2000,
          note: 'Ref 7788',
        );
        expect(resubmitted.id, 'contrib-m-09');
        expect(resubmitted.status, ContributionStatus.pending);
        expect(resubmitted.rejectionReason, isNull);
      },
    );

    test('approves pending records and updates live round readiness', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(contributionsProvider.notifier);
      notifier.submitContribution(
        equbId: 'equb-merchant',
        cyclePeriodId: 'round-merchant-03',
        memberId: 'membership-merchant-member',
        memberName: 'Dawit B.',
        declaredAmount: 2000,
      );

      notifier.approveContribution(
        contributionId: 'contrib-m-09',
        reviewerId: 'user-organizer',
      );
      final dawitRecord = container.read(
        memberRoundContributionProvider((
          roundId: 'round-merchant-03',
          memberId: 'membership-merchant-member',
        )),
      )!;
      notifier.approveContribution(
        contributionId: dawitRecord.id,
        reviewerId: 'user-organizer',
      );

      final roster = container.read(
        roundRosterStatusProvider((
          equbId: 'equb-merchant',
          roundId: 'round-merchant-03',
        )),
      );
      expect(roster.approvedCount, 10);
      expect(roster.pendingCount, 0);
      expect(roster.isAllApproved, isTrue);
    });
  });

  group('Contribution screens widget tests', () {
    testWidgets(
      'ContributionSubmissionScreen submits declaration and updates status',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: ContributionSubmissionScreen(
                  equbId: 'equb-merchant',
                  roundId: 'round-merchant-03',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Submit contribution record'), findsOneWidget);
        expect(find.text('Not submitted'), findsOneWidget);

        await tester.enterText(
          find.byKey(const ValueKey('submission-note-field')),
          'Paid via Telebirr',
        );
        await tester.ensureVisible(
          find.byKey(const ValueKey('send-for-review-button')),
        );
        await tester.tap(find.byKey(const ValueKey('send-for-review-button')));
        await tester.pumpAndSettle();

        expect(find.text('Pending review'), findsOneWidget);
        expect(find.text('Submitted (Pending review)'), findsOneWidget);
      },
    );

    testWidgets(
      'ContributionReviewScreen validates reject reason and approves pending record',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: ContributionReviewScreen(
                  equbId: 'equb-merchant',
                  roundId: 'round-merchant-03',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Pending review (1)'), findsOneWidget);
        expect(find.text('Selam M.'), findsOneWidget);
        expect(find.text('Approved records (8)'), findsOneWidget);

        await tester.tap(find.byKey(const ValueKey('reject-btn-contrib-m-09')));
        await tester.pumpAndSettle();

        expect(
          find.text('Reason is required to reject a contribution.'),
          findsOneWidget,
        );

        await tester.tap(find.byKey(const ValueKey('approve-btn-contrib-m-09')));
        await tester.pumpAndSettle();

        expect(find.text('Pending review (0)'), findsOneWidget);
        expect(find.text('Approved records (9)'), findsOneWidget);
      },
    );

    testWidgets(
      'Shared provider updates Review and Submission status across screens',
      (tester) async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: ContributionSubmissionScreen(
                  equbId: 'equb-merchant',
                  roundId: 'round-merchant-03',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.byKey(const ValueKey('send-for-review-button')),
        );
        await tester.tap(find.byKey(const ValueKey('send-for-review-button')));
        await tester.pumpAndSettle();

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: ContributionReviewScreen(
                  equbId: 'equb-merchant',
                  roundId: 'round-merchant-03',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Pending review (2)'), findsOneWidget);
        expect(find.text('Dawit B.'), findsOneWidget);

        final dawitRecord = container.read(
          memberRoundContributionProvider((
            roundId: 'round-merchant-03',
            memberId: 'membership-merchant-member',
          )),
        )!;
        final approveButton = find.byKey(
          ValueKey('approve-btn-${dawitRecord.id}'),
        );
        await tester.dragUntilVisible(
          approveButton,
          find.byType(ListView),
          const Offset(0, -150),
        );
        await tester.pumpAndSettle();
        await tester.tap(approveButton);
        await tester.pumpAndSettle();

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(
              home: Scaffold(
                body: ContributionSubmissionScreen(
                  equbId: 'equb-merchant',
                  roundId: 'round-merchant-03',
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Approved'), findsOneWidget);
        expect(find.text('Approved for this round'), findsOneWidget);
      },
    );

    testWidgets(
      'Navigates via GoRouter from Merchant Equb to Submission and Review',
      (tester) async {
        await tester.pumpWidget(const ProviderScope(child: EqubHubApp()));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Continue to demo'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Merchant Equb'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Contribution Submission'));
        await tester.pumpAndSettle();

        expect(find.text('Submit contribution record'), findsOneWidget);
        await tester.ensureVisible(
          find.byKey(const ValueKey('send-for-review-button')),
        );
        await tester.tap(find.byKey(const ValueKey('send-for-review-button')));
        await tester.pumpAndSettle();

        await tester.tap(find.byTooltip('Back'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Contribution Review'));
        await tester.pumpAndSettle();

        expect(find.text('Contribution review'), findsOneWidget);
        expect(find.text('Pending review (2)'), findsOneWidget);
        expect(find.text('Dawit B.'), findsOneWidget);
      },
    );
  });
}
