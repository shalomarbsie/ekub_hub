import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation.freezed.dart';

@freezed
abstract class Invitation with _$Invitation {
  const factory Invitation({
    required String id,
    required String equbId,
    required String inviteCode,
    required String qrPayload,
  }) = _Invitation;
}
