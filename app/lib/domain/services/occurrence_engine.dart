import '../models/enums.dart';
import '../models/recurring_item.dart';

/// 一次「發生事件」：某筆週期性收支在某天發生。
class Occurrence {
  const Occurrence({
    required this.item,
    required this.date,
    required this.amount,
  });

  final RecurringItem item;
  final DateTime date;

  /// 新台幣元。estimated 帳單在校正前使用估計值。
  final int amount;

  EntryDirection get direction => item.direction;
}

/// 把週期性收支展開成日期區間內的發生事件。規則見 spec/03-data-model.md：
///
/// - monthly 以 anchorDay 為準，超過當月天數時取當月最後一天
/// - yearly 以 startDate 的月／日為準（2/29 在平年取 2/28）
/// - customDays 從 startDate 起每 cycleInterval 天
/// - 分期（installment）自 startDate 起共 installmentTotal 期後結束
/// - inactive 或超出 endDate 的項目不展開
class OccurrenceEngine {
  const OccurrenceEngine();

  List<Occurrence> expand({
    required List<RecurringItem> items,
    required DateTime from,
    required DateTime to,
  }) {
    final start = _dateOnly(from);
    final end = _dateOnly(to);
    final result = <Occurrence>[
      for (final item in items)
        if (item.active) ..._expandItem(item, start, end),
    ];
    result.sort((a, b) => a.date.compareTo(b.date));
    return result;
  }

  Iterable<Occurrence> _expandItem(
    RecurringItem item,
    DateTime from,
    DateTime to,
  ) sync* {
    final itemStart = _dateOnly(item.startDate);
    final itemEnd = item.endDate == null ? null : _dateOnly(item.endDate!);
    final maxCount = item.kind == RecurringKind.installment
        ? item.installmentTotal
        : null;

    var count = 0;
    for (final date in _dates(item, itemStart, to)) {
      count++;
      if (maxCount != null && count > maxCount) return;
      if (itemEnd != null && date.isAfter(itemEnd)) return;
      if (!date.isBefore(from)) {
        yield Occurrence(item: item, date: date, amount: item.amount);
      }
    }
  }

  /// 依週期產生 startDate 起、不晚於 [to] 的發生日（遞增）。
  Iterable<DateTime> _dates(
    RecurringItem item,
    DateTime itemStart,
    DateTime to,
  ) sync* {
    switch (item.cycle) {
      case Cycle.monthly:
        var year = itemStart.year;
        var month = itemStart.month;
        while (true) {
          final date = _clampedDate(year, month, item.anchorDay);
          if (date.isAfter(to)) return;
          if (!date.isBefore(itemStart)) yield date;
          month++;
          if (month > 12) {
            month = 1;
            year++;
          }
        }
      case Cycle.yearly:
        var year = itemStart.year;
        while (true) {
          final date = _clampedDate(year, itemStart.month, itemStart.day);
          if (date.isAfter(to)) return;
          if (!date.isBefore(itemStart)) yield date;
          year++;
        }
      case Cycle.customDays:
        final step = item.cycleInterval < 1 ? 1 : item.cycleInterval;
        var date = itemStart;
        while (!date.isAfter(to)) {
          yield date;
          date = DateTime(date.year, date.month, date.day + step);
        }
    }
  }

  /// day 超過當月天數時取當月最後一天（例：anchorDay 31 在 2 月 → 2/28）。
  DateTime _clampedDate(int year, int month, int day) {
    final lastDay = DateTime(year, month + 1, 0).day;
    return DateTime(year, month, day > lastDay ? lastDay : day);
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
}
