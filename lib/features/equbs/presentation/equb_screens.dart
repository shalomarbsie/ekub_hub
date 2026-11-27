import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/equb_group.dart';
import '../domain/equb_roster_entry.dart';
import '../domain/membership.dart';
import 'providers/equb_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(dashboardEqubsProvider);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Dashboard', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        if (groups.isEmpty)
          const Card(child: ListTile(title: Text('No Equbs yet'))),
        for (final group in groups)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(group.title),
              subtitle: Text(
                '${group.contributionAmount} ETB • '
                '${_frequencyLabel(group.frequency)} • '
                '${group.memberLimit} members max',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.pushNamed(
                'equbDetails',
                pathParameters: {'equbId': group.id},
              ),
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
    final theme = Theme.of(context);
    final group = ref.watch(equbProvider(equbId));
    final membership = ref.watch(currentMembershipProvider(equbId));
    final isActiveMember = membership?.status == MembershipStatus.active;
    final canReview =
        isActiveMember && membership?.role == MembershipRole.organizer;

    final activeRound = ref.watch(activeRoundProvider(equbId));
    final completedRound = ref.watch(latestCompletedRoundProvider(equbId));
    final activeRoundId = activeRound?.id;
    final payoutRoundId = activeRoundId ?? completedRound?.id;

    final roster = ref.watch(equbRosterProvider(equbId));
    final aiSummary = ref.watch(equbAiSummaryProvider(equbId));

    void openRoundScreen(String routeName, String roundId) {
      context.pushNamed(
        routeName,
        pathParameters: {'equbId': equbId, 'roundId': roundId},
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Equb Details', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('Equb ID: $equbId', style: theme.textTheme.bodySmall),
          const SizedBox(height: 12),
          if (group == null)
            const Card(child: ListTile(title: Text('Equb group not found.')))
          else ...[
            _GroupInfoCard(
              group: group,
              activeMemberCount: roster.length,
              roundSummary: activeRound != null
                  ? 'Round ${activeRound.periodNumber} • Open'
                  : completedRound != null
                  ? 'Round ${completedRound.periodNumber} • Completed'
                  : null,
            ),
            const SizedBox(height: 12),
            if (aiSummary != null) ...[
              _AiSummaryCard(summary: aiSummary),
              const SizedBox(height: 12),
            ],
            if (isActiveMember &&
                (activeRoundId != null || payoutRoundId != null)) ...[
              Card(
                child: Column(
                  children: [
                    if (isActiveMember && activeRoundId != null)
                      ListTile(
                        dense: true,
                        title: const Text('Contribution Submission'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            openRoundScreen('submitContribution', activeRoundId),
                      ),
                    if (canReview && activeRoundId != null)
                      ListTile(
                        dense: true,
                        title: const Text('Contribution Review'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            openRoundScreen('reviewContributions', activeRoundId),
                      ),
                    if (isActiveMember && payoutRoundId != null)
                      ListTile(
                        dense: true,
                        title: const Text('Payout & Draw'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            openRoundScreen('payoutDraw', payoutRoundId),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text('Member Roster', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            if (roster.isEmpty)
              const Card(child: ListTile(title: Text('No active members yet.')))
            else
              Card(
                child: Column(
                  children: [
                    for (var i = 0; i < roster.length; i++) ...[
                      if (i > 0) const Divider(height: 1),
                      _RosterTile(entry: roster[i]),
                    ],
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _GroupInfoCard extends StatelessWidget {
  const _GroupInfoCard({
    required this.group,
    required this.activeMemberCount,
    this.roundSummary,
  });

  final EqubGroup group;
  final int activeMemberCount;
  final String? roundSummary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(group.title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(group.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text('${group.contributionAmount} ETB')),
                Chip(label: Text(_frequencyLabel(group.frequency))),
                Chip(label: Text('$activeMemberCount / ${group.memberLimit} members')),
                if (roundSummary != null) Chip(label: Text(roundSummary!)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AiSummaryCard extends StatelessWidget {
  const _AiSummaryCard({required this.summary});

  final String summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 20,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                const SizedBox(width: 8),
                Text(
                  'AI Summary',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                const Spacer(),
                Text(
                  'Sample',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              summary,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RosterTile extends StatelessWidget {
  const _RosterTile({required this.entry});

  final EqubRosterEntry entry;

  @override
  Widget build(BuildContext context) {
    final initial = entry.displayName.isNotEmpty
        ? entry.displayName[0].toUpperCase()
        : '?';

    return ListTile(
      leading: CircleAvatar(child: Text(initial)),
      title: Text(entry.displayName),
      subtitle: Text(_roleLabel(entry.role)),
      trailing: _ContributionStatusChip(status: entry.contributionStatus),
    );
  }
}

class _ContributionStatusChip extends StatelessWidget {
  const _ContributionStatusChip({required this.status});

  final ContributionStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPaid = status == ContributionStatus.paid;

    return Chip(
      label: Text(isPaid ? 'Paid' : 'Pending'),
      backgroundColor: isPaid
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainerHighest,
      labelStyle: TextStyle(
        color: isPaid
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurfaceVariant,
      ),
      side: BorderSide.none,
    );
  }
}

String _frequencyLabel(EqubFrequency frequency) {
  return switch (frequency) {
    EqubFrequency.weekly => 'Weekly',
    EqubFrequency.monthly => 'Monthly',
  };
}

String _roleLabel(MembershipRole role) {
  return switch (role) {
    MembershipRole.organizer => 'Organizer',
    MembershipRole.member => 'Member',
  };
}
