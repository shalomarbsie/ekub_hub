import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/session_provider.dart';
import '../../../equbs/domain/equb_group.dart';
import '../../../equbs/domain/membership.dart';
import '../../../equbs/presentation/providers/equb_providers.dart';
import '../../data/fake_qr_scanner_service.dart';
import '../../data/in_memory_invitation_repository.dart';
import '../../domain/invitation_repository.dart';
import '../../domain/invite_payload_parser.dart';
import '../../domain/qr_scanner_service.dart';

enum JoinOutcome {
  requested,
  invalidCode,
  notFound,
  alreadyMember,
  alreadyRequested,
  equbFull,
  signedOut,
}

class JoinState {
  const JoinState({
    this.inviteCode = '',
    this.isScanning = false,
    this.scanStatus,
    this.outcome,
    this.previewEqub,
    this.previewActiveCount = 0,
  });

  final String inviteCode;
  final bool isScanning;
  final QrScanStatus? scanStatus;
  final JoinOutcome? outcome;
  final EqubGroup? previewEqub;
  final int previewActiveCount;
}

final invitationRepositoryProvider = Provider<InvitationRepository>((ref) {
  return InMemoryInvitationRepository();
});

final qrScannerServiceProvider = Provider<QrScannerService>((ref) {
  return FakeQrScannerService();
});

final joinControllerProvider = NotifierProvider<JoinController, JoinState>(
  JoinController.new,
);

class JoinController extends Notifier<JoinState> {
  @override
  JoinState build() => const JoinState();

  void reset() {
    state = const JoinState();
  }

  void setInviteCode(String value) {
    final preview = _resolvePreview(value);
    state = JoinState(
      inviteCode: value,
      previewEqub: preview.equb,
      previewActiveCount: preview.activeCount,
    );
  }

  Future<String?> scanInvite() async {
    state = JoinState(
      inviteCode: state.inviteCode,
      isScanning: true,
      previewEqub: state.previewEqub,
      previewActiveCount: state.previewActiveCount,
    );

    final result = await ref.read(qrScannerServiceProvider).scanInvitePayload();
    if (result.status != QrScanStatus.scanned) {
      state = JoinState(
        inviteCode: state.inviteCode,
        scanStatus: result.status,
        previewEqub: state.previewEqub,
        previewActiveCount: state.previewActiveCount,
      );
      return null;
    }

    final code = parseInviteCode(result.payload ?? '');
    if (code == null) {
      state = JoinState(
        inviteCode: state.inviteCode,
        outcome: JoinOutcome.invalidCode,
        previewEqub: state.previewEqub,
        previewActiveCount: state.previewActiveCount,
      );
      return null;
    }

    final preview = _resolvePreview(code);
    state = JoinState(
      inviteCode: code,
      scanStatus: QrScanStatus.scanned,
      previewEqub: preview.equb,
      previewActiveCount: preview.activeCount,
    );
    return code;
  }

  JoinOutcome submit() {
    // Keep this order: signedOut, invalidCode, notFound,
    // alreadyMember, alreadyRequested, equbFull, then requested.
    final user = ref.read(sessionProvider);
    if (user == null) {
      return _finish(JoinOutcome.signedOut);
    }

    final code = parseInviteCode(state.inviteCode);
    if (code == null) {
      return _finish(JoinOutcome.invalidCode);
    }

    final invitation = ref.read(invitationRepositoryProvider).findByCode(code);
    if (invitation == null) {
      return _finish(JoinOutcome.notFound);
    }

    final equb = ref.read(equbProvider(invitation.equbId));
    if (equb == null) {
      return _finish(JoinOutcome.notFound);
    }

    final memberships = ref.read(membershipsForEqubProvider(invitation.equbId));
    var hasPendingRequest = false;
    for (final membership in memberships) {
      if (membership.userId != user.id) {
        continue;
      }
      if (membership.status == MembershipStatus.active) {
        return _finish(JoinOutcome.alreadyMember);
      }
      if (membership.status == MembershipStatus.pending) {
        hasPendingRequest = true;
      }
    }
    if (hasPendingRequest) {
      return _finish(JoinOutcome.alreadyRequested);
    }

    // Pending requests do not take a member slot until they become active.
    final activeCount = memberships
        .where((membership) => membership.status == MembershipStatus.active)
        .length;
    if (activeCount >= equb.memberLimit) {
      return _finish(JoinOutcome.equbFull);
    }

    ref
        .read(equbRepositoryProvider)
        .addMembership(
          Membership(
            id: 'membership-${equb.id}-${user.id}',
            equbId: equb.id,
            userId: user.id,
            role: MembershipRole.member,
            status: MembershipStatus.pending,
          ),
        );
    ref.invalidate(membershipsForEqubProvider(equb.id));

    return _finish(
      JoinOutcome.requested,
      previewEqub: equb,
      previewActiveCount: activeCount,
    );
  }

  ({EqubGroup? equb, int activeCount}) _resolvePreview(String rawCode) {
    final code = parseInviteCode(rawCode);
    if (code == null) {
      return (equb: null, activeCount: 0);
    }
    final invitation = ref.read(invitationRepositoryProvider).findByCode(code);
    if (invitation == null) {
      return (equb: null, activeCount: 0);
    }
    final equb = ref.read(equbProvider(invitation.equbId));
    if (equb == null) {
      return (equb: null, activeCount: 0);
    }
    final activeCount = ref
        .read(membershipsForEqubProvider(equb.id))
        .where((membership) => membership.status == MembershipStatus.active)
        .length;
    return (equb: equb, activeCount: activeCount);
  }

  JoinOutcome _finish(
    JoinOutcome outcome, {
    EqubGroup? previewEqub,
    int? previewActiveCount,
  }) {
    final fallback = _resolvePreview(state.inviteCode);
    state = JoinState(
      inviteCode: state.inviteCode,
      outcome: outcome,
      previewEqub: previewEqub ?? fallback.equb,
      previewActiveCount: previewActiveCount ?? fallback.activeCount,
    );
    return outcome;
  }
}
