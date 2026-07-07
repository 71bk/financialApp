import 'package:drift/drift.dart';

import '../../domain/models/enums.dart';

/// 資料表定義，概念模型見 spec/03-data-model.md。
/// 列類別以 @DataClassName 加 Row 後綴，避免與 domain 模型撞名。

@DataClassName('CategoryRow')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get type => intEnum<EntryDirection>()();
  TextColumn get icon => text().withDefault(const Constant('category'))();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

@DataClassName('RecurringItemRow')
class RecurringItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get direction => intEnum<EntryDirection>()();
  IntColumn get kind => intEnum<RecurringKind>()();
  IntColumn get amountType => intEnum<AmountType>()();

  /// 新台幣元。
  IntColumn get amount => integer()();
  IntColumn get cycle => intEnum<Cycle>()();
  IntColumn get cycleInterval => integer().withDefault(const Constant(1))();
  IntColumn get anchorDay => integer().withDefault(const Constant(1))();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  TextColumn get paymentMethod => text().nullable()();
  IntColumn get reminderType => intEnum<ReminderType>()();
  IntColumn get reminderLeadDays => integer().withDefault(const Constant(1))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  // 分期欄位（kind == installment 才有值）
  IntColumn get installmentTotal => integer().nullable()();
  IntColumn get installmentPaid => integer().nullable()();
  IntColumn get principal => integer().nullable()();
  IntColumn get totalInterest => integer().nullable()();

  // 訂閱欄位（kind == subscription 才有值）
  DateTimeColumn get trialEndDate => dateTime().nullable()();
}

@DataClassName('TransactionRow')
class TransactionEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  /// 新台幣元。
  IntColumn get amount => integer()();
  IntColumn get direction => intEnum<EntryDirection>()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  TextColumn get note => text().nullable()();
  IntColumn get source => intEnum<TransactionSource>()();
  TextColumn get dedupeFingerprint => text().nullable()();
  IntColumn get recurringItemId =>
      integer().nullable().references(RecurringItems, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SavingGoalRow')
class SavingGoals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get targetAmount => integer()();
  DateTimeColumn get targetDate => dateTime().nullable()();
  IntColumn get monthlyAmount => integer().nullable()();
}

@DataClassName('ProfileRow')
class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get occupation => text().nullable()();

  /// 目標儲蓄率 %。
  IntColumn get savingsRate => integer().nullable()();
}
