import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/providers/session_provider.dart';
import '../domain/equb_group.dart';
import 'providers/equb_providers.dart';

class CreateEqubScreen extends ConsumerStatefulWidget {
  const CreateEqubScreen({super.key});

  @override
  ConsumerState<CreateEqubScreen> createState() => _CreateEqubScreenState();
}

class _CreateEqubScreenState extends ConsumerState<CreateEqubScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _maxMembersController = TextEditingController();
  final _startDateController = TextEditingController();

  EqubFrequency _frequency = EqubFrequency.weekly;
  late DateTime _startDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, now.day);
    _startDateController.text = _formatDate(_startDate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _maxMembersController.dispose();
    _startDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  String? _validateName(String? value) {
    return (value ?? '').trim().isEmpty ? 'Enter an Equb name.' : null;
  }

  String? _validateAmount(String? value) {
    final parsed = int.tryParse((value ?? '').trim());
    if (parsed == null || parsed <= 0) {
      return 'Enter a positive amount.';
    }
    return null;
  }

  String? _validateMaxMembers(String? value) {
    final parsed = int.tryParse((value ?? '').trim());
    if (parsed == null || parsed < 2) {
      return 'Enter at least 2 members.';
    }
    return null;
  }

  String? _validateStartDate(String? value) {
    return (value ?? '').trim().isEmpty ? 'Select a start date.' : null;
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked == null) {
      return;
    }

    setState(() {
      _startDate = picked;
      _startDateController.text = _formatDate(picked);
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = ref.read(sessionProvider);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in to create an Equb.')),
      );
      return;
    }

    ref
        .read(equbGroupsProvider.notifier)
        .createEqub(
          title: _nameController.text,
          contributionAmount: int.parse(_amountController.text.trim()),
          frequency: _frequency,
          memberLimit: int.parse(_maxMembersController.text.trim()),
          organizerId: user.id,
          startDate: DateTime.utc(
            _startDate.year,
            _startDate.month,
            _startDate.day,
          ),
        );

    context.goNamed('dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Create Equb', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Equb name'),
            textInputAction: TextInputAction.next,
            validator: _validateName,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Contribution amount (ETB)',
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: _validateAmount,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<EqubFrequency>(
            initialValue: _frequency,
            decoration: const InputDecoration(labelText: 'Frequency'),
            items: const [
              DropdownMenuItem(
                value: EqubFrequency.weekly,
                child: Text('Weekly'),
              ),
              DropdownMenuItem(
                value: EqubFrequency.monthly,
                child: Text('Monthly'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _frequency = value);
              }
            },
            validator: (value) =>
                value == null ? 'Select a frequency.' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _maxMembersController,
            decoration: const InputDecoration(labelText: 'Max members'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: _validateMaxMembers,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _startDateController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Start date',
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            onTap: _pickStartDate,
            validator: _validateStartDate,
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _submit,
            child: const Text('Create Equb'),
          ),
        ],
      ),
    );
  }
}
