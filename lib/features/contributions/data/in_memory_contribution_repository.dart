import '../../../core/demo/demo_ids.dart';
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
    required double declaredAmount,
    String? note,
  }) {
    if (!declaredAmount.isFinite || declaredAmount <= 0) {
      throw const ContributionValidationException(
        'Declared amount must be a finite number greater than zero.',
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
    final merchantBaseTime = DateTime.utc(2026, 11, 22, 10, 0);
    final familyBaseTime = DateTime.utc(2026, 11, 8, 9, 30);

    return [
      ContributionRecord(
        id: 'contrib-merchant-organizer',
        equbId: DemoIds.merchantEqubId,
        cyclePeriodId: DemoIds.merchantRoundId,
        memberId: DemoIds.merchantOrganizerMembershipId,
        declaredAmount: 2000,
        status: ContributionStatus.approved,
        submittedAt: merchantBaseTime,
        reviewerId: DemoIds.organizerUserId,
        reviewedAt: merchantBaseTime.add(const Duration(minutes: 15)),
      ),
      ContributionRecord(
        id: 'contrib-family-organizer',
        equbId: DemoIds.familyEqubId,
        cyclePeriodId: DemoIds.familyRoundId,
        memberId: DemoIds.familyOrganizerMembershipId,
        declaredAmount: 500,
        status: ContributionStatus.approved,
        submittedAt: familyBaseTime,
        reviewerId: DemoIds.organizerUserId,
        reviewedAt: familyBaseTime.add(const Duration(minutes: 10)),
      ),
      ContributionRecord(
        id: 'contrib-family-member',
        equbId: DemoIds.familyEqubId,
        cyclePeriodId: DemoIds.familyRoundId,
        memberId: DemoIds.familyMemberMembershipId,
        declaredAmount: 500,
        status: ContributionStatus.approved,
        submittedAt: familyBaseTime.add(const Duration(minutes: 20)),
        reviewerId: DemoIds.organizerUserId,
        reviewedAt: familyBaseTime.add(const Duration(minutes: 30)),
      ),
    ];
  }
}
