import 'cycle_period.dart';
import 'equb_group.dart';
import 'equb_roster_entry.dart';
import 'membership.dart';

abstract interface class EqubRepository {
  List<EqubGroup> allEqubs();
  EqubGroup? findEqub(String equbId);
  List<Membership> membershipsForEqub(String equbId);
  List<CyclePeriod> roundsForEqub(String equbId);
  Map<String, ContributionStatus> contributionStatusesForEqub(String equbId);

  EqubGroup createEqub({
    required String title,
    required int contributionAmount,
    required EqubFrequency frequency,
    required int memberLimit,
    required String organizerId,
    required DateTime startDate,
    String? description,
  });
}
