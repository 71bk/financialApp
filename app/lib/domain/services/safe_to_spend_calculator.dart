/// Safe-to-Spend 計算輸入。金額皆為新台幣元。
///
/// 週期定義：發薪日到下一個發薪日前一天（periodEnd 含當日）；
/// 無薪資設定時由呼叫端退化為日曆月。
class SafeToSpendInput {
  const SafeToSpendInput({
    required this.periodStart,
    required this.periodEnd,
    required this.today,
    required this.recurringIncome,
    required this.recurringExpense,
    this.savingsTarget = 0,
    this.variableSpent = 0,
  });

  final DateTime periodStart;

  /// 含當日。
  final DateTime periodEnd;

  final DateTime today;

  /// 週期內定期收入總和。
  final int recurringIncome;

  /// 週期內固定支出總和（含分期、估計帳單）。
  final int recurringExpense;

  final int savingsTarget;

  /// 本週期已發生的變動支出。
  final int variableSpent;
}

class SafeToSpendResult {
  const SafeToSpendResult({
    required this.discretionary,
    required this.remaining,
    required this.remainingDays,
    required this.dailyBudget,
  });

  /// 可自由花費 = 定期收入 − 固定支出 − 儲蓄目標。
  final int discretionary;

  /// 剩餘可花 = 可自由花費 − 已發生變動支出。超支時為負值。
  final int remaining;

  /// 含今天，下限 1。
  final int remainingDays;

  /// 今日可花 = remaining ÷ remainingDays（截斷）。超支時為負值，由 UI 決定呈現。
  final int dailyBudget;
}

/// 公式見 spec/03-data-model.md（完整規格：spec/05-safe-to-spend-spec.md）。
class SafeToSpendCalculator {
  const SafeToSpendCalculator();

  SafeToSpendResult calculate(SafeToSpendInput input) {
    final discretionary =
        input.recurringIncome - input.recurringExpense - input.savingsTarget;
    final remaining = discretionary - input.variableSpent;

    final today = DateTime(
      input.today.year,
      input.today.month,
      input.today.day,
    );
    final end = DateTime(
      input.periodEnd.year,
      input.periodEnd.month,
      input.periodEnd.day,
    );
    var remainingDays = end.difference(today).inDays + 1;
    if (remainingDays < 1) remainingDays = 1;

    return SafeToSpendResult(
      discretionary: discretionary,
      remaining: remaining,
      remainingDays: remainingDays,
      dailyBudget: remaining ~/ remainingDays,
    );
  }
}
