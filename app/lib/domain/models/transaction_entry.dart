import 'enums.dart';

/// 變動收支（一筆帳）。欄位定義見 spec/03-data-model.md。
///
/// `id == 0` 表示尚未持久化。
class TransactionEntry {
  const TransactionEntry({
    this.id = 0,
    required this.date,
    required this.amount,
    required this.direction,
    required this.categoryId,
    this.note,
    this.source = TransactionSource.manual,
    this.dedupeFingerprint,
    this.recurringItemId,
    required this.createdAt,
  });

  final int id;
  final DateTime date;

  /// 新台幣元。
  final int amount;

  final EntryDirection direction;
  final int categoryId;
  final String? note;
  final TransactionSource source;

  /// 自動來源（通知監聽／CSV）的去重指紋。
  final String? dedupeFingerprint;

  /// 由固定收支實現時回連（例如水電實際帳單校正估計值）。
  final int? recurringItemId;

  final DateTime createdAt;
}
