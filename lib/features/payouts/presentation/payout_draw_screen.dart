import 'package:flutter/material.dart';

class PayoutDrawScreen extends StatelessWidget {
  const PayoutDrawScreen({
    super.key,
    required this.equbId,
    required this.roundId,
  });

  final String equbId;
  final String roundId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Payout & Draw'),
      subtitle: Text('Equb ID: $equbId\nRound ID: $roundId'),
    );
  }
}
