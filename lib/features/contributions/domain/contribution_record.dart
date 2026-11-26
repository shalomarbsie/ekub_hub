import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution_record.freezed.dart';

enum ContributionStatus { pending, approved, rejected }

extension ContributionStatusLabel on ContributionStatus {
  String get label => switch (this) {
    ContributionStatus.pending => 'Pending review',
    ContributionStatus.approved => 'Approved',
    ContributionStatus.rejected => 'Rejected',
  };
}

@freezed
abstract class ContributionRecord with _$ContributionRecord {
  const factory ContributionRecord({
    required String id,
    required String equbId,
    required String cyclePeriodId,
    // Membership ID within the Equb, not the user ID.
    required String memberId,
    required String memberName,
    required double declaredAmount,
    String? note,
    required ContributionStatus status,
    required DateTime submittedAt,
    String? reviewerId,
    DateTime? reviewedAt,
    String? rejectionReason,
  }) = _ContributionRecord;
}

@freezed
abstract class ContributionRoundContext with _$ContributionRoundContext {
  const factory ContributionRoundContext({
    required String equbId,
    required String equbTitle,
    required String roundId,
    required int roundNumber,
    required int totalRounds,
    required double defaultAmount,
    required String frequencyLabel,
    required String dueDateLabel,
    required bool isOpen,
  }) = _ContributionRoundContext;
}

@freezed
abstract class ContributionMemberSlot with _$ContributionMemberSlot {
  const factory ContributionMemberSlot({
    required String memberId,
    required String memberName,
    required String userId,
    @Default(false) bool isOrganizer,
  }) = _ContributionMemberSlot;
}

@freezed
abstract class RoundRosterStatus with _$RoundRosterStatus {
  const RoundRosterStatus._();

  const factory RoundRosterStatus({
    required List<ContributionRecord> records,
    required List<ContributionMemberSlot> notSubmittedMembers,
    required int totalMembers,
  }) = _RoundRosterStatus;

  List<ContributionRecord> get pendingRecords => records
      .where((record) => record.status == ContributionStatus.pending)
      .toList(growable: false);

  List<ContributionRecord> get approvedRecords => records
      .where((record) => record.status == ContributionStatus.approved)
      .toList(growable: false);

  List<ContributionRecord> get rejectedRecords => records
      .where((record) => record.status == ContributionStatus.rejected)
      .toList(growable: false);

  int get pendingCount => pendingRecords.length;
  int get approvedCount => approvedRecords.length;
  int get rejectedCount => rejectedRecords.length;
  int get notSubmittedCount => notSubmittedMembers.length;
  bool get isAllApproved => totalMembers > 0 && approvedCount == totalMembers;
}
