import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/session_provider.dart';
import '../../data/in_memory_equb_repository.dart';
import '../../domain/cycle_period.dart';
import '../../domain/equb_group.dart';
import '../../domain/equb_repository.dart';
import '../../domain/membership.dart';

typedef EqubRoundKey = ({String equbId, String roundId});

final equbRepositoryProvider = Provider<EqubRepository>((ref) {
  return InMemoryEqubRepository();
});

final equbProvider = Provider.family<EqubGroup?, String>((ref, equbId) {
  return ref.watch(equbRepositoryProvider).findEqub(equbId);
});

final membershipsForEqubProvider = Provider.family<List<Membership>, String>((
  ref,
  equbId,
) {
  return ref.watch(equbRepositoryProvider).membershipsForEqub(equbId);
});

final currentMembershipProvider = Provider.family<Membership?, String>((
  ref,
  equbId,
) {
  final user = ref.watch(sessionProvider);
  if (user == null) {
    return null;
  }

  final memberships = ref.watch(membershipsForEqubProvider(equbId));
  for (final membership in memberships) {
    if (membership.userId == user.id) {
      return membership;
    }
  }
  return null;
});

final activeRoundProvider = Provider.family<CyclePeriod?, String>((
  ref,
  equbId,
) {
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(equbId);
  for (final round in rounds) {
    if (round.status == CyclePeriodStatus.open) {
      return round;
    }
  }
  return null;
});

final roundProvider = Provider.family<CyclePeriod?, EqubRoundKey>((ref, key) {
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(key.equbId);
  for (final round in rounds) {
    if (round.id == key.roundId) {
      return round;
    }
  }
  return null;
});

final latestCompletedRoundProvider = Provider.family<CyclePeriod?, String>((
  ref,
  equbId,
) {
  final rounds = ref.watch(equbRepositoryProvider).roundsForEqub(equbId);
  CyclePeriod? latest;

  for (final round in rounds) {
    if (round.status == CyclePeriodStatus.completed &&
        (latest == null || round.periodNumber > latest.periodNumber)) {
      latest = round;
    }
  }

  return latest;
});
