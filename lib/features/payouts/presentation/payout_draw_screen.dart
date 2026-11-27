import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/providers/session_provider.dart';
import '../../equbs/domain/cycle_period.dart';
import '../../equbs/domain/membership.dart';
import '../../equbs/presentation/providers/equb_providers.dart';
import '../domain/payout_draw.dart';
import '../domain/payout_repository.dart';
import 'payout_providers.dart';

const _brandGreen = Color(0xFF14533C);

class PayoutDrawScreen extends ConsumerWidget {
  const PayoutDrawScreen({
    super.key,
    required this.equbId,
    required this.roundId,
  });

  final String equbId;
  final String roundId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider);
    final equb = ref.watch(equbProvider(equbId));
    final round = ref.watch(roundProvider((equbId: equbId, roundId: roundId)));
    final membership = ref.watch(currentMembershipProvider(equbId));
    final readiness = ref.watch(
      payoutReadinessProvider((equbId: equbId, roundId: roundId)),
    );

    if (equb == null || round == null || readiness == null) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(title: 'Payout & draw', subtitle: 'Round unavailable'),
          Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Equb or round could not be found.'),
              ),
            ),
          ),
        ],
      );
    }

    final isActiveMember =
        user != null &&
        membership != null &&
        membership.status == MembershipStatus.active;

    if (!isActiveMember) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Payout & draw',
            subtitle: '${equb.title} · Round ${round.periodNumber}',
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _AccessNoticeCard(
              message:
                  'Sign in as an active member of ${equb.title} to view payout readiness and draw results.',
              showSignInAction: user == null,
            ),
          ),
        ],
      );
    }

    final isOrganizer = membership.role == MembershipRole.organizer;
    final currentDraw = readiness.currentRoundDraw;
    final isRoundOpen = round.status == CyclePeriodStatus.open;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScreenHeader(
          title: 'Payout & draw',
          subtitle: '${equb.title} · Round ${round.periodNumber}',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (currentDraw != null)
                _WinnerBannerCard(
                  periodNumber: round.periodNumber,
                  historyItem: currentDraw,
                )
              else
                _ReadinessBannerCard(readiness: readiness),
              const SizedBox(height: 16),
              Text(
                currentDraw != null
                    ? 'Remaining eligible (${readiness.eligibleMembers.length})'
                    : 'Eligible members (${readiness.eligibleMembers.length} not yet won)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (readiness.eligibleMembers.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Cycle complete — all active members have received a turn. Eligibility resets next round.',
                    ),
                  ),
                )
              else
                Card(
                  child: Column(
                    children: [
                      for (
                        var i = 0;
                        i < readiness.eligibleMembers.length;
                        i++
                      ) ...[
                        if (i > 0) const Divider(height: 1),
                        ListTile(
                          dense: true,
                          leading: const Icon(Icons.person_outline),
                          title: Text(readiness.eligibleMembers[i].memberName),
                          subtitle: Text(
                            readiness.eligibleMembers[i].membership.role ==
                                    MembershipRole.organizer
                                ? 'Organizer'
                                : 'Member',
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                'Past winners (${readiness.pastDraws.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (readiness.pastDraws.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text('No past payout draws yet.'),
                  ),
                )
              else
                Card(
                  child: Column(
                    children: [
                      for (var i = 0; i < readiness.pastDraws.length; i++) ...[
                        if (i > 0) const Divider(height: 1),
                        _PastWinnerTile(item: readiness.pastDraws[i]),
                      ],
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              if (currentDraw != null)
                OutlinedButton(
                  key: const ValueKey('back-to-equb-button'),
                  onPressed: () => _popRoute(context),
                  child: const Text('Back to Equb'),
                )
              else if (isOrganizer) ...[
                Text(
                  'Organizer only',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 6),
                FilledButton(
                  key: const ValueKey('run-draw-button'),
                  style: FilledButton.styleFrom(
                    backgroundColor: _brandGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: isRoundOpen && readiness.isReadyForDraw
                      ? () => _runDraw(context, ref)
                      : null,
                  child: const Text('Run draw'),
                ),
              ] else
                const Text(
                  'Organizer only: only the group organizer can run the draw once all contributions are approved.',
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _runDraw(BuildContext context, WidgetRef ref) {
    try {
      final result = ref
          .read(payoutDrawsProvider.notifier)
          .runDraw(equbId: equbId, roundId: roundId);
      final winnerName = ref
          .read(payoutReadinessProvider((equbId: equbId, roundId: roundId)))
          ?.currentRoundDraw
          ?.winnerName;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Round ${result.periodNumber} winner: ${winnerName ?? result.selectedWinnerMemberId}',
          ),
        ),
      );
    } on PayoutValidationException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    final navigator = Navigator.maybeOf(context);
    final canPop = router?.canPop() ?? navigator?.canPop() ?? false;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (canPop)
                IconButton(
                  tooltip: 'Back',
                  onPressed: () => _popRoute(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class _ReadinessBannerCard extends StatelessWidget {
  const _ReadinessBannerCard({required this.readiness});

  final PayoutReadiness readiness;

  @override
  Widget build(BuildContext context) {
    final ready = readiness.isReadyForDraw;
    final background = ready
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFF8E1);
    final foreground = ready ? _brandGreen : const Color(0xFF8D6E00);

    final summaryParts = <String>[
      '${readiness.approvedCount} of ${readiness.totalActiveMembers} approved',
      if (readiness.pendingCount > 0) '${readiness.pendingCount} pending',
      if (readiness.notSubmittedCount > 0)
        '${readiness.notSubmittedCount} not submitted',
      if (readiness.rejectedCount > 0) '${readiness.rejectedCount} rejected',
    ];

    return Card(
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              ready ? Icons.check_circle_outline : Icons.hourglass_bottom,
              color: foreground,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ready ? 'Ready for draw' : 'Waiting for contributions',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: foreground),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ready
                        ? 'All ${readiness.totalActiveMembers} contribution records approved'
                        : summaryParts.join(' · '),
                    style: TextStyle(color: foreground),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WinnerBannerCard extends StatelessWidget {
  const _WinnerBannerCard({
    required this.periodNumber,
    required this.historyItem,
  });

  final int periodNumber;
  final PayoutHistoryItem historyItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE8F5E9),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Round $periodNumber winner',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: _brandGreen),
            ),
            const SizedBox(height: 6),
            Text(
              historyItem.winnerName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: _brandGreen,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Drawn ${_formatDate(historyItem.draw.drawnAt)}',
              style: const TextStyle(color: _brandGreen),
            ),
          ],
        ),
      ),
    );
  }
}

class _PastWinnerTile extends StatelessWidget {
  const _PastWinnerTile({required this.item});

  final PayoutHistoryItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Text(
        'Round ${item.draw.periodNumber}',
        style: Theme.of(context).textTheme.labelLarge,
      ),
      title: Text(item.winnerName),
      trailing: Text(_formatDate(item.draw.drawnAt)),
    );
  }
}

class _AccessNoticeCard extends StatelessWidget {
  const _AccessNoticeCard({
    required this.message,
    required this.showSignInAction,
  });

  final String message;
  final bool showSignInAction;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            if (showSignInAction && router != null) ...[
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => router.goNamed('signIn'),
                child: const Text('Go to Sign In'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void _popRoute(BuildContext context) {
  final router = GoRouter.maybeOf(context);
  if (router != null && router.canPop()) {
    router.pop();
  } else {
    Navigator.maybeOf(context)?.maybePop();
  }
}

String _formatDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${local.day} ${months[local.month - 1]} ${local.year}';
}
