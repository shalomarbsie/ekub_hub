import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_period.freezed.dart';

enum CyclePeriodStatus { open, completed }

@freezed
abstract class CyclePeriod with _$CyclePeriod {
  const factory CyclePeriod({
    required String id,
    required String equbId,
    required int periodNumber,
    required DateTime deadline,
    required CyclePeriodStatus status,
    String? winnerMemberId,
  }) = _CyclePeriod;
}
