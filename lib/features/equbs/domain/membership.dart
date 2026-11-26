import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership.freezed.dart';

enum MembershipRole { organizer, member }

enum MembershipStatus { pending, active }

@freezed
abstract class Membership with _$Membership {
  const factory Membership({
    required String id,
    required String equbId,
    required String userId,
    required MembershipRole role,
    required MembershipStatus status,
    DateTime? joinedAt,
  }) = _Membership;
}
