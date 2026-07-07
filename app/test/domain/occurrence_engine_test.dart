import 'package:financial_app/domain/models/enums.dart';
import 'package:financial_app/domain/models/recurring_item.dart';
import 'package:financial_app/domain/services/occurrence_engine.dart';
import 'package:flutter_test/flutter_test.dart';

RecurringItem makeItem({
  RecurringKind kind = RecurringKind.bill,
  Cycle cycle = Cycle.monthly,
  int cycleInterval = 1,
  int anchorDay = 1,
  required DateTime startDate,
  DateTime? endDate,
  bool active = true,
  int? installmentTotal,
}) {
  return RecurringItem(
    name: 'test',
    direction: EntryDirection.expense,
    kind: kind,
    amount: 100,
    cycle: cycle,
    cycleInterval: cycleInterval,
    anchorDay: anchorDay,
    startDate: startDate,
    endDate: endDate,
    categoryId: 1,
    active: active,
    installmentTotal: installmentTotal,
  );
}

void main() {
  const engine = OccurrenceEngine();

  List<DateTime> datesOf(RecurringItem item, DateTime from, DateTime to) =>
      engine
          .expand(items: [item], from: from, to: to)
          .map((o) => o.date)
          .toList();

  group('monthly', () {
    test('以 anchorDay 每月展開', () {
      final dates = datesOf(
        makeItem(anchorDay: 15, startDate: DateTime(2026, 1, 1)),
        DateTime(2026, 1, 1),
        DateTime(2026, 3, 31),
      );
      expect(dates, [
        DateTime(2026, 1, 15),
        DateTime(2026, 2, 15),
        DateTime(2026, 3, 15),
      ]);
    });

    test('anchorDay 超過當月天數時取當月最後一天', () {
      final dates = datesOf(
        makeItem(anchorDay: 31, startDate: DateTime(2026, 1, 1)),
        DateTime(2026, 1, 1),
        DateTime(2026, 3, 31),
      );
      expect(dates, [
        DateTime(2026, 1, 31),
        DateTime(2026, 2, 28),
        DateTime(2026, 3, 31),
      ]);
    });

    test('startDate 之前的 anchor 不算發生', () {
      final dates = datesOf(
        makeItem(anchorDay: 15, startDate: DateTime(2026, 1, 20)),
        DateTime(2026, 1, 1),
        DateTime(2026, 3, 31),
      );
      expect(dates, [DateTime(2026, 2, 15), DateTime(2026, 3, 15)]);
    });

    test('endDate 之後不再發生', () {
      final dates = datesOf(
        makeItem(
          anchorDay: 1,
          startDate: DateTime(2026, 1, 1),
          endDate: DateTime(2026, 2, 28),
        ),
        DateTime(2026, 1, 1),
        DateTime(2026, 12, 31),
      );
      expect(dates, [DateTime(2026, 1, 1), DateTime(2026, 2, 1)]);
    });
  });

  group('installment', () {
    test('自 startDate 起共 installmentTotal 期後結束', () {
      final dates = datesOf(
        makeItem(
          kind: RecurringKind.installment,
          anchorDay: 5,
          startDate: DateTime(2026, 1, 5),
          installmentTotal: 3,
        ),
        DateTime(2026, 1, 1),
        DateTime(2026, 12, 31),
      );
      expect(dates, [
        DateTime(2026, 1, 5),
        DateTime(2026, 2, 5),
        DateTime(2026, 3, 5),
      ]);
    });

    test('查詢區間從中間開始時，期數仍從 startDate 累計', () {
      final dates = datesOf(
        makeItem(
          kind: RecurringKind.installment,
          anchorDay: 5,
          startDate: DateTime(2026, 1, 5),
          installmentTotal: 3,
        ),
        DateTime(2026, 2, 1),
        DateTime(2026, 12, 31),
      );
      expect(dates, [DateTime(2026, 2, 5), DateTime(2026, 3, 5)]);
    });
  });

  group('customDays', () {
    test('從 startDate 起每 cycleInterval 天', () {
      final dates = datesOf(
        makeItem(
          cycle: Cycle.customDays,
          cycleInterval: 14,
          startDate: DateTime(2026, 1, 1),
        ),
        DateTime(2026, 1, 1),
        DateTime(2026, 2, 1),
      );
      expect(dates, [
        DateTime(2026, 1, 1),
        DateTime(2026, 1, 15),
        DateTime(2026, 1, 29),
      ]);
    });
  });

  group('yearly', () {
    test('以 startDate 的月／日每年展開', () {
      final dates = datesOf(
        makeItem(cycle: Cycle.yearly, startDate: DateTime(2026, 3, 10)),
        DateTime(2026, 1, 1),
        DateTime(2028, 12, 31),
      );
      expect(dates, [
        DateTime(2026, 3, 10),
        DateTime(2027, 3, 10),
        DateTime(2028, 3, 10),
      ]);
    });
  });

  test('inactive 的項目不展開', () {
    final dates = datesOf(
      makeItem(anchorDay: 1, startDate: DateTime(2026, 1, 1), active: false),
      DateTime(2026, 1, 1),
      DateTime(2026, 12, 31),
    );
    expect(dates, isEmpty);
  });

  test('多筆項目結果依日期排序', () {
    final occurrences = engine.expand(
      items: [
        makeItem(anchorDay: 20, startDate: DateTime(2026, 1, 1)),
        makeItem(anchorDay: 5, startDate: DateTime(2026, 1, 1)),
      ],
      from: DateTime(2026, 1, 1),
      to: DateTime(2026, 2, 28),
    );
    final dates = occurrences.map((o) => o.date).toList();
    expect(dates, [
      DateTime(2026, 1, 5),
      DateTime(2026, 1, 20),
      DateTime(2026, 2, 5),
      DateTime(2026, 2, 20),
    ]);
  });
}
