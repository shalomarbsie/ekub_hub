import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/session_provider.dart';
import '../../data/in_memory_equb_repository.dart';
import '../../domain/cycle_period.dart';
import '../../domain/equb_group.dart';
import '../../domain/equb_repository.dart';
import '../../domain/equb_roster_entry.dart';
import '../../domain/membership.dart';

typedef EqubRoundKey = ({String equbId, String roundId});

final equbRepositoryProvider = Provider<EqubRepository>((ref) {
  return InMemoryEqubRepository();
});

final equbGroupsProvider =
    NotifierProvider<EqubGroupsController, List<EqubGroup>>(
      EqubGroupsController.new,
    );

class EqubGroupsController extends Notifier<List<EqubGroup>> {
  @override
  List<EqubGroup> build() {
    return ref.watch(equbRepositoryProvider).allEqubs();
  }

  EqubGroup createEqub({
    required String title,
    required int contributionAmount,
    required EqubFrequency frequency,
    required int memberLimit,
    required String organizerId,
    required DateTime startDate,
    String? description,
  }) {
    final created = ref
        .read(equbRepositoryProvider)
        .createEqub(
          title: title,
          contributionAmount: contributionAmount,
          frequency: frequency,
          memberLimit: memberLimit,
          organizerId: organizerId,
          startDate: startDate,
          description: description,
        );
    state = ref.read(equbRepositoryProvider).allEqubs();
    return created;
  }
}

final dashboardEqubsProvider = Provider<List<EqubGroup>>((ref) {
  final allGroups = ref.watch(equbGroupsProvider);
  final user = ref.watch(sessionProvider);
  if (user == null) {
    return const [];
  }

  return allGroups
      .where(
        (group) =>
            ref.watch(currentMembershipProvider(group.id))?.status ==
            MembershipStatus.active,
      )
      .toList(growable: false);
});

final equbProvider = Provider.family<EqubGroup?, String>((ref, equbId) {
  final groups = ref.watch(equbGroupsProvider);
  for (final group in groups) {
    if (group.id == equbId) {
      return group;
    }
  }
  return null;
});

final membershipsForEqubProvider = Provider.family<List<Membership>, String>((
  ref,
  equbId,
) {
  ref.watch(equbGroupsProvider);
  return ref.watch(equbRepositoryProvider).membershipsForEqub(equbId);
});

final currentMembershipProvider = Provider.family<Membership?, String>((
  ref,
  equbId,
) {
  final user = ref.watch(sessionProvider);
  if (user == null) {
    return null;
  }

  final memberships = ref.watch(membershipsForEqubProvider(equbId));
  for (final membership in memberships) {
    if (membership.userId == user.id) {
      return membership;
    }
  }
  return null;
});

final activeRoundProvider = Provider.family<CyclePeriod?, String>((
  ref,
  equbId,
) {
  ref.watch(equbGroupsProvider);
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(equbId);
  for (final round in rounds) {
    if (round.status == CyclePeriodStatus.open) {
      return round;
    }
  }
  return null;
});

final roundProvider = Provider.family<CyclePeriod?, EqubRoundKey>((ref, key) {
  ref.watch(equbGroupsProvider);
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(key.equbId);
  for (final round in rounds) {
    if (round.id == key.roundId) {
      return round;
    }
  }
  return null;
});

final latestCompletedRoundProvider = Provider.family<CyclePeriod?, String>((
  ref,
  equbId,
) {
  ref.watch(equbGroupsProvider);
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(equbId);
  CyclePeriod? latest;

  for (final round in rounds) {
    if (round.status == CyclePeriodStatus.completed &&
        (latest == null || round.periodNumber > latest.periodNumber)) {
      latest = round;
    }
  }

  return latest;
});

final equbRosterProvider = Provider.family<List<EqubRosterEntry>, String>((
  ref,
  equbId,
) {
  final memberships = ref.watch(membershipsForEqubProvider(equbId));
  final statuses = ref
      .watch(equbRepositoryProvider)
      .contributionStatusesForEqub(equbId);
  final accountRepository = ref.watch(accountRepositoryProvider);

  return memberships
      .where((membership) => membership.status == MembershipStatus.active)
      .map(
        (membership) => EqubRosterEntry(
          membershipId: membership.id,
          userId: membership.userId,
          displayName:
              accountRepository.findById(membership.userId)?.fullName ??
              membership.userId,
          role: membership.role,
          contributionStatus:
              statuses[membership.id] ?? ContributionStatus.pending,
        ),
      )
      .toList(growable: false);
});

final equbAiSummaryProvider = Provider.family<String?, String>((ref, equbId) {
  final group = ref.watch(equbProvider(equbId));
  if (group == null) {
    return null;
  }

  final roster = ref.watch(equbRosterProvider(equbId));
  final activeRound = ref.watch(activeRoundProvider(equbId));
  final completedRound = ref.watch(latestCompletedRoundProvider(equbId));

  final totalCount = roster.length;
  final paidCount = roster
      .where((entry) => entry.contributionStatus == ContributionStatus.paid)
      .length;
  final collectedAmount = paidCount * group.contributionAmount;
  final targetAmount = totalCount * group.contributionAmount;

  if (activeRound != null) {
    final pendingCount = totalCount - paidCount;
    return 'Round ${activeRound.periodNumber} is open: $paidCount of '
        '$totalCount active members have paid ($collectedAmount of '
        '$targetAmount ETB). $pendingCount contribution(s) remaining.';
  }

  if (completedRound != null) {
    return 'Round ${completedRound.periodNumber} is complete: $paidCount of '
        '$totalCount active members contributed ($targetAmount ETB total).';
  }

  return '${group.title} has $totalCount active member(s) with a '
      '${group.contributionAmount} ETB ${group.frequency.name} contribution.';
});
