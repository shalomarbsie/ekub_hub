import '../../../core/demo/demo_ids.dart';
import '../domain/cycle_period.dart';
import '../domain/equb_group.dart';
import '../domain/equb_repository.dart';
import '../domain/equb_roster_entry.dart';
import '../domain/membership.dart';

class InMemoryEqubRepository implements EqubRepository {
  final Map<String, EqubGroup> _equbs = {
    DemoIds.merchantEqubId: EqubGroup(
      id: DemoIds.merchantEqubId,
      title: 'Merchant Equb',
      description: 'Members declare a weekly contribution of 2,000 ETB.',
      contributionAmount: 2000,
      frequency: EqubFrequency.weekly,
      memberLimit: 10,
      organizerId: DemoIds.organizerUserId,
      createdAt: DateTime.utc(2026, 11, 1),
    ),
    DemoIds.familyEqubId: EqubGroup(
      id: DemoIds.familyEqubId,
      title: 'Family Equb',
      description: 'Members declare a monthly contribution of 500 ETB.',
      contributionAmount: 500,
      frequency: EqubFrequency.monthly,
      memberLimit: 5,
      organizerId: DemoIds.organizerUserId,
      createdAt: DateTime.utc(2026, 10, 1),
    ),
  };

  final List<Membership> _memberships = [
    Membership(
      id: DemoIds.merchantOrganizerMembershipId,
      equbId: DemoIds.merchantEqubId,
      userId: DemoIds.organizerUserId,
      role: MembershipRole.organizer,
      status: MembershipStatus.active,
      joinedAt: DateTime.utc(2026, 11, 1),
    ),
    Membership(
      id: DemoIds.merchantMemberMembershipId,
      equbId: DemoIds.merchantEqubId,
      userId: DemoIds.memberUserId,
      role: MembershipRole.member,
      status: MembershipStatus.active,
      joinedAt: DateTime.utc(2026, 11, 1),
    ),
    Membership(
      id: DemoIds.familyOrganizerMembershipId,
      equbId: DemoIds.familyEqubId,
      userId: DemoIds.organizerUserId,
      role: MembershipRole.organizer,
      status: MembershipStatus.active,
      joinedAt: DateTime.utc(2026, 10, 1),
    ),
    Membership(
      id: DemoIds.familyMemberMembershipId,
      equbId: DemoIds.familyEqubId,
      userId: DemoIds.memberUserId,
      role: MembershipRole.member,
      status: MembershipStatus.active,
      joinedAt: DateTime.utc(2026, 10, 1),
    ),
  ];

  final List<CyclePeriod> _rounds = [
    CyclePeriod(
      id: DemoIds.merchantRoundId,
      equbId: DemoIds.merchantEqubId,
      periodNumber: 3,
      deadline: DateTime.utc(2026, 11, 29),
      status: CyclePeriodStatus.open,
    ),
    CyclePeriod(
      id: DemoIds.familyRoundId,
      equbId: DemoIds.familyEqubId,
      periodNumber: 2,
      deadline: DateTime.utc(2026, 11, 8),
      status: CyclePeriodStatus.completed,
      winnerMemberId: DemoIds.familyMemberMembershipId,
    ),
  ];

  final Map<String, Map<String, ContributionStatus>> _contributionStatuses = {
    DemoIds.merchantEqubId: {
      DemoIds.merchantOrganizerMembershipId: ContributionStatus.paid,
      DemoIds.merchantMemberMembershipId: ContributionStatus.pending,
    },
    DemoIds.familyEqubId: {
      DemoIds.familyOrganizerMembershipId: ContributionStatus.paid,
      DemoIds.familyMemberMembershipId: ContributionStatus.paid,
    },
  };

  int _nextEqubNumber = 1;

  @override
  List<EqubGroup> allEqubs() => List<EqubGroup>.unmodifiable(_equbs.values);

  @override
  EqubGroup? findEqub(String equbId) => _equbs[equbId];

  @override
  List<Membership> membershipsForEqub(String equbId) {
    return List<Membership>.unmodifiable(
      _memberships.where((membership) => membership.equbId == equbId),
    );
  }

  @override
  void addMembership(Membership membership) {
    _memberships.add(membership);
  }

  @override
  List<CyclePeriod> roundsForEqub(String equbId) {
    return List<CyclePeriod>.unmodifiable(
      _rounds.where((round) => round.equbId == equbId),
    );
  }

  @override
  Map<String, ContributionStatus> contributionStatusesForEqub(String equbId) {
    return Map<String, ContributionStatus>.unmodifiable(
      _contributionStatuses[equbId] ?? const {},
    );
  }

  @override
  EqubGroup createEqub({
    required String title,
    required int contributionAmount,
    required EqubFrequency frequency,
    required int memberLimit,
    required String organizerId,
    required DateTime startDate,
    String? description,
  }) {
    final equbId = 'equb-local-${_nextEqubNumber++}';
    final normalizedTitle = title.trim();
    final normalizedDescription = (description ?? '').trim().isNotEmpty
        ? description!.trim()
        : 'Members declare a ${frequency.name} contribution of $contributionAmount ETB.';

    final group = EqubGroup(
      id: equbId,
      title: normalizedTitle,
      description: normalizedDescription,
      contributionAmount: contributionAmount,
      frequency: frequency,
      memberLimit: memberLimit,
      organizerId: organizerId,
      createdAt: startDate,
    );
    _equbs[equbId] = group;

    final organizerMembershipId = 'membership-$equbId-organizer';
    _memberships.add(
      Membership(
        id: organizerMembershipId,
        equbId: equbId,
        userId: organizerId,
        role: MembershipRole.organizer,
        status: MembershipStatus.active,
        joinedAt: startDate,
      ),
    );

    final deadline = frequency == EqubFrequency.weekly
        ? startDate.add(const Duration(days: 7))
        : startDate.add(const Duration(days: 30));
    _rounds.add(
      CyclePeriod(
        id: 'round-$equbId-01',
        equbId: equbId,
        periodNumber: 1,
        deadline: deadline,
        status: CyclePeriodStatus.open,
      ),
    );

    _contributionStatuses[equbId] = {
      organizerMembershipId: ContributionStatus.pending,
    };

    return group;
  }
}
