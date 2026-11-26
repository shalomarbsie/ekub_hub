import 'package:freezed_annotation/freezed_annotation.dart';

part 'equb_group.freezed.dart';

enum EqubFrequency { weekly, monthly }

@freezed
abstract class EqubGroup with _$EqubGroup {
  const factory EqubGroup({
    required String id,
    required String title,
    required String description,
    required int contributionAmount,
    required EqubFrequency frequency,
    required int memberLimit,
    required String organizerId,
    required DateTime createdAt,
  }) = _EqubGroup;
}
