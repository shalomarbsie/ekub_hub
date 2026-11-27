import 'payout_draw.dart';

class PayoutValidationException implements Exception {
  const PayoutValidationException(this.message);

  final String message;

  @override
  String toString() => message;
}

abstract interface class PayoutRepository {
  List<PayoutDraw> getAllDraws();

  List<PayoutDraw> getDrawsForEqub(String equbId);

  PayoutDraw? getDrawForRound({
    required String equbId,
    required String cyclePeriodId,
  });

  PayoutDraw executeDraw({
    required String equbId,
    required String cyclePeriodId,
    required int periodNumber,
    required List<String> eligibleMemberIds,
  });
}
