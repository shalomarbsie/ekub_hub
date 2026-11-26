import 'package:ekub_hub/core/demo/demo_ids.dart';
import 'package:ekub_hub/features/auth/presentation/providers/session_provider.dart';
import 'package:ekub_hub/features/equbs/domain/cycle_period.dart';
import 'package:ekub_hub/features/equbs/domain/membership.dart';
import 'package:ekub_hub/features/equbs/presentation/providers/equb_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Resolves the Merchant membership and active round after sign-in', () {
    final container = ProviderContainer.test();
    final session = container.read(sessionProvider.notifier);
    final merchantMembership = currentMembershipProvider(
      DemoIds.merchantEqubId,
    );
    final merchantActiveRound = activeRoundProvider(DemoIds.merchantEqubId);

    expect(container.read(merchantMembership), isNull);

    expect(session.signInAsDemo(DemoIds.memberUserId), isTrue);
    expect(container.read(sessionProvider)?.id, DemoIds.memberUserId);

    final member = container.read(merchantMembership);
    expect(member?.id, DemoIds.merchantMemberMembershipId);
    expect(member?.role, MembershipRole.member);
    expect(member?.status, MembershipStatus.active);

    final round = container.read(merchantActiveRound);
    expect(round?.id, DemoIds.merchantRoundId);
    expect(round?.status, CyclePeriodStatus.open);

    expect(session.signInAsDemo(DemoIds.organizerUserId), isTrue);
    final organizer = container.read(merchantMembership);
    expect(organizer?.id, DemoIds.merchantOrganizerMembershipId);
    expect(organizer?.role, MembershipRole.organizer);
    expect(container.read(merchantActiveRound)?.id, DemoIds.merchantRoundId);

    session.signOut();
    expect(container.read(sessionProvider), isNull);
    expect(container.read(merchantMembership), isNull);
  });
}
