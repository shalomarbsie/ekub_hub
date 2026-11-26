import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/session_provider.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openDestination(String routeName) {
      Navigator.of(context).pop();
      context.goNamed(routeName);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Equb Hub')),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.dashboard_outlined),
                title: const Text('Dashboard'),
                onTap: () => openDestination('dashboard'),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Create Equb'),
                onTap: () => openDestination('createEqub'),
              ),
              ListTile(
                leading: const Icon(Icons.qr_code_scanner),
                title: const Text('QR Scanner & Join'),
                onTap: () => openDestination('joinEqub'),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
                onTap: () {
                  ref.read(sessionProvider.notifier).signOut();
                  openDestination('signIn');
                },
              ),
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}
