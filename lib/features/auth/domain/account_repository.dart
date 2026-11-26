import 'user.dart';

abstract interface class AccountRepository {
  User? findById(String userId);

  /// Returns null if the email is already registered.
  User? register({
    required String fullName,
    required String email,
    required String phone,
  });
}
