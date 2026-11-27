import 'package:ekub_hub/core/demo/demo_ids.dart';
import 'package:ekub_hub/features/auth/presentation/providers/session_provider.dart';
import 'package:ekub_hub/features/equbs/data/in_memory_equb_repository.dart';
import 'package:ekub_hub/features/equbs/domain/membership.dart';
import 'package:ekub_hub/features/equbs/presentation/providers/equb_providers.dart';
import 'package:ekub_hub/features/invitations/data/fake_qr_scanner_service.dart';
import 'package:ekub_hub/features/invitations/domain/qr_scanner_service.dart';
import 'package:ekub_hub/features/invitations/presentation/providers/join_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('prospect request creates a pending membership', () {
    final container = ProviderContainer.test();
    container
        .read(sessionProvider.notifier)
        .signInAsDemo(DemoIds.prospectUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode(DemoIds.merchantInviteCode);

    expect(controller.submit(), JoinOutcome.requested);

    final membership = container
        .read(membershipsForEqubProvider(DemoIds.merchantEqubId))
        .singleWhere((item) => item.userId == DemoIds.prospectUserId);
    expect(
      membership.id,
      'membership-${DemoIds.merchantEqubId}-${DemoIds.prospectUserId}',
    );
    expect(membership.role, MembershipRole.member);
    expect(membership.status, MembershipStatus.pending);
    expect(membership.joinedAt, isNull);
  });

  test('repeated request returns alreadyRequested', () {
    final container = ProviderContainer.test();
    container
        .read(sessionProvider.notifier)
        .signInAsDemo(DemoIds.prospectUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode(DemoIds.merchantInviteCode);

    expect(controller.submit(), JoinOutcome.requested);
    expect(controller.submit(), JoinOutcome.alreadyRequested);
  });

  test('unknown valid code returns notFound', () {
    final container = ProviderContainer.test();
    container
        .read(sessionProvider.notifier)
        .signInAsDemo(DemoIds.prospectUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode('ZZZZZZ');

    expect(controller.submit(), JoinOutcome.notFound);
  });

  test('malformed code returns invalidCode', () {
    final container = ProviderContainer.test();
    container
        .read(sessionProvider.notifier)
        .signInAsDemo(DemoIds.prospectUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode('abc');

    expect(controller.submit(), JoinOutcome.invalidCode);
  });

  test('active member returns alreadyMember', () {
    final container = ProviderContainer.test();
    container.read(sessionProvider.notifier).signInAsDemo(DemoIds.memberUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode(DemoIds.merchantInviteCode);

    expect(controller.submit(), JoinOutcome.alreadyMember);
  });

  test('signed-out user returns signedOut before validating code', () {
    final container = ProviderContainer.test();
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode('bad');

    expect(controller.submit(), JoinOutcome.signedOut);
  });

  test('full Equb returns equbFull and reset clears the result', () {
    final repository = InMemoryEqubRepository();
    for (var index = 0; index < 8; index++) {
      repository.addMembership(
        Membership(
          id: 'extra-membership-$index',
          equbId: DemoIds.merchantEqubId,
          userId: 'extra-user-$index',
          role: MembershipRole.member,
          status: MembershipStatus.active,
        ),
      );
    }

    final container = ProviderContainer.test(
      overrides: [equbRepositoryProvider.overrideWithValue(repository)],
    );
    container
        .read(sessionProvider.notifier)
        .signInAsDemo(DemoIds.prospectUserId);
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode(DemoIds.merchantInviteCode);

    expect(controller.submit(), JoinOutcome.equbFull);
    controller.reset();
    expect(container.read(joinControllerProvider).outcome, isNull);
    expect(container.read(joinControllerProvider).inviteCode, isEmpty);
  });

  test('setInviteCode resolves previewEqub and clears on unknown code', () {
    final container = ProviderContainer.test();
    final controller = container.read(joinControllerProvider.notifier);

    controller.setInviteCode('ekub01');
    final matchedState = container.read(joinControllerProvider);
    expect(matchedState.previewEqub?.id, DemoIds.merchantEqubId);
    expect(matchedState.previewActiveCount, 2);

    controller.setInviteCode('ZZZZZZ');
    final unknownState = container.read(joinControllerProvider);
    expect(unknownState.previewEqub, isNull);
    expect(unknownState.previewActiveCount, 0);
  });

  test('scanInvite populates code and preview on success', () async {
    final container = ProviderContainer.test(
      overrides: [
        qrScannerServiceProvider.overrideWithValue(FakeQrScannerService()),
      ],
    );
    final controller = container.read(joinControllerProvider.notifier);

    final code = await controller.scanInvite();
    final state = container.read(joinControllerProvider);

    expect(code, DemoIds.merchantInviteCode);
    expect(state.inviteCode, DemoIds.merchantInviteCode);
    expect(state.scanStatus, QrScanStatus.scanned);
    expect(state.previewEqub?.id, DemoIds.merchantEqubId);
  });

  test('scanInvite surfaces permissionDenied without clearing manual code', () async {
    final container = ProviderContainer.test(
      overrides: [
        qrScannerServiceProvider.overrideWithValue(
          FakeQrScannerService(result: const QrScanResult.permissionDenied()),
        ),
      ],
    );
    final controller = container.read(joinControllerProvider.notifier);
    controller.setInviteCode('EKUB01');

    final code = await controller.scanInvite();
    final state = container.read(joinControllerProvider);

    expect(code, isNull);
    expect(state.scanStatus, QrScanStatus.permissionDenied);
    expect(state.inviteCode, 'EKUB01');
  });
}
