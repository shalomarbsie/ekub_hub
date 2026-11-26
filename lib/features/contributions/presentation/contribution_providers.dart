import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_contribution_repository.dart';
import '../domain/contribution_record.dart';
import '../domain/contribution_repository.dart';

final contributionRepositoryProvider = Provider<ContributionRepository>(
  (ref) => InMemoryContributionRepository(),
);

class ContributionsNotifier extends Notifier<List<ContributionRecord>> {
  @override
  List<ContributionRecord> build() {
    final repository = ref.watch(contributionRepositoryProvider);
    return repository.getAllContributions();
  }

  ContributionRecord submitContribution({
    required String equbId,
    required String cyclePeriodId,
    required String memberId,
    required String memberName,
    required double declaredAmount,
    String? note,
  }) {
    final repository = ref.read(contributionRepositoryProvider);
    final created = repository.submitContribution(
      equbId: equbId,
      cyclePeriodId: cyclePeriodId,
      memberId: memberId,
      memberName: memberName,
      declaredAmount: declaredAmount,
      note: note,
    );
    state = repository.getAllContributions();
    return created;
  }

  ContributionRecord approveContribution({
    required String contributionId,
    required String reviewerId,
  }) {
    final repository = ref.read(contributionRepositoryProvider);
    final updated = repository.approveContribution(
      contributionId: contributionId,
      reviewerId: reviewerId,
    );
    state = repository.getAllContributions();
    return updated;
  }

  ContributionRecord rejectContribution({
    required String contributionId,
    required String reviewerId,
    required String reason,
  }) {
    final repository = ref.read(contributionRepositoryProvider);
    final updated = repository.rejectContribution(
      contributionId: contributionId,
      reviewerId: reviewerId,
      reason: reason,
    );
    state = repository.getAllContributions();
    return updated;
  }
}

final contributionsProvider =
    NotifierProvider<ContributionsNotifier, List<ContributionRecord>>(
      ContributionsNotifier.new,
    );

final contributionRoundsProvider =
    Provider.family<List<ContributionRoundContext>, String>(
      (ref, equbId) => defaultContributionRoundsForEqub(equbId),
    );

final contributionMembersProvider =
    Provider.family<List<ContributionMemberSlot>, String>(
      (ref, equbId) => defaultContributionMembersForEqub(equbId),
    );

// TODO: read from the signed-in session provider once auth session state is merged.
final activeContributionMemberProvider =
    Provider.family<ContributionMemberSlot, String>((ref, equbId) {
      final members = ref.watch(contributionMembersProvider(equbId));
      for (final member in members) {
        if (member.userId == 'user-member') {
          return member;
        }
      }
      for (final member in members) {
        if (!member.isOrganizer) {
          return member;
        }
      }
      return members.first;
    });

final activeContributionReviewerIdProvider = Provider<String>(
  (ref) => 'user-organizer',
);

final contributionRoundContextProvider =
    Provider.family<ContributionRoundContext, ({String equbId, String roundId})>((
      ref,
      params,
    ) {
      final rounds = ref.watch(contributionRoundsProvider(params.equbId));
      for (final round in rounds) {
        if (round.roundId == params.roundId) {
          return round;
        }
      }
      // Fallback if a newly created round isn't in the demo seed list.
      final template = rounds.first;
      return template.copyWith(
        roundId: params.roundId,
        dueDateLabel: 'open round',
        isOpen: true,
      );
    });

final roundContributionsProvider =
    Provider.family<List<ContributionRecord>, ({String equbId, String roundId})>((
      ref,
      params,
    ) {
      final all = ref.watch(contributionsProvider);
      return all
          .where(
            (record) =>
                record.equbId == params.equbId &&
                record.cyclePeriodId == params.roundId,
          )
          .toList(growable: false);
    });

final memberRoundContributionProvider =
    Provider.family<ContributionRecord?, ({String roundId, String memberId})>((
      ref,
      params,
    ) {
      final all = ref.watch(contributionsProvider);
      for (final record in all) {
        if (record.cyclePeriodId == params.roundId &&
            record.memberId == params.memberId) {
          return record;
        }
      }
      return null;
    });

final roundRosterStatusProvider =
    Provider.family<RoundRosterStatus, ({String equbId, String roundId})>((
      ref,
      params,
    ) {
      final records = ref.watch(roundContributionsProvider(params));
      final members = ref.watch(contributionMembersProvider(params.equbId));
      final submittedMemberIds = {
        for (final record in records) record.memberId,
      };
      final notSubmitted = members
          .where((member) => !submittedMemberIds.contains(member.memberId))
          .toList(growable: false);

      return RoundRosterStatus(
        records: records,
        notSubmittedMembers: notSubmitted,
        totalMembers: members.length,
      );
    });

class SelectedSubmissionRoundNotifier extends Notifier<String> {
  SelectedSubmissionRoundNotifier(this.initialRoundId);

  final String initialRoundId;

  @override
  String build() => initialRoundId;

  void select(String roundId) {
    state = roundId;
  }
}

final selectedSubmissionRoundProvider = NotifierProvider.autoDispose
    .family<SelectedSubmissionRoundNotifier, String, String>(
      SelectedSubmissionRoundNotifier.new,
    );
