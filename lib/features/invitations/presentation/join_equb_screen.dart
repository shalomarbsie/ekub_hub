import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../equbs/domain/equb_group.dart';
import '../domain/qr_scanner_service.dart';
import 'providers/join_providers.dart';

class JoinEqubScreen extends ConsumerStatefulWidget {
  const JoinEqubScreen({super.key});

  @override
  ConsumerState<JoinEqubScreen> createState() => _JoinEqubScreenState();
}

class _JoinEqubScreenState extends ConsumerState<JoinEqubScreen> {
  final _inviteCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        ref.read(joinControllerProvider.notifier).reset();
      }
    });
  }

  @override
  void dispose() {
    _inviteCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final joinState = ref.watch(joinControllerProvider);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('QR Scanner & Join', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 6),
        Text(
          'Scan an organizer\'s QR code or enter the 6-character invite code below.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          key: const Key('scan-button'),
          onPressed: joinState.isScanning
              ? null
              : () async {
                  final code = await ref
                      .read(joinControllerProvider.notifier)
                      .scanInvite();
                  if (mounted && code != null) {
                    _inviteCodeController.text = code;
                  }
                },
          icon: joinState.isScanning
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.qr_code_scanner),
          label: Text(
            joinState.isScanning ? 'Scanning...' : 'Scan QR code (demo)',
          ),
        ),
        if (joinState.scanStatus case final scanStatus?
            when scanStatus != QrScanStatus.scanned) ...[
          const SizedBox(height: 12),
          Card(
            key: const Key('scan-status'),
            child: ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(_scanStatusMessage(scanStatus)),
            ),
          ),
        ],
        const SizedBox(height: 12),
        TextField(
          key: const Key('invite-code-field'),
          controller: _inviteCodeController,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            labelText: 'Invite code',
            hintText: 'e.g. EKUB01',
            border: const OutlineInputBorder(),
            suffixIcon: joinState.inviteCode.isEmpty
                ? null
                : IconButton(
                    tooltip: 'Clear invite code',
                    onPressed: () {
                      _inviteCodeController.clear();
                      ref.read(joinControllerProvider.notifier).reset();
                    },
                    icon: const Icon(Icons.clear),
                  ),
          ),
          onChanged: ref.read(joinControllerProvider.notifier).setInviteCode,
        ),
        if (joinState.previewEqub case final equb?) ...[
          const SizedBox(height: 16),
          Card(
            key: const Key('equb-preview-card'),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(equb.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    '${equb.contributionAmount} ETB • '
                    '${_frequencyLabel(equb.frequency)} • '
                    '${joinState.previewActiveCount}/${equb.memberLimit} members',
                    style: theme.textTheme.bodyMedium,
                  ),
                  if (equb.description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(equb.description, style: theme.textTheme.bodySmall),
                  ],
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        FilledButton(
          key: const Key('request-join-button'),
          onPressed: () {
            ref.read(joinControllerProvider.notifier).submit();
          },
          child: const Text('Request to join'),
        ),
        if (joinState.outcome case final outcome?) ...[
          const SizedBox(height: 16),
          Card(
            key: const Key('join-result'),
            child: ListTile(
              leading: Icon(
                outcome == JoinOutcome.requested
                    ? Icons.check_circle_outline
                    : Icons.info_outline,
              ),
              title: Text(_outcomeMessage(outcome)),
            ),
          ),
        ],
      ],
    );
  }

  String _frequencyLabel(EqubFrequency frequency) {
    return switch (frequency) {
      EqubFrequency.weekly => 'Weekly',
      EqubFrequency.monthly => 'Monthly',
    };
  }

  String _scanStatusMessage(QrScanStatus status) {
    return switch (status) {
      QrScanStatus.scanned => '',
      QrScanStatus.cancelled =>
        'Scan cancelled. Enter the 6-character invite code below.',
      QrScanStatus.permissionDenied =>
        'Camera permission is needed to scan QR codes. You can enter the 6-character invite code manually.',
      QrScanStatus.permissionPermanentlyDenied =>
        'Camera permission is disabled in settings. Enable camera access in Settings or enter the invite code manually.',
      QrScanStatus.unavailable =>
        'Camera scanner is unavailable on this device. Enter the 6-character invite code manually.',
    };
  }

  String _outcomeMessage(JoinOutcome outcome) {
    return switch (outcome) {
      JoinOutcome.requested => 'Pending approval',
      JoinOutcome.invalidCode => 'Enter a valid 6-character invite code.',
      JoinOutcome.notFound => 'No Equb was found for that invite code.',
      JoinOutcome.alreadyMember => 'You are already a member of this Equb.',
      JoinOutcome.alreadyRequested =>
        'Your request is already pending approval.',
      JoinOutcome.equbFull => 'This Equb has reached its member limit.',
      JoinOutcome.signedOut => 'Sign in to request to join an Equb.',
    };
  }
}
