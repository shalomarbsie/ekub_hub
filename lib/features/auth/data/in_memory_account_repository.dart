import '../../../core/demo/demo_ids.dart';
import '../domain/account_repository.dart';
import '../domain/user.dart';

class InMemoryAccountRepository implements AccountRepository {
  final Map<String, User> _users = {
    DemoIds.organizerUserId: User(
      id: DemoIds.organizerUserId,
      fullName: 'Demo Organizer',
      email: 'organizer@example.com',
      phone: '+251 000 000 001',
      createdAt: DateTime.utc(2026, 10, 1),
    ),
    DemoIds.memberUserId: User(
      id: DemoIds.memberUserId,
      fullName: 'Demo Member',
      email: 'member@example.com',
      phone: '+251 000 000 002',
      createdAt: DateTime.utc(2026, 10, 1),
    ),
    DemoIds.prospectUserId: User(
      id: DemoIds.prospectUserId,
      fullName: 'Demo Prospect',
      email: 'prospect@example.com',
      phone: '+251 000 000 003',
      createdAt: DateTime.utc(2026, 10, 1),
    ),
  };

  int _nextUserNumber = 1;

  @override
  User? findById(String userId) => _users[userId];

  @override
  User? register({
    required String fullName,
    required String email,
    required String phone,
  }) {
    final normalizedEmail = email.trim().toLowerCase();
    if (_users.values.any((user) => user.email == normalizedEmail)) {
      return null;
    }

    final user = User(
      id: 'user-local-${_nextUserNumber++}',
      fullName: fullName.trim(),
      email: normalizedEmail,
      phone: phone.trim(),
      createdAt: DateTime.now().toUtc(),
    );
    _users[user.id] = user;
    return user;
  }
}
