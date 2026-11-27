import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/providers/session_provider.dart';
import '../../equbs/domain/cycle_period.dart';
import '../../equbs/domain/membership.dart';
import '../../equbs/presentation/providers/equb_providers.dart';
import '../domain/contribution_record.dart';
import '../domain/contribution_repository.dart';
import 'contribution_providers.dart';

const _brandGreen = Color(0xFF14533C);

class ContributionSubmissionScreen extends ConsumerStatefulWidget {
  const ContributionSubmissionScreen({
    super.key,
    required this.equbId,
    required this.roundId,
  });

  final String equbId;
  final String roundId;

  @override
  ConsumerState<ContributionSubmissionScreen> createState() =>
      _ContributionSubmissionScreenState();
}

class _ContributionSubmissionScreenState
    extends ConsumerState<ContributionSubmissionScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    final equb = ref.read(equbProvider(widget.equbId));
    _amountController = TextEditingController(
      text: equb == null ? '' : equb.contributionAmount.toString(),
    );
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(sessionProvider);
    final equb = ref.watch(equbProvider(widget.equbId));
    final membership = ref.watch(currentMembershipProvider(widget.equbId));
    final openRounds = ref.watch(openRoundsForEqubProvider(widget.equbId));

    final selectedRoundId = ref.watch(
      selectedSubmissionRoundProvider(widget.roundId),
    );
    final selectedRound = ref.watch(
      roundProvider((equbId: widget.equbId, roundId: selectedRoundId)),
    );

    if (equb == null) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Submit contribution record',
            subtitle: 'Group unavailable',
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Equb group could not be found.'),
              ),
            ),
          ),
        ],
      );
    }

    if (user == null ||
        membership == null ||
        membership.status != MembershipStatus.active) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Submit contribution record',
            subtitle: equb.title,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _AccessNoticeCard(
              message:
                  'Sign in as an active member of ${equb.title} to submit a contribution declaration.',
              showSignInAction: user == null,
            ),
          ),
        ],
      );
    }

    if (selectedRound == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Submit contribution record',
            subtitle: '${equb.title} · Member: ${user.fullName}',
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('This round does not belong to the selected Equb.'),
              ),
            ),
          ),
        ],
      );
    }

    final existingRecord = ref.watch(
      memberRoundContributionProvider((
        roundId: selectedRound.id,
        memberId: membership.id,
      )),
    );
    final isRoundOpen = selectedRound.status == CyclePeriodStatus.open;
    final isLocked =
        !isRoundOpen ||
        (existingRecord != null &&
            existingRecord.status != ContributionStatus.rejected);

    final dropdownRounds = openRounds.any((r) => r.id == selectedRound.id)
        ? openRounds
        : [selectedRound, ...openRounds];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScreenHeader(
          title: 'Submit contribution record',
          subtitle: '${equb.title} · Member: ${user.fullName}',
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Round', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    key: const ValueKey('submission-round-dropdown'),
                    initialValue: selectedRound.id,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: [
                      for (final round in dropdownRounds)
                        DropdownMenuItem(
                          value: round.id,
                          child: Text(
                            'Round ${round.periodNumber} · ${_roundScheduleText(round)}',
                          ),
                        ),
                    ],
                    onChanged: openRounds.length <= 1
                        ? null
                        : (nextRoundId) {
                            if (nextRoundId == null) {
                              return;
                            }
                            ref
                                .read(
                                  selectedSubmissionRoundProvider(
                                    widget.roundId,
                                  ).notifier,
                                )
                                .select(nextRoundId);
                          },
                  ),
                  if (!isRoundOpen) ...[
                    const SizedBox(height: 12),
                    Card(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'This round is completed. New contribution declarations are closed.',
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextFormField(
                    key: const ValueKey('submission-amount-field'),
                    controller: _amountController,
                    enabled: !isLocked,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Declared amount (ETB)',
                      suffixText: 'ETB',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      final parsed = double.tryParse(value?.trim() ?? '');
                      if (parsed == null || parsed <= 0) {
                        return 'Enter a valid amount greater than 0.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    key: const ValueKey('submission-note-field'),
                    controller: _noteController,
                    enabled: !isLocked,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Note (optional)',
                      hintText: 'Handed cash to organizer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _DisclosureBanner(),
                  const SizedBox(height: 16),
                  _SubmissionStatusCard(existingRecord: existingRecord),
                  const SizedBox(height: 20),
                  FilledButton(
                    key: const ValueKey('send-for-review-button'),
                    style: FilledButton.styleFrom(
                      backgroundColor: _brandGreen,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: isLocked
                        ? null
                        : () => _handleSubmit(roundId: selectedRound.id),
                    child: Text(
                      _submitButtonLabel(
                        isRoundOpen: isRoundOpen,
                        existingRecord: existingRecord,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _submitButtonLabel({
    required bool isRoundOpen,
    required ContributionRecord? existingRecord,
  }) {
    if (!isRoundOpen) {
      return 'Round completed';
    }
    if (existingRecord == null) {
      return 'Send for review';
    }
    return switch (existingRecord.status) {
      ContributionStatus.pending => 'Submitted (Pending review)',
      ContributionStatus.approved => 'Approved for this round',
      ContributionStatus.rejected => 'Resubmit for review',
    };
  }

  void _handleSubmit({required String roundId}) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final amount = double.parse(_amountController.text.trim());
    try {
      ref
          .read(contributionsProvider.notifier)
          .submitContributionForCurrentUser(
            equbId: widget.equbId,
            roundId: roundId,
            declaredAmount: amount,
            note: _noteController.text,
          );
      _noteController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contribution declaration sent for review.'),
        ),
      );
    } on ContributionValidationException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }
}

class ContributionReviewScreen extends ConsumerWidget {
  const ContributionReviewScreen({
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

    if (equb == null || round == null) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Contribution review',
            subtitle: 'Round unavailable',
          ),
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

    final isOrganizer =
        user != null &&
        membership != null &&
        membership.status == MembershipStatus.active &&
        membership.role == MembershipRole.organizer;

    if (!isOrganizer) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ScreenHeader(
            title: 'Contribution review',
            subtitle: '${equb.title} · Round ${round.periodNumber}',
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _AccessNoticeCard(
              message:
                  'Only an active organizer of ${equb.title} can review contribution declarations.',
              showSignInAction: user == null,
            ),
          ),
        ],
      );
    }

    final roster = ref.watch(
      roundRosterStatusProvider((equbId: equbId, roundId: roundId)),
    );
    final pending = roster.pendingEntries;
    final notSubmitted = roster.notSubmittedEntries;
    final approved = roster.approvedEntries;
    final rejected = roster.rejectedEntries;
    final isRoundOpen = round.status == CyclePeriodStatus.open;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScreenHeader(
          title: 'Contribution review',
          subtitle: '${equb.title} · Round ${round.periodNumber}',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  avatar: const Icon(Icons.verified_user_outlined, size: 18),
                  label: Text('Organizer: ${user.fullName}'),
                ),
              ),
              if (!isRoundOpen) ...[
                const SizedBox(height: 8),
                const Text('Round completed (read-only view).'),
              ],
              const SizedBox(height: 16),
              Text(
                'Pending review (${pending.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (pending.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'No pending contribution records for this round.',
                    ),
                  ),
                )
              else
                for (final entry in pending) ...[
                  _PendingReviewCard(
                    key: ValueKey('pending-card-${entry.record!.id}'),
                    equbId: equbId,
                    memberName: entry.memberName,
                    record: entry.record!,
                    canReviewActions: isRoundOpen,
                  ),
                  const SizedBox(height: 12),
                ],
              const SizedBox(height: 16),
              Text(
                'Not submitted (${notSubmitted.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              if (notSubmitted.isEmpty)
                const Text('All active members have submitted for this round.')
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final entry in notSubmitted)
                      Chip(label: Text(entry.memberName)),
                  ],
                ),
              const SizedBox(height: 16),
              ExpansionTile(
                key: const ValueKey('approved-records-tile'),
                title: Text('Approved records (${approved.length})'),
                children: [
                  if (approved.isEmpty)
                    const ListTile(title: Text('No approved records yet.'))
                  else
                    for (final entry in approved)
                      _ReviewedRecordTile(entry: entry),
                ],
              ),
              if (rejected.isNotEmpty)
                ExpansionTile(
                  key: const ValueKey('rejected-records-tile'),
                  title: Text('Rejected records (${rejected.length})'),
                  children: [
                    for (final entry in rejected)
                      _ReviewedRecordTile(entry: entry),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    // Use maybeOf so the screen works both with GoRouter and in standalone widget tests.
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
                  onPressed: () {
                    if (router != null && router.canPop()) {
                      router.pop();
                    } else {
                      navigator?.maybePop();
                    }
                  },
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

class _DisclosureBanner extends StatelessWidget {
  const _DisclosureBanner();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Sends your declaration to the organizer for review. '
              'Payments are not verified — Equb Hub does not process real funds.',
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmissionStatusCard extends StatelessWidget {
  const _SubmissionStatusCard({required this.existingRecord});

  final ContributionRecord? existingRecord;

  @override
  Widget build(BuildContext context) {
    final record = existingRecord;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Current round status',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                _StatusBadge(status: record?.status),
              ],
            ),
            const SizedBox(height: 8),
            if (record == null)
              const Text(
                'Before sending: Not submitted · Once received: Pending review',
              )
            else ...[
              Text('Declared: ${_formatAmount(record.declaredAmount)} ETB'),
              if (record.note != null) Text('Note: ${record.note}'),
              Text('Submitted: ${_formatTimestamp(record.submittedAt)}'),
              if (record.status == ContributionStatus.rejected &&
                  record.rejectionReason != null) ...[
                const SizedBox(height: 6),
                Text(
                  'Rejection reason: ${record.rejectionReason}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _PendingReviewCard extends ConsumerStatefulWidget {
  const _PendingReviewCard({
    super.key,
    required this.equbId,
    required this.memberName,
    required this.record,
    required this.canReviewActions,
  });

  final String equbId;
  final String memberName;
  final ContributionRecord record;
  final bool canReviewActions;

  @override
  ConsumerState<_PendingReviewCard> createState() => _PendingReviewCardState();
}

class _PendingReviewCardState extends ConsumerState<_PendingReviewCard> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final record = widget.record;
    final errorColor = Theme.of(context).colorScheme.error;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.memberName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  _StatusBadge(status: record.status),
                ],
              ),
              const SizedBox(height: 8),
              Text('Declared: ${_formatAmount(record.declaredAmount)} ETB'),
              if (record.note != null) Text('Note: ${record.note}'),
              Text('Submitted: ${_formatTimestamp(record.submittedAt)}'),
              if (widget.canReviewActions) ...[
                const SizedBox(height: 12),
                TextFormField(
                  key: ValueKey('reject-reason-${record.id}'),
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Reason (required to reject)',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Reason is required to reject a contribution.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        key: ValueKey('approve-btn-${record.id}'),
                        style: FilledButton.styleFrom(
                          backgroundColor: _brandGreen,
                        ),
                        onPressed: () => _approve(record),
                        child: const Text('Approve'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        key: ValueKey('reject-btn-${record.id}'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: errorColor,
                          side: BorderSide(color: errorColor),
                        ),
                        onPressed: () => _reject(record),
                        child: const Text('Reject'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _approve(ContributionRecord record) {
    try {
      ref
          .read(contributionsProvider.notifier)
          .approveContribution(
            equbId: widget.equbId,
            contributionId: record.id,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Approved ${widget.memberName}\'s record.')),
      );
    } on ContributionValidationException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  void _reject(ContributionRecord record) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    try {
      ref
          .read(contributionsProvider.notifier)
          .rejectContribution(
            equbId: widget.equbId,
            contributionId: record.id,
            reason: _reasonController.text,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rejected ${widget.memberName}\'s record.')),
      );
    } on ContributionValidationException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }
}

class _ReviewedRecordTile extends StatelessWidget {
  const _ReviewedRecordTile({required this.entry});

  final ContributionRosterEntry entry;

  @override
  Widget build(BuildContext context) {
    final record = entry.record!;
    final details = <String>[
      '${_formatAmount(record.declaredAmount)} ETB',
      if (record.note != null) record.note!,
      if (record.rejectionReason != null) 'Reason: ${record.rejectionReason}',
    ].join(' · ');

    return ListTile(
      dense: true,
      title: Text(entry.memberName),
      subtitle: Text(details),
      trailing: _StatusBadge(status: record.status),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final ContributionStatus? status;

  @override
  Widget build(BuildContext context) {
    final (label, background, foreground) = switch (status) {
      null => ('Not submitted', const Color(0xFFECEFF1), const Color(0xFF455A64)),
      ContributionStatus.pending => (
        ContributionStatus.pending.label,
        const Color(0xFFFFF8E1),
        const Color(0xFF8D6E00),
      ),
      ContributionStatus.approved => (
        ContributionStatus.approved.label,
        const Color(0xFFE8F5E9),
        _brandGreen,
      ),
      ContributionStatus.rejected => (
        ContributionStatus.rejected.label,
        const Color(0xFFFFEBEE),
        const Color(0xFFB71C1C),
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

String _roundScheduleText(CyclePeriod round) {
  final date = '${round.deadline.year}-${round.deadline.month.toString().padLeft(2, '0')}-${round.deadline.day.toString().padLeft(2, '0')}';
  return round.status == CyclePeriodStatus.open
      ? 'due $date'
      : 'completed $date';
}

String _formatAmount(double amount) {
  if (amount == amount.roundToDouble()) {
    return amount.toInt().toString();
  }
  return amount.toStringAsFixed(2);
}

String _formatTimestamp(DateTime timestamp) {
  final local = timestamp.toLocal();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '${local.year}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')} $hour:$minute';
}
