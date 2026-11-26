import 'package:flutter/material.dart';

class ContributionSubmissionScreen extends StatelessWidget {
  const ContributionSubmissionScreen({
    super.key,
    required this.equbId,
    required this.roundId,
  });

  final String equbId;
  final String roundId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Contribution Submission'),
      subtitle: Text('Equb ID: $equbId\nRound ID: $roundId'),
    );
  }
}

class ContributionReviewScreen extends StatelessWidget {
  const ContributionReviewScreen({
    super.key,
    required this.equbId,
    required this.roundId,
  });

  final String equbId;
  final String roundId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Contribution Review'),
      subtitle: Text('Equb ID: $equbId\nRound ID: $roundId'),
    );
  }
}
