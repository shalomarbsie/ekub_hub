import 'contribution_record.dart';

class ContributionValidationException implements Exception {
  const ContributionValidationException(this.message);

  final String message;

  @override
  String toString() => message;
}

abstract interface class ContributionRepository {
  List<ContributionRecord> getAllContributions();

  List<ContributionRecord> getContributionsForRound({
    required String equbId,
    required String cyclePeriodId,
  });

  ContributionRecord? getMemberContribution({
    required String cyclePeriodId,
    required String memberId,
  });

  ContributionRecord submitContribution({
    required String equbId,
    required String cyclePeriodId,
    required String memberId,
    required double declaredAmount,
    String? note,
  });

  ContributionRecord approveContribution({
    required String contributionId,
    required String reviewerId,
  });

  ContributionRecord rejectContribution({
    required String contributionId,
    required String reviewerId,
    required String reason,
  });
}
