import 'package:freezed_annotation/freezed_annotation.dart';

import 'membership.dart';

part 'equb_roster_entry.freezed.dart';

enum ContributionStatus { paid, pending }

@freezed
abstract class EqubRosterEntry with _$EqubRosterEntry {
  const factory EqubRosterEntry({
    required String membershipId,
    required String userId,
    required String displayName,
    required MembershipRole role,
    required ContributionStatus contributionStatus,
  }) = _EqubRosterEntry;
}
