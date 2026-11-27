import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/providers/session_provider.dart';
import '../../equbs/domain/cycle_period.dart';
import '../../equbs/domain/membership.dart';
import '../../equbs/presentation/providers/equb_providers.dart';
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

  ContributionRecord submitContributionForCurrentUser({
    required String equbId,
    required String roundId,
    required double declaredAmount,
    String? note,
  }) {
    final membership = ref.read(currentMembershipProvider(equbId));
    if (membership == null || membership.status != MembershipStatus.active) {
      throw const ContributionValidationException(
        'An active membership in this Equb is required to submit.',
      );
    }

    final round = ref.read(roundProvider((equbId: equbId, roundId: roundId)));
    if (round == null || round.status != CyclePeriodStatus.open) {
      throw const ContributionValidationException(
        'Contributions can only be submitted for an open round.',
      );
    }

    final repository = ref.read(contributionRepositoryProvider);
    final created = repository.submitContribution(
      equbId: equbId,
      cyclePeriodId: round.id,
      memberId: membership.id,
      declaredAmount: declaredAmount,
      note: note,
    );
    state = repository.getAllContributions();
    return created;
  }

  ContributionRecord approveContribution({
    required String equbId,
    required String contributionId,
  }) {
    final reviewerId = _requireOrganizerForContribution(equbId, contributionId);
    final repository = ref.read(contributionRepositoryProvider);
    final updated = repository.approveContribution(
      contributionId: contributionId,
      reviewerId: reviewerId,
    );
    state = repository.getAllContributions();
    return updated;
  }

  ContributionRecord rejectContribution({
    required String equbId,
    required String contributionId,
    required String reason,
  }) {
    final reviewerId = _requireOrganizerForContribution(equbId, contributionId);
    final repository = ref.read(contributionRepositoryProvider);
    final updated = repository.rejectContribution(
      contributionId: contributionId,
      reviewerId: reviewerId,
      reason: reason,
    );
    state = repository.getAllContributions();
    return updated;
  }

  String _requireOrganizerForContribution(String equbId, String contributionId) {
    final user = ref.read(sessionProvider);
    final membership = ref.read(currentMembershipProvider(equbId));
    if (user == null ||
        membership == null ||
        membership.status != MembershipStatus.active ||
        membership.role != MembershipRole.organizer) {
      throw const ContributionValidationException(
        'Only an active organizer of this Equb can review contributions.',
      );
    }

    for (final record in state) {
      if (record.id == contributionId && record.equbId != equbId) {
        throw const ContributionValidationException(
          'Contribution record does not belong to this Equb.',
        );
      }
    }

    return user.id;
  }
}

final contributionsProvider =
    NotifierProvider<ContributionsNotifier, List<ContributionRecord>>(
      ContributionsNotifier.new,
    );

final contributionsForRoundProvider =
    Provider.family<List<ContributionRecord>, EqubRoundKey>((ref, key) {
      final all = ref.watch(contributionsProvider);
      return all
          .where(
            (record) =>
                record.equbId == key.equbId &&
                record.cyclePeriodId == key.roundId,
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

final openRoundsForEqubProvider = Provider.family<List<CyclePeriod>, String>((
  ref,
  equbId,
) {
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(equbId);
  return rounds
      .where((round) => round.status == CyclePeriodStatus.open)
      .toList(growable: false);
});

final roundRosterStatusProvider =
    Provider.family<RoundRosterStatus, EqubRoundKey>((ref, key) {
      final memberships = ref.watch(membershipsForEqubProvider(key.equbId));
      final records = ref.watch(contributionsForRoundProvider(key));
      final accountRepository = ref.watch(accountRepositoryProvider);

      final recordByMemberId = {
        for (final record in records) record.memberId: record,
      };
      final activeMemberships = memberships
          .where((membership) => membership.status == MembershipStatus.active)
          .toList(growable: false);

      final entries = activeMemberships
          .map((membership) {
            final user = accountRepository.findById(membership.userId);
            return ContributionRosterEntry(
              membership: membership,
              memberName: user?.fullName ?? membership.userId,
              record: recordByMemberId[membership.id],
            );
          })
          .toList(growable: false);

      return RoundRosterStatus(entries: entries, totalMembers: entries.length);
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
