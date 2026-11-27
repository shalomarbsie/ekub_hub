import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/domain/account_repository.dart';
import '../../auth/presentation/providers/session_provider.dart';
import '../../contributions/domain/contribution_record.dart';
import '../../contributions/presentation/contribution_providers.dart';
import '../../equbs/domain/cycle_period.dart';
import '../../equbs/domain/membership.dart';
import '../../equbs/presentation/providers/equb_providers.dart';
import '../data/in_memory_payout_repository.dart';
import '../domain/payout_draw.dart';
import '../domain/payout_repository.dart';

final payoutRepositoryProvider = Provider<PayoutRepository>(
  (ref) => InMemoryPayoutRepository(),
);

class PayoutDrawsNotifier extends Notifier<List<PayoutDraw>> {
  @override
  List<PayoutDraw> build() {
    final repository = ref.watch(payoutRepositoryProvider);
    return repository.getAllDraws();
  }

  PayoutDraw runDraw({required String equbId, required String roundId}) {
    final user = ref.read(sessionProvider);
    final membership = ref.read(currentMembershipProvider(equbId));
    if (user == null ||
        membership == null ||
        membership.status != MembershipStatus.active ||
        membership.role != MembershipRole.organizer) {
      throw const PayoutValidationException(
        'Only an active organizer of this Equb can run the payout draw.',
      );
    }

    final equb = ref.read(equbProvider(equbId));
    final round = ref.read(roundProvider((equbId: equbId, roundId: roundId)));
    if (equb == null || round == null) {
      throw const PayoutValidationException(
        'Equb or round could not be found.',
      );
    }
    if (round.status != CyclePeriodStatus.open) {
      throw const PayoutValidationException(
        'A payout draw can only be run for an open round.',
      );
    }

    final key = (equbId: equbId, roundId: roundId);
    final readiness = _buildPayoutReadiness(
      key: key,
      round: round,
      memberships: ref.read(membershipsForEqubProvider(equbId)),
      roster: ref.read(roundRosterStatusProvider(key)),
      allDraws: state,
      accountRepository: ref.read(accountRepositoryProvider),
    );

    if (readiness.currentRoundDraw != null) {
      throw const PayoutValidationException(
        'A payout draw has already been completed for this round.',
      );
    }
    if (!readiness.isContributionComplete) {
      throw const PayoutValidationException(
        'All active members must have approved contributions before running the draw.',
      );
    }
    if (readiness.eligibleMembers.isEmpty) {
      throw const PayoutValidationException(
        'No eligible members remain for this draw.',
      );
    }

    final repository = ref.read(payoutRepositoryProvider);
    final created = repository.executeDraw(
      equbId: equbId,
      cyclePeriodId: round.id,
      periodNumber: round.periodNumber,
      eligibleMemberIds: [
        for (final member in readiness.eligibleMembers) member.membership.id,
      ],
    );
    state = repository.getAllDraws();
    return created;
  }
}

final payoutDrawsProvider =
    NotifierProvider<PayoutDrawsNotifier, List<PayoutDraw>>(
      PayoutDrawsNotifier.new,
    );

final payoutReadinessProvider = Provider.family<PayoutReadiness?, EqubRoundKey>(
  (ref, key) {
    final equb = ref.watch(equbProvider(key.equbId));
    final round = ref.watch(roundProvider(key));
    if (equb == null || round == null) {
      return null;
    }

    return _buildPayoutReadiness(
      key: key,
      round: round,
      memberships: ref.watch(membershipsForEqubProvider(key.equbId)),
      roster: ref.watch(roundRosterStatusProvider(key)),
      allDraws: ref.watch(payoutDrawsProvider),
      accountRepository: ref.watch(accountRepositoryProvider),
    );
  },
);

PayoutReadiness _buildPayoutReadiness({
  required EqubRoundKey key,
  required CyclePeriod round,
  required List<Membership> memberships,
  required RoundRosterStatus roster,
  required List<PayoutDraw> allDraws,
  required AccountRepository accountRepository,
}) {
  final activeMemberships = memberships
      .where((m) => m.status == MembershipStatus.active)
      .toList(growable: false);
  final activeMemberIds = {for (final m in activeMemberships) m.id};

  final nameByMemberId = <String, String>{
    for (final membership in memberships)
      membership.id:
          accountRepository.findById(membership.userId)?.fullName ??
          membership.userId,
  };

  final equbDraws =
      allDraws.where((draw) => draw.equbId == key.equbId).toList()
        ..sort((a, b) => a.periodNumber.compareTo(b.periodNumber));

  final wonInCurrentCycle = <String>{};
  PayoutDraw? currentRoundDraw;

  for (final draw in equbDraws) {
    if (draw.cyclePeriodId == key.roundId) {
      currentRoundDraw = draw;
    }
    if (draw.periodNumber > round.periodNumber) {
      continue;
    }
    if (activeMemberIds.contains(draw.selectedWinnerMemberId)) {
      if (wonInCurrentCycle.length >= activeMemberIds.length) {
        wonInCurrentCycle.clear();
      }
      wonInCurrentCycle.add(draw.selectedWinnerMemberId);
    }
  }

  // Reset turns once all active members have received a payout before a new draw.
  if (currentRoundDraw == null &&
      activeMemberIds.isNotEmpty &&
      wonInCurrentCycle.length >= activeMemberIds.length) {
    wonInCurrentCycle.clear();
  }

  final eligibleMembers = activeMemberships
      .where((m) => !wonInCurrentCycle.contains(m.id))
      .map(
        (m) => PayoutMemberInfo(
          membership: m,
          memberName: nameByMemberId[m.id] ?? m.userId,
          hasWonInCycle: false,
        ),
      )
      .toList(growable: false);

  final pastDraws = equbDraws.reversed
      .map(
        (draw) => PayoutHistoryItem(
          draw: draw,
          winnerName:
              nameByMemberId[draw.selectedWinnerMemberId] ??
              draw.selectedWinnerMemberId,
        ),
      )
      .toList(growable: false);

  final currentDrawItem = currentRoundDraw == null
      ? null
      : PayoutHistoryItem(
          draw: currentRoundDraw,
          winnerName:
              nameByMemberId[currentRoundDraw.selectedWinnerMemberId] ??
              currentRoundDraw.selectedWinnerMemberId,
        );

  return PayoutReadiness(
    totalActiveMembers: roster.totalMembers,
    approvedCount: roster.approvedCount,
    pendingCount: roster.pendingCount,
    rejectedCount: roster.rejectedCount,
    notSubmittedCount: roster.notSubmittedCount,
    isContributionComplete: roster.isAllApproved,
    eligibleMembers: eligibleMembers,
    pastDraws: pastDraws,
    currentRoundDraw: currentDrawItem,
  );
}
