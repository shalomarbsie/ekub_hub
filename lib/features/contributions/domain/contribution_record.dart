import 'package:freezed_annotation/freezed_annotation.dart';

import '../../equbs/domain/membership.dart';

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
    // Membership ID within the Equb, not the User ID.
    required String memberId,
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
abstract class ContributionRosterEntry with _$ContributionRosterEntry {
  const factory ContributionRosterEntry({
    required Membership membership,
    required String memberName,
    ContributionRecord? record,
  }) = _ContributionRosterEntry;
}

@freezed
abstract class RoundRosterStatus with _$RoundRosterStatus {
  const RoundRosterStatus._();

  const factory RoundRosterStatus({
    required List<ContributionRosterEntry> entries,
    required int totalMembers,
  }) = _RoundRosterStatus;

  List<ContributionRosterEntry> get pendingEntries => entries
      .where((entry) => entry.record?.status == ContributionStatus.pending)
      .toList(growable: false);

  List<ContributionRosterEntry> get approvedEntries => entries
      .where((entry) => entry.record?.status == ContributionStatus.approved)
      .toList(growable: false);

  List<ContributionRosterEntry> get rejectedEntries => entries
      .where((entry) => entry.record?.status == ContributionStatus.rejected)
      .toList(growable: false);

  List<ContributionRosterEntry> get notSubmittedEntries => entries
      .where((entry) => entry.record == null)
      .toList(growable: false);

  int get pendingCount => pendingEntries.length;
  int get approvedCount => approvedEntries.length;
  int get rejectedCount => rejectedEntries.length;
  int get notSubmittedCount => notSubmittedEntries.length;
  bool get isAllApproved => totalMembers > 0 && approvedCount == totalMembers;
}
