import 'cycle_period.dart';
import 'equb_group.dart';
import 'membership.dart';

abstract interface class EqubRepository {
  EqubGroup? findEqub(String equbId);
  List<Membership> membershipsForEqub(String equbId);
  List<CyclePeriod> roundsForEqub(String equbId);
}
