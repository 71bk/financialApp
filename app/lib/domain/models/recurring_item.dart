import 'enums.dart';

/// 週期性收支——產品的資料底座。欄位定義見 spec/03-data-model.md。
///
/// `id == 0` 表示尚未持久化。
class RecurringItem {
  const RecurringItem({
    this.id = 0,
    required this.name,
    required this.direction,
    required this.kind,
    this.amountType = AmountType.fixed,
    required this.amount,
    this.cycle = Cycle.monthly,
    this.cycleInterval = 1,
    this.anchorDay = 1,
    required this.startDate,
    this.endDate,
    required this.categoryId,
    this.paymentMethod,
    this.reminderType = ReminderType.none,
    this.reminderLeadDays = 1,
    this.active = true,
    this.installmentTotal,
    this.installmentPaid,
    this.principal,
    this.totalInterest,
    this.trialEndDate,
  });

  final int id;
  final String name;
  final EntryDirection direction;
  final RecurringKind kind;
  final AmountType amountType;

  /// 新台幣元。amountType 為 estimated 時是估計值。
  final int amount;

  final Cycle cycle;

  /// cycle 為 customDays 時的間隔天數。
  final int cycleInterval;

  /// 每月幾號（cycle 為 monthly 時使用），月底溢出由 OccurrenceEngine 處理。
  final int anchorDay;

  final DateTime startDate;

  /// null 表示持續中。
  final DateTime? endDate;

  final int categoryId;
  final String? paymentMethod;
  final ReminderType reminderType;
  final int reminderLeadDays;
  final bool active;

  // --- 分期欄位（kind == installment 才有值） ---
  final int? installmentTotal;
  final int? installmentPaid;
  final int? principal;

  /// 總利息／手續費，UI 顯示「多付多少」。
  final int? totalInterest;

  // --- 訂閱欄位（kind == subscription 才有值） ---
  final DateTime? trialEndDate;
}
