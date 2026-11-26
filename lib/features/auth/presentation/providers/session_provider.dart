import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/in_memory_account_repository.dart';
import '../../domain/account_repository.dart';
import '../../domain/user.dart';

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return InMemoryAccountRepository();
});

final sessionProvider = NotifierProvider<SessionController, User?>(
  SessionController.new,
);

class SessionController extends Notifier<User?> {
  @override
  User? build() => null;

  bool signInAsDemo(String userId) {
    final user = ref.read(accountRepositoryProvider).findById(userId);
    if (user == null) {
      return false;
    }

    state = user;
    return true;
  }

  User? register({
    required String fullName,
    required String email,
    required String phone,
  }) {
    final user = ref
        .read(accountRepositoryProvider)
        .register(fullName: fullName, email: email, phone: phone);
    if (user != null) {
      state = user;
    }
    return user;
  }

  void signOut() {
    state = null;
  }
}
