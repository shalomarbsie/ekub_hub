import 'dart:math';

import '../../../core/demo/demo_ids.dart';
import '../domain/payout_draw.dart';
import '../domain/payout_repository.dart';

class InMemoryPayoutRepository implements PayoutRepository {
  InMemoryPayoutRepository({
    List<PayoutDraw>? initialDraws,
    Random? random,
    DateTime Function()? now,
  }) : _draws = List<PayoutDraw>.from(initialDraws ?? _seedDraws()),
       _random = random ?? Random(),
       _now = now ?? DateTime.now;

  final List<PayoutDraw> _draws;
  final Random _random;
  final DateTime Function() _now;
  int _nextId = 100;

  @override
  List<PayoutDraw> getAllDraws() => List<PayoutDraw>.unmodifiable(_draws);

  @override
  List<PayoutDraw> getDrawsForEqub(String equbId) {
    final matching = _draws
        .where((draw) => draw.equbId == equbId)
        .toList(growable: false);
    matching.sort((a, b) => b.periodNumber.compareTo(a.periodNumber));
    return List<PayoutDraw>.unmodifiable(matching);
  }

  @override
  PayoutDraw? getDrawForRound({
    required String equbId,
    required String cyclePeriodId,
  }) {
    for (final draw in _draws) {
      if (draw.equbId == equbId && draw.cyclePeriodId == cyclePeriodId) {
        return draw;
      }
    }
    return null;
  }

  @override
  PayoutDraw executeDraw({
    required String equbId,
    required String cyclePeriodId,
    required int periodNumber,
    required List<String> eligibleMemberIds,
  }) {
    if (eligibleMemberIds.isEmpty) {
      throw const PayoutValidationException(
        'No eligible members are available for this draw.',
      );
    }

    if (getDrawForRound(equbId: equbId, cyclePeriodId: cyclePeriodId) != null) {
      throw const PayoutValidationException(
        'A payout draw has already been completed for this round.',
      );
    }

    final winnerId =
        eligibleMemberIds[_random.nextInt(eligibleMemberIds.length)];
    final created = PayoutDraw(
      id: 'draw-${_nextId++}',
      equbId: equbId,
      cyclePeriodId: cyclePeriodId,
      periodNumber: periodNumber,
      eligibleMemberIds: List<String>.unmodifiable(eligibleMemberIds),
      selectedWinnerMemberId: winnerId,
      drawnAt: _now(),
    );
    _draws.add(created);
    return created;
  }

  static List<PayoutDraw> _seedDraws() {
    return [
      PayoutDraw(
        id: 'draw-merchant-01',
        equbId: DemoIds.merchantEqubId,
        cyclePeriodId: 'round-merchant-01',
        periodNumber: 1,
        eligibleMemberIds: const [
          DemoIds.merchantOrganizerMembershipId,
          DemoIds.merchantMemberMembershipId,
        ],
        selectedWinnerMemberId: DemoIds.merchantOrganizerMembershipId,
        drawnAt: DateTime.utc(2026, 11, 15, 16, 0),
      ),
      PayoutDraw(
        id: 'draw-family-01',
        equbId: DemoIds.familyEqubId,
        cyclePeriodId: 'round-family-01',
        periodNumber: 1,
        eligibleMemberIds: const [
          DemoIds.familyOrganizerMembershipId,
          DemoIds.familyMemberMembershipId,
        ],
        selectedWinnerMemberId: DemoIds.familyOrganizerMembershipId,
        drawnAt: DateTime.utc(2026, 10, 8, 16, 0),
      ),
      PayoutDraw(
        id: 'draw-family-02',
        equbId: DemoIds.familyEqubId,
        cyclePeriodId: DemoIds.familyRoundId,
        periodNumber: 2,
        eligibleMemberIds: const [DemoIds.familyMemberMembershipId],
        selectedWinnerMemberId: DemoIds.familyMemberMembershipId,
        drawnAt: DateTime.utc(2026, 11, 8, 16, 0),
      ),
    ];
  }
}
