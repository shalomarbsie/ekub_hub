import '../domain/contribution_record.dart';
import '../domain/contribution_repository.dart';

class InMemoryContributionRepository implements ContributionRepository {
  InMemoryContributionRepository({
    List<ContributionRecord>? initialRecords,
    DateTime Function()? now,
  }) : _records = List<ContributionRecord>.from(
         initialRecords ?? _seedRecords(),
       ),
       _now = now ?? DateTime.now;

  final List<ContributionRecord> _records;
  final DateTime Function() _now;
  int _nextId = 100;

  @override
  List<ContributionRecord> getAllContributions() =>
      List<ContributionRecord>.unmodifiable(_records);

  @override
  List<ContributionRecord> getContributionsForRound({
    required String equbId,
    required String cyclePeriodId,
  }) => List<ContributionRecord>.unmodifiable(
    _records.where(
      (record) =>
          record.equbId == equbId && record.cyclePeriodId == cyclePeriodId,
    ),
  );

  @override
  ContributionRecord? getMemberContribution({
    required String cyclePeriodId,
    required String memberId,
  }) {
    for (final record in _records) {
      if (record.cyclePeriodId == cyclePeriodId &&
          record.memberId == memberId) {
        return record;
      }
    }
    return null;
  }

  @override
  ContributionRecord submitContribution({
    required String equbId,
    required String cyclePeriodId,
    required String memberId,
    required String memberName,
    required double declaredAmount,
    String? note,
  }) {
    if (declaredAmount <= 0) {
      throw const ContributionValidationException(
        'Declared amount must be greater than zero.',
      );
    }

    final normalizedNote = _normalizeOptionalText(note);
    final existingIndex = _records.indexWhere(
      (record) =>
          record.cyclePeriodId == cyclePeriodId && record.memberId == memberId,
    );

    if (existingIndex != -1) {
      final existing = _records[existingIndex];
      if (existing.status != ContributionStatus.rejected) {
        throw const ContributionValidationException(
          'A contribution record already exists for this round.',
        );
      }

      // Resubmitting after a rejection updates the existing record instead of adding a duplicate.
      final resubmitted = existing.copyWith(
        memberName: memberName,
        declaredAmount: declaredAmount,
        note: normalizedNote,
        status: ContributionStatus.pending,
        submittedAt: _now(),
        reviewerId: null,
        reviewedAt: null,
        rejectionReason: null,
      );
      _records[existingIndex] = resubmitted;
      return resubmitted;
    }

    final created = ContributionRecord(
      id: 'contrib-${_nextId++}',
      equbId: equbId,
      cyclePeriodId: cyclePeriodId,
      memberId: memberId,
      memberName: memberName,
      declaredAmount: declaredAmount,
      note: normalizedNote,
      status: ContributionStatus.pending,
      submittedAt: _now(),
    );
    _records.add(created);
    return created;
  }

  @override
  ContributionRecord approveContribution({
    required String contributionId,
    required String reviewerId,
  }) {
    final index = _findPendingRecordIndex(contributionId);
    final updated = _records[index].copyWith(
      status: ContributionStatus.approved,
      reviewerId: reviewerId,
      reviewedAt: _now(),
      rejectionReason: null,
    );
    _records[index] = updated;
    return updated;
  }

  @override
  ContributionRecord rejectContribution({
    required String contributionId,
    required String reviewerId,
    required String reason,
  }) {
    final trimmedReason = reason.trim();
    if (trimmedReason.isEmpty) {
      throw const ContributionValidationException(
        'Rejection reason is required.',
      );
    }

    final index = _findPendingRecordIndex(contributionId);
    final updated = _records[index].copyWith(
      status: ContributionStatus.rejected,
      reviewerId: reviewerId,
      reviewedAt: _now(),
      rejectionReason: trimmedReason,
    );
    _records[index] = updated;
    return updated;
  }

