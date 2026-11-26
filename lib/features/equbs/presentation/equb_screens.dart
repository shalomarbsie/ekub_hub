import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _demoRoundIds = {
  'equb-merchant': 'round-merchant-03',
  'equb-family': 'round-family-02',
};

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text('Dashboard')),
        ListTile(
          title: const Text('Merchant Equb'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.pushNamed(
            'equbDetails',
            pathParameters: {'equbId': 'equb-merchant'},
          ),
        ),
      ],
    );
  }
}

class EqubDetailsScreen extends StatelessWidget {
  const EqubDetailsScreen({super.key, required this.equbId});

  final String equbId;

  @override
  Widget build(BuildContext context) {
    final roundId = _demoRoundIds[equbId];
    final roundParameters = {'equbId': equbId, 'roundId': ?roundId};

    return ListView(
      children: [
        ListTile(
          title: const Text('Equb Details'),
          subtitle: Text('Equb ID: $equbId'),
        ),
        if (roundId != null) ...[
          ListTile(
            title: const Text('Contribution Submission'),
            onTap: () => context.pushNamed(
              'submitContribution',
              pathParameters: roundParameters,
            ),
          ),
          ListTile(
            title: const Text('Contribution Review'),
            onTap: () => context.pushNamed(
              'reviewContributions',
              pathParameters: roundParameters,
            ),
          ),
          ListTile(
            title: const Text('Payout & Draw'),
            onTap: () => context.pushNamed(
              'payoutDraw',
              pathParameters: roundParameters,
            ),
          ),
        ],
      ],
    );
  }
}
