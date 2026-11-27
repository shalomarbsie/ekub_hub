import 'invitation.dart';

abstract interface class InvitationRepository {
  Invitation? findByCode(String code);
}
