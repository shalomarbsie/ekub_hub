import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final roundContext = ref.read(
      contributionRoundContextProvider((
        equbId: widget.equbId,
        roundId: widget.roundId,
      )),
    );
    _amountController = TextEditingController(
      text: _formatAmount(roundContext.defaultAmount),
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
    final rounds = ref.watch(contributionRoundsProvider(widget.equbId));
    final openRounds = rounds
        .where((round) => round.isOpen)
        .toList(growable: false);
    final selectableRounds = openRounds.isEmpty ? rounds : openRounds;

    final selectedRoundId = ref.watch(
      selectedSubmissionRoundProvider(widget.roundId),
    );
    final activeRound = ref.watch(
      contributionRoundContextProvider((
        equbId: widget.equbId,
        roundId: selectedRoundId,
      )),
    );
    final activeMember = ref.watch(
      activeContributionMemberProvider(widget.equbId),
    );
    final existingRecord = ref.watch(
      memberRoundContributionProvider((
        roundId: activeRound.roundId,
        memberId: activeMember.memberId,
      )),
    );

    final isLocked =
        existingRecord != null &&
        existingRecord.status != ContributionStatus.rejected;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScreenHeader(
          title: 'Submit contribution record',
          subtitle:
              '${activeRound.equbTitle} · Member: ${activeMember.memberName}',
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
                    initialValue:
                        selectableRounds.any(
                          (r) => r.roundId == activeRound.roundId,
                        )
                        ? activeRound.roundId
                        : selectableRounds.first.roundId,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: [
                      for (final round in selectableRounds)
                        DropdownMenuItem(
                          value: round.roundId,
                          child: Text(
                            'Round ${round.roundNumber} · ${round.dueDateLabel}',
                          ),
                        ),
                    ],
                    onChanged: (nextRoundId) {
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
                      final nextContext = ref.read(
                        contributionRoundContextProvider((
                          equbId: widget.equbId,
                          roundId: nextRoundId,
                        )),
                      );
                      _amountController.text = _formatAmount(
                        nextContext.defaultAmount,
                      );
                    },
                  ),
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
                        : () => _handleSubmit(
                            equbId: widget.equbId,
                            roundId: activeRound.roundId,
                            member: activeMember,
                          ),
                    child: Text(_submitButtonLabel(existingRecord)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _submitButtonLabel(ContributionRecord? existingRecord) {
    if (existingRecord == null) {
      return 'Send for review';
    }
    return switch (existingRecord.status) {
      ContributionStatus.pending => 'Submitted (Pending review)',
      ContributionStatus.approved => 'Approved for this round',
      ContributionStatus.rejected => 'Resubmit for review',
    };
  }

  void _handleSubmit({
    required String equbId,
    required String roundId,
    required ContributionMemberSlot member,
  }) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final amount = double.parse(_amountController.text.trim());
    try {
      ref
          .read(contributionsProvider.notifier)
          .submitContribution(
            equbId: equbId,
            cyclePeriodId: roundId,
            memberId: member.memberId,
            memberName: member.memberName,
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
    final roundContext = ref.watch(
      contributionRoundContextProvider((equbId: equbId, roundId: roundId)),
    );
    final roster = ref.watch(
      roundRosterStatusProvider((equbId: equbId, roundId: roundId)),
    );
    final reviewerId = ref.watch(activeContributionReviewerIdProvider);

    final pending = roster.pendingRecords;
    final notSubmitted = roster.notSubmittedMembers;
    final approved = roster.approvedRecords;
    final rejected = roster.rejectedRecords;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ScreenHeader(
          title: 'Contribution review',
          subtitle:
              '${roundContext.equbTitle} · Round ${roundContext.roundNumber}',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  avatar: const Icon(Icons.verified_user_outlined, size: 18),
                  label: Text('Organizer session: $reviewerId'),
                ),
              ),
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
                for (final record in pending) ...[
                  _PendingReviewCard(
                    key: ValueKey('pending-card-${record.id}'),
                    record: record,
                    reviewerId: reviewerId,
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
                    for (final member in notSubmitted)
                      Chip(label: Text(member.memberName)),
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
                    for (final record in approved)
                      _ReviewedRecordTile(record: record),
                ],
              ),
              if (rejected.isNotEmpty)
                ExpansionTile(
                  key: const ValueKey('rejected-records-tile'),
                  title: Text('Rejected records (${rejected.length})'),
                  children: [
                    for (final record in rejected)
                      _ReviewedRecordTile(record: record),
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
    required this.record,
    required this.reviewerId,
  });

  final ContributionRecord record;
  final String reviewerId;

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
                      record.memberName,
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
            contributionId: record.id,
            reviewerId: widget.reviewerId,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Approved ${record.memberName}\'s record.')),
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
            contributionId: record.id,
            reviewerId: widget.reviewerId,
            reason: _reasonController.text,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rejected ${record.memberName}\'s record.')),
      );
    } on ContributionValidationException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    }
  }
}

class _ReviewedRecordTile extends StatelessWidget {
  const _ReviewedRecordTile({required this.record});

  final ContributionRecord record;

  @override
  Widget build(BuildContext context) {
    final details = <String>[
      '${_formatAmount(record.declaredAmount)} ETB',
      if (record.note != null) record.note!,
      if (record.rejectionReason != null) 'Reason: ${record.rejectionReason}',
    ].join(' · ');

    return ListTile(
      dense: true,
      title: Text(record.memberName),
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

String _formatAmount(double amount) {
  if (amount == amount.roundToDouble()) {
    return amount.toInt().toString();
  }
  return amount.toStringAsFixed(2);
}

String _formatTimestamp(DateTime timestamp) {
  final hour = timestamp.hour.toString().padLeft(2, '0');
  final minute = timestamp.minute.toString().padLeft(2, '0');
  return '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')} $hour:$minute';
}
