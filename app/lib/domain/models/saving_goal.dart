/// 儲蓄目標。`targetDate` 與 `monthlyAmount` 擇一：
/// 有目標日則反推每月應存，否則直接指定每月存多少。
class SavingGoal {
  const SavingGoal({
    this.id = 0,
    required this.name,
    required this.targetAmount,
    this.targetDate,
    this.monthlyAmount,
  });

  final int id;
  final String name;

  /// 新台幣元。
  final int targetAmount;

  final DateTime? targetDate;
  final int? monthlyAmount;
}
