import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/demo/demo_ids.dart';
import '../domain/equb_group.dart';
import '../domain/membership.dart';
import 'providers/equb_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = <EqubGroup>[];

    for (final equbId in const [DemoIds.merchantEqubId, DemoIds.familyEqubId]) {
      final membership = ref.watch(currentMembershipProvider(equbId));
      final group = ref.watch(equbProvider(equbId));

      if (membership?.status == MembershipStatus.active && group != null) {
        groups.add(group);
      }
    }

    return ListView(
      children: [
        const ListTile(title: Text('Dashboard')),
        if (groups.isEmpty) const ListTile(title: Text('No Equbs yet')),
        for (final group in groups)
          ListTile(
            title: Text(group.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(
              'equbDetails',
              pathParameters: {'equbId': group.id},
            ),
          ),
      ],
    );
  }
}

class EqubDetailsScreen extends ConsumerWidget {
  const EqubDetailsScreen({super.key, required this.equbId});

  final String equbId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membership = ref.watch(currentMembershipProvider(equbId));
    final isActiveMember = membership?.status == MembershipStatus.active;
    final canReview =
        isActiveMember && membership?.role == MembershipRole.organizer;

    final activeRoundId = ref.watch(activeRoundProvider(equbId))?.id;
    final payoutRoundId =
        activeRoundId ?? ref.watch(latestCompletedRoundProvider(equbId))?.id;

    void openRoundScreen(String routeName, String roundId) {
      context.pushNamed(
        routeName,
        pathParameters: {'equbId': equbId, 'roundId': roundId},
      );
    }

    return ListView(
      children: [
        ListTile(
          title: const Text('Equb Details'),
          subtitle: Text('Equb ID: $equbId'),
        ),
        if (isActiveMember && activeRoundId != null)
          ListTile(
            title: const Text('Contribution Submission'),
            onTap: () => openRoundScreen('submitContribution', activeRoundId),
          ),
        if (canReview && activeRoundId != null)
          ListTile(
            title: const Text('Contribution Review'),
            onTap: () => openRoundScreen('reviewContributions', activeRoundId),
          ),
        if (isActiveMember && payoutRoundId != null)
          ListTile(
            title: const Text('Payout & Draw'),
            onTap: () => openRoundScreen('payoutDraw', payoutRoundId),
          ),
      ],
    );
  }
}
