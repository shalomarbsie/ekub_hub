final _inviteCodePattern = RegExp(r'^[A-Z0-9]{6}$');

String? parseInviteCode(String input) {
  final value = input.trim();
  final String candidate;

  if (value.startsWith('ekubhub://')) {
    final uri = Uri.tryParse(value);
    if (uri == null ||
        uri.scheme != 'ekubhub' ||
        uri.host != 'join' ||
        uri.path.isNotEmpty) {
      return null;
    }
    candidate = uri.queryParameters['code'] ?? '';
  } else {
    candidate = value;
  }

  final code = candidate.trim().toUpperCase();
  return _inviteCodePattern.hasMatch(code) ? code : null;
}