  int _findPendingRecordIndex(String contributionId) {
    final index = _records.indexWhere((record) => record.id == contributionId);
    if (index == -1) {
      throw const ContributionValidationException(
        'Contribution record could not be found.',
      );
    }
    if (_records[index].status != ContributionStatus.pending) {
      throw const ContributionValidationException(
        'Only pending contribution records can be reviewed.',
      );
    }
    return index;
  }

  static String? _normalizeOptionalText(String? value) {
    if (value == null) {
      return null;
    }
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static List<ContributionRecord> _seedRecords() {
    final baseTime = DateTime(2026, 11, 15, 10, 14);
    final merchantApproved = <(String id, String memberId, String name)>[
      ('contrib-m-01', 'membership-merchant-organizer', 'Agernesh G.'),
      ('contrib-m-02', 'membership-merchant-02', 'Abebe K.'),
      ('contrib-m-03', 'membership-merchant-03', 'Hanna T.'),
      ('contrib-m-04', 'membership-merchant-04', 'Bereket S.'),
      ('contrib-m-05', 'membership-merchant-05', 'Tigist M.'),
      ('contrib-m-06', 'membership-merchant-06', 'Yohannes A.'),
      ('contrib-m-07', 'membership-merchant-07', 'Mekdes G.'),
      ('contrib-m-08', 'membership-merchant-08', 'Kebede T.'),
    ];

    final familyApproved = <(String id, String memberId, String name)>[
      ('contrib-f-01', 'membership-family-organizer', 'Marta G.'),
      ('contrib-f-02', 'membership-family-member', 'Yonas T.'),
      ('contrib-f-03', 'membership-family-03', 'Liya B.'),
      ('contrib-f-04', 'membership-family-04', 'Samuel D.'),
      ('contrib-f-05', 'membership-family-05', 'Rahel A.'),
    ];

    return [
      for (var i = 0; i < merchantApproved.length; i++)
        ContributionRecord(
          id: merchantApproved[i].$1,
          equbId: 'equb-merchant',
          cyclePeriodId: 'round-merchant-03',
          memberId: merchantApproved[i].$2,
          memberName: merchantApproved[i].$3,
          declaredAmount: 2000,
          note: i == 1 ? 'Telebirr transfer ref 9482' : null,
          status: ContributionStatus.approved,
          submittedAt: baseTime.subtract(Duration(hours: 6 + i)),
          reviewerId: 'user-organizer',
          reviewedAt: baseTime.subtract(Duration(hours: 4 + i)),
        ),
      ContributionRecord(
        id: 'contrib-m-09',
        equbId: 'equb-merchant',
        cyclePeriodId: 'round-merchant-03',
        memberId: 'membership-merchant-09',
        memberName: 'Selam M.',
        declaredAmount: 2000,
        note: 'Handed cash to organizer',
        status: ContributionStatus.pending,
        submittedAt: baseTime,
      ),
      for (var i = 0; i < familyApproved.length; i++)
        ContributionRecord(
          id: familyApproved[i].$1,
          equbId: 'equb-family',
          cyclePeriodId: 'round-family-02',
          memberId: familyApproved[i].$2,
          memberName: familyApproved[i].$3,
          declaredAmount: 500,
          status: ContributionStatus.approved,
          submittedAt: baseTime.subtract(Duration(days: 7, hours: i + 1)),
          reviewerId: 'user-organizer',
          reviewedAt: baseTime.subtract(Duration(days: 7)),
        ),
    ];
  }
}

// TODO: replace these demo fixtures once shared Equb and round providers are wired up.
List<ContributionRoundContext> defaultContributionRoundsForEqub(String equbId) {
  switch (equbId) {
    case 'equb-merchant':
      return const [
        ContributionRoundContext(
          equbId: 'equb-merchant',
          equbTitle: 'Merchant Equb',
          roundId: 'round-merchant-03',
          roundNumber: 3,
          totalRounds: 10,
          defaultAmount: 2000,
          frequencyLabel: 'weekly',
          dueDateLabel: 'due Sun 15 Nov',
          isOpen: true,
        ),
        ContributionRoundContext(
          equbId: 'equb-merchant',
          equbTitle: 'Merchant Equb',
          roundId: 'round-merchant-04',
          roundNumber: 4,
          totalRounds: 10,
          defaultAmount: 2000,
          frequencyLabel: 'weekly',
          dueDateLabel: 'due Sun 22 Nov',
          isOpen: true,
        ),
        ContributionRoundContext(
          equbId: 'equb-merchant',
          equbTitle: 'Merchant Equb',
          roundId: 'round-merchant-02',
          roundNumber: 2,
          totalRounds: 10,
          defaultAmount: 2000,
          frequencyLabel: 'weekly',
          dueDateLabel: 'closed Sun 8 Nov',
          isOpen: false,
        ),
      ];
    case 'equb-family':
      return const [
        ContributionRoundContext(
          equbId: 'equb-family',
          equbTitle: 'Family Equb',
          roundId: 'round-family-02',
          roundNumber: 2,
          totalRounds: 5,
          defaultAmount: 500,
          frequencyLabel: 'monthly',
          dueDateLabel: 'due 8 Nov',
          isOpen: true,
        ),
      ];
    default:
      return [
        ContributionRoundContext(
          equbId: equbId,
          equbTitle: equbId,
          roundId: 'round-$equbId-01',
          roundNumber: 1,
          totalRounds: 1,
          defaultAmount: 1000,
          frequencyLabel: 'monthly',
          dueDateLabel: 'open round',
          isOpen: true,
        ),
      ];
  }
}

List<ContributionMemberSlot> defaultContributionMembersForEqub(String equbId) {
  switch (equbId) {
    case 'equb-merchant':
      return const [
        ContributionMemberSlot(
          memberId: 'membership-merchant-organizer',
          memberName: 'Agernesh G.',
          userId: 'user-organizer',
          isOrganizer: true,
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-02',
          memberName: 'Abebe K.',
          userId: 'user-merchant-02',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-03',
          memberName: 'Hanna T.',
          userId: 'user-merchant-03',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-04',
          memberName: 'Bereket S.',
          userId: 'user-merchant-04',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-05',
          memberName: 'Tigist M.',
          userId: 'user-merchant-05',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-06',
          memberName: 'Yohannes A.',
          userId: 'user-merchant-06',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-07',
          memberName: 'Mekdes G.',
          userId: 'user-merchant-07',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-08',
          memberName: 'Kebede T.',
          userId: 'user-merchant-08',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-09',
          memberName: 'Selam M.',
          userId: 'user-merchant-09',
        ),
        ContributionMemberSlot(
          memberId: 'membership-merchant-member',
          memberName: 'Dawit B.',
          userId: 'user-member',
        ),
      ];
    case 'equb-family':
      return const [
        ContributionMemberSlot(
          memberId: 'membership-family-organizer',
          memberName: 'Marta G.',
          userId: 'user-organizer',
          isOrganizer: true,
        ),
        ContributionMemberSlot(
          memberId: 'membership-family-member',
          memberName: 'Yonas T.',
          userId: 'user-member',
        ),
        ContributionMemberSlot(
          memberId: 'membership-family-03',
          memberName: 'Liya B.',
          userId: 'user-family-03',
        ),
        ContributionMemberSlot(
          memberId: 'membership-family-04',
          memberName: 'Samuel D.',
          userId: 'user-family-04',
        ),
        ContributionMemberSlot(
          memberId: 'membership-family-05',
          memberName: 'Rahel A.',
          userId: 'user-family-05',
        ),
      ];
    default:
      return const [
        ContributionMemberSlot(
          memberId: 'membership-demo-organizer',
          memberName: 'Demo Organizer',
          userId: 'user-organizer',
          isOrganizer: true,
        ),
        ContributionMemberSlot(
          memberId: 'membership-demo-member',
          memberName: 'Demo Member',
          userId: 'user-member',
        ),
      ];
  }
}
