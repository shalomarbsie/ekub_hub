import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}
