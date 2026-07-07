import 'package:financial_app/domain/services/safe_to_spend_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const calculator = SafeToSpendCalculator();

  test('基本計算：可自由花費、剩餘、每日可花', () {
    final result = calculator.calculate(
      SafeToSpendInput(
        periodStart: DateTime(2026, 7, 5),
        periodEnd: DateTime(2026, 8, 4),
        today: DateTime(2026, 7, 26),
        recurringIncome: 50000,
        recurringExpense: 30000,
        savingsTarget: 5000,
        variableSpent: 3000,
      ),
    );

    expect(result.discretionary, 15000);
    expect(result.remaining, 12000);
    expect(result.remainingDays, 10); // 7/26 到 8/4 含當日
    expect(result.dailyBudget, 1200);
  });

  test('超支時 remaining 與 dailyBudget 為負值', () {
    final result = calculator.calculate(
      SafeToSpendInput(
        periodStart: DateTime(2026, 7, 5),
        periodEnd: DateTime(2026, 8, 4),
        today: DateTime(2026, 8, 4),
        recurringIncome: 30000,
        recurringExpense: 20000,
        variableSpent: 15000,
      ),
    );

    expect(result.remaining, -5000);
    expect(result.remainingDays, 1);
    expect(result.dailyBudget, -5000);
  });

  test('today 超過 periodEnd 時 remainingDays 下限為 1', () {
    final result = calculator.calculate(
      SafeToSpendInput(
        periodStart: DateTime(2026, 7, 5),
        periodEnd: DateTime(2026, 8, 4),
        today: DateTime(2026, 8, 10),
        recurringIncome: 10000,
        recurringExpense: 0,
      ),
    );

    expect(result.remainingDays, 1);
    expect(result.dailyBudget, 10000);
  });

  test('每日可花為截斷整數', () {
    final result = calculator.calculate(
      SafeToSpendInput(
        periodStart: DateTime(2026, 7, 1),
        periodEnd: DateTime(2026, 7, 3),
        today: DateTime(2026, 7, 1),
        recurringIncome: 1000,
        recurringExpense: 0,
      ),
    );

    expect(result.remainingDays, 3);
    expect(result.dailyBudget, 333);
  });
}
