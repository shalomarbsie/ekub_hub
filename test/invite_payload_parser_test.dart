import 'package:ekub_hub/features/invitations/domain/invite_payload_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('normalizes a bare invite code', () {
    expect(parseInviteCode(' ekub01 '), 'EKUB01');
  });

  test('extracts and normalizes a code from a QR payload', () {
    expect(parseInviteCode('ekubhub://join?code=ekub01'), 'EKUB01');
  });

  test('rejects malformed or empty input', () {
    expect(parseInviteCode('abc'), isNull);
    expect(parseInviteCode(''), isNull);
    expect(parseInviteCode('ekubhub://other?code=EKUB01'), isNull);
  });
}
