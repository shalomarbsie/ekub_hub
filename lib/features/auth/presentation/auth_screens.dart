import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/demo/demo_ids.dart';
import 'providers/session_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const accounts = [
      (id: DemoIds.memberUserId, label: 'Sign in as Member'),
      (id: DemoIds.organizerUserId, label: 'Sign in as Organizer'),
      (id: DemoIds.prospectUserId, label: 'Sign in as Prospect'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final account in accounts)
              FilledButton(
                onPressed: () {
                  final signedIn = ref
                      .read(sessionProvider.notifier)
                      .signInAsDemo(account.id);

                  if (signedIn) {
                    context.goNamed('dashboard');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Demo account unavailable.'),
                      ),
                    );
                  }
                },
                child: Text(account.label),
              ),
            TextButton(
              onPressed: () => context.goNamed('register'),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value) {
    return (value ?? '').trim().isEmpty ? 'This field is required.' : null;
  }

  String? _validateEmail(String? value) {
    final email = (value ?? '').trim();
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailPattern.hasMatch(email) ? null : 'Enter a valid email address.';
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = ref
        .read(sessionProvider.notifier)
        .register(
          fullName: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('That email is already registered.')),
      );
      return;
    }

    context.goNamed('dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full name'),
              textInputAction: TextInputAction.next,
              validator: _validateRequired,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: _validateEmail,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
              validator: _validateRequired,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _register,
              child: const Text('Create demo account'),
            ),
            TextButton(
              onPressed: () => context.goNamed('signIn'),
              child: const Text('Back to Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
