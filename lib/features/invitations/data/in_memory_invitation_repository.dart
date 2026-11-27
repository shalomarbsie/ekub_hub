import '../../../core/demo/demo_ids.dart';
import '../domain/invitation.dart';
import '../domain/invitation_repository.dart';

class InMemoryInvitationRepository implements InvitationRepository {
  final Map<String, Invitation> _invitations = {
    DemoIds.merchantInviteCode: Invitation(
      id: DemoIds.merchantInvitationId,
      equbId: DemoIds.merchantEqubId,
      inviteCode: DemoIds.merchantInviteCode,
      qrPayload: 'ekubhub://join?code=${DemoIds.merchantInviteCode}',
    ),
  };

  @override
  Invitation? findByCode(String code) => _invitations[code];
}
