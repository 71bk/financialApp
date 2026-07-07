import 'package:drift/drift.dart';

import '../../domain/models/transaction_entry.dart';
import '../db/database.dart';

/// 變動收支的存取。
class TransactionRepository {
  const TransactionRepository(this._db);

  final AppDatabase _db;

  /// [from]、[to] 皆含當日。
  Stream<List<TransactionEntry>> watchBetween(DateTime from, DateTime to) {
    final query = _db.select(_db.transactionEntries)
      ..where((t) => t.date.isBetweenValues(from, to))
      ..orderBy([(t) => OrderingTerm.desc(t.date)]);
    return query.watch().map((rows) => rows.map(_toDomain).toList());
  }

  Future<int> add(TransactionEntry entry) =>
      _db.into(_db.transactionEntries).insert(_toCompanion(entry));

  Future<void> remove(int id) async {
    await (_db.delete(
      _db.transactionEntries,
    )..where((t) => t.id.equals(id))).go();
  }

  TransactionEntry _toDomain(TransactionRow row) => TransactionEntry(
    id: row.id,
    date: row.date,
    amount: row.amount,
    direction: row.direction,
    categoryId: row.categoryId,
    note: row.note,
    source: row.source,
    dedupeFingerprint: row.dedupeFingerprint,
    recurringItemId: row.recurringItemId,
    createdAt: row.createdAt,
  );

  TransactionEntriesCompanion _toCompanion(TransactionEntry entry) =>
      TransactionEntriesCompanion.insert(
        date: entry.date,
        amount: entry.amount,
        direction: entry.direction,
        categoryId: entry.categoryId,
        note: Value(entry.note),
        source: entry.source,
        dedupeFingerprint: Value(entry.dedupeFingerprint),
        recurringItemId: Value(entry.recurringItemId),
        createdAt: Value(entry.createdAt),
      );
}
