import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/models/enums.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    RecurringItems,
    TransactionEntries,
    SavingGoals,
    Profiles,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'financial_app'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedCategories();
    },
  );

  /// 系統預設分類（isSystem，不可刪）。
  Future<void> _seedCategories() async {
    const expense = [
      ('飲食', 'restaurant'),
      ('交通', 'directions_bus'),
      ('居住', 'home'),
      ('帳單', 'receipt'),
      ('訂閱', 'autorenew'),
      ('購物', 'shopping_bag'),
      ('娛樂', 'sports_esports'),
      ('醫療', 'local_hospital'),
      ('其他支出', 'category'),
    ];
    const income = [
      ('薪資', 'payments'),
      ('獎金', 'card_giftcard'),
      ('其他收入', 'savings'),
    ];
    await batch((b) {
      b.insertAll(categories, [
        for (final (i, (name, icon)) in expense.indexed)
          CategoriesCompanion.insert(
            name: name,
            type: EntryDirection.expense,
            icon: Value(icon),
            isSystem: const Value(true),
            sortOrder: Value(i),
          ),
        for (final (i, (name, icon)) in income.indexed)
          CategoriesCompanion.insert(
            name: name,
            type: EntryDirection.income,
            icon: Value(icon),
            isSystem: const Value(true),
            sortOrder: Value(i),
          ),
      ]);
    });
  }
}
