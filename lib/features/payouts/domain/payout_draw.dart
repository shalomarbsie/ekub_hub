import 'package:freezed_annotation/freezed_annotation.dart';

import '../../equbs/domain/membership.dart';

part 'payout_draw.freezed.dart';

@freezed
abstract class PayoutDraw with _$PayoutDraw {
  const factory PayoutDraw({
    required String id,
    required String equbId,
    required String cyclePeriodId,
    required int periodNumber,
    required List<String> eligibleMemberIds,
    required String selectedWinnerMemberId,
    required DateTime drawnAt,
  }) = _PayoutDraw;
}

@freezed
abstract class PayoutMemberInfo with _$PayoutMemberInfo {
  const factory PayoutMemberInfo({
    required Membership membership,
    required String memberName,
    required bool hasWonInCycle,
  }) = _PayoutMemberInfo;
}

@freezed
abstract class PayoutHistoryItem with _$PayoutHistoryItem {
  const factory PayoutHistoryItem({
    required PayoutDraw draw,
    required String winnerName,
  }) = _PayoutHistoryItem;
}

@freezed
abstract class PayoutReadiness with _$PayoutReadiness {
  const PayoutReadiness._();

  const factory PayoutReadiness({
    required int totalActiveMembers,
    required int approvedCount,
    required int pendingCount,
    required int rejectedCount,
    required int notSubmittedCount,
    required bool isContributionComplete,
    required List<PayoutMemberInfo> eligibleMembers,
    required List<PayoutHistoryItem> pastDraws,
    PayoutHistoryItem? currentRoundDraw,
  }) = _PayoutReadiness;

  bool get isReadyForDraw =>
      isContributionComplete &&
      currentRoundDraw == null &&
      eligibleMembers.isNotEmpty;
}
