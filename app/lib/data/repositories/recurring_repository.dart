import 'package:drift/drift.dart';

import '../../domain/models/recurring_item.dart';
import '../db/database.dart';

/// 週期性收支的存取。presentation 層一律經 provider 使用本類別，不直接碰 Drift。
class RecurringRepository {
  const RecurringRepository(this._db);

  final AppDatabase _db;

  Stream<List<RecurringItem>> watchActive() {
    final query = _db.select(_db.recurringItems)
      ..where((t) => t.active.equals(true))
      ..orderBy([(t) => OrderingTerm.asc(t.anchorDay)]);
    return query.watch().map((rows) => rows.map(_toDomain).toList());
  }

  Future<int> add(RecurringItem item) =>
      _db.into(_db.recurringItems).insert(_toCompanion(item));

  Future<void> deactivate(int id) async {
    await (_db.update(_db.recurringItems)..where((t) => t.id.equals(id))).write(
      const RecurringItemsCompanion(active: Value(false)),
    );
  }

  RecurringItem _toDomain(RecurringItemRow row) => RecurringItem(
    id: row.id,
    name: row.name,
    direction: row.direction,
    kind: row.kind,
    amountType: row.amountType,
    amount: row.amount,
    cycle: row.cycle,
    cycleInterval: row.cycleInterval,
    anchorDay: row.anchorDay,
    startDate: row.startDate,
    endDate: row.endDate,
    categoryId: row.categoryId,
    paymentMethod: row.paymentMethod,
    reminderType: row.reminderType,
    reminderLeadDays: row.reminderLeadDays,
    active: row.active,
    installmentTotal: row.installmentTotal,
    installmentPaid: row.installmentPaid,
    principal: row.principal,
    totalInterest: row.totalInterest,
    trialEndDate: row.trialEndDate,
  );

  RecurringItemsCompanion _toCompanion(RecurringItem item) =>
      RecurringItemsCompanion.insert(
        name: item.name,
        direction: item.direction,
        kind: item.kind,
        amountType: item.amountType,
        amount: item.amount,
        cycle: item.cycle,
        cycleInterval: Value(item.cycleInterval),
        anchorDay: Value(item.anchorDay),
        startDate: item.startDate,
        endDate: Value(item.endDate),
        categoryId: item.categoryId,
        paymentMethod: Value(item.paymentMethod),
        reminderType: item.reminderType,
        reminderLeadDays: Value(item.reminderLeadDays),
        active: Value(item.active),
        installmentTotal: Value(item.installmentTotal),
        installmentPaid: Value(item.installmentPaid),
        principal: Value(item.principal),
        totalInterest: Value(item.totalInterest),
        trialEndDate: Value(item.trialEndDate),
      );
}
