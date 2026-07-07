// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntryDirection, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EntryDirection>($CategoriesTable.$convertertype);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('category'),
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    icon,
    isSystem,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $CategoriesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntryDirection, int, int> $convertertype =
      const EnumIndexConverter<EntryDirection>(EntryDirection.values);
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final int id;
  final String name;
  final EntryDirection type;
  final String icon;
  final bool isSystem;
  final int sortOrder;
  const CategoryRow({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.isSystem,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<int>($CategoriesTable.$convertertype.toSql(type));
    }
    map['icon'] = Variable<String>(icon);
    map['is_system'] = Variable<bool>(isSystem);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      icon: Value(icon),
      isSystem: Value(isSystem),
      sortOrder: Value(sortOrder),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $CategoriesTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      icon: serializer.fromJson<String>(json['icon']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(
        $CategoriesTable.$convertertype.toJson(type),
      ),
      'icon': serializer.toJson<String>(icon),
      'isSystem': serializer.toJson<bool>(isSystem),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  CategoryRow copyWith({
    int? id,
    String? name,
    EntryDirection? type,
    String? icon,
    bool? isSystem,
    int? sortOrder,
  }) => CategoryRow(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    icon: icon ?? this.icon,
    isSystem: isSystem ?? this.isSystem,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      icon: data.icon.present ? data.icon.value : this.icon,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('isSystem: $isSystem, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, icon, isSystem, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.icon == this.icon &&
          other.isSystem == this.isSystem &&
          other.sortOrder == this.sortOrder);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<EntryDirection> type;
  final Value<String> icon;
  final Value<bool> isSystem;
  final Value<int> sortOrder;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.icon = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required EntryDirection type,
    this.icon = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.sortOrder = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<CategoryRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? type,
    Expression<String>? icon,
    Expression<bool>? isSystem,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (icon != null) 'icon': icon,
      if (isSystem != null) 'is_system': isSystem,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<EntryDirection>? type,
    Value<String>? icon,
    Value<bool>? isSystem,
    Value<int>? sortOrder,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      isSystem: isSystem ?? this.isSystem,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $CategoriesTable.$convertertype.toSql(type.value),
      );
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('icon: $icon, ')
          ..write('isSystem: $isSystem, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $RecurringItemsTable extends RecurringItems
    with TableInfo<$RecurringItemsTable, RecurringItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntryDirection, int> direction =
      GeneratedColumn<int>(
        'direction',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EntryDirection>($RecurringItemsTable.$converterdirection);
  @override
  late final GeneratedColumnWithTypeConverter<RecurringKind, int> kind =
      GeneratedColumn<int>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<RecurringKind>($RecurringItemsTable.$converterkind);
  @override
  late final GeneratedColumnWithTypeConverter<AmountType, int> amountType =
      GeneratedColumn<int>(
        'amount_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<AmountType>($RecurringItemsTable.$converteramountType);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Cycle, int> cycle =
      GeneratedColumn<int>(
        'cycle',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Cycle>($RecurringItemsTable.$convertercycle);
  static const VerificationMeta _cycleIntervalMeta = const VerificationMeta(
    'cycleInterval',
  );
  @override
  late final GeneratedColumn<int> cycleInterval = GeneratedColumn<int>(
    'cycle_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _anchorDayMeta = const VerificationMeta(
    'anchorDay',
  );
  @override
  late final GeneratedColumn<int> anchorDay = GeneratedColumn<int>(
    'anchor_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ReminderType, int> reminderType =
      GeneratedColumn<int>(
        'reminder_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<ReminderType>(
        $RecurringItemsTable.$converterreminderType,
      );
  static const VerificationMeta _reminderLeadDaysMeta = const VerificationMeta(
    'reminderLeadDays',
  );
  @override
  late final GeneratedColumn<int> reminderLeadDays = GeneratedColumn<int>(
    'reminder_lead_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _installmentTotalMeta = const VerificationMeta(
    'installmentTotal',
  );
  @override
  late final GeneratedColumn<int> installmentTotal = GeneratedColumn<int>(
    'installment_total',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installmentPaidMeta = const VerificationMeta(
    'installmentPaid',
  );
  @override
  late final GeneratedColumn<int> installmentPaid = GeneratedColumn<int>(
    'installment_paid',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _principalMeta = const VerificationMeta(
    'principal',
  );
  @override
  late final GeneratedColumn<int> principal = GeneratedColumn<int>(
    'principal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalInterestMeta = const VerificationMeta(
    'totalInterest',
  );
  @override
  late final GeneratedColumn<int> totalInterest = GeneratedColumn<int>(
    'total_interest',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trialEndDateMeta = const VerificationMeta(
    'trialEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> trialEndDate = GeneratedColumn<DateTime>(
    'trial_end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    direction,
    kind,
    amountType,
    amount,
    cycle,
    cycleInterval,
    anchorDay,
    startDate,
    endDate,
    categoryId,
    paymentMethod,
    reminderType,
    reminderLeadDays,
    active,
    installmentTotal,
    installmentPaid,
    principal,
    totalInterest,
    trialEndDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecurringItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('cycle_interval')) {
      context.handle(
        _cycleIntervalMeta,
        cycleInterval.isAcceptableOrUnknown(
          data['cycle_interval']!,
          _cycleIntervalMeta,
        ),
      );
    }
    if (data.containsKey('anchor_day')) {
      context.handle(
        _anchorDayMeta,
        anchorDay.isAcceptableOrUnknown(data['anchor_day']!, _anchorDayMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('reminder_lead_days')) {
      context.handle(
        _reminderLeadDaysMeta,
        reminderLeadDays.isAcceptableOrUnknown(
          data['reminder_lead_days']!,
          _reminderLeadDaysMeta,
        ),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('installment_total')) {
      context.handle(
        _installmentTotalMeta,
        installmentTotal.isAcceptableOrUnknown(
          data['installment_total']!,
          _installmentTotalMeta,
        ),
      );
    }
    if (data.containsKey('installment_paid')) {
      context.handle(
        _installmentPaidMeta,
        installmentPaid.isAcceptableOrUnknown(
          data['installment_paid']!,
          _installmentPaidMeta,
        ),
      );
    }
    if (data.containsKey('principal')) {
      context.handle(
        _principalMeta,
        principal.isAcceptableOrUnknown(data['principal']!, _principalMeta),
      );
    }
    if (data.containsKey('total_interest')) {
      context.handle(
        _totalInterestMeta,
        totalInterest.isAcceptableOrUnknown(
          data['total_interest']!,
          _totalInterestMeta,
        ),
      );
    }
    if (data.containsKey('trial_end_date')) {
      context.handle(
        _trialEndDateMeta,
        trialEndDate.isAcceptableOrUnknown(
          data['trial_end_date']!,
          _trialEndDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      direction: $RecurringItemsTable.$converterdirection.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}direction'],
        )!,
      ),
      kind: $RecurringItemsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}kind'],
        )!,
      ),
      amountType: $RecurringItemsTable.$converteramountType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}amount_type'],
        )!,
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      cycle: $RecurringItemsTable.$convertercycle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}cycle'],
        )!,
      ),
      cycleInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_interval'],
      )!,
      anchorDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}anchor_day'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      reminderType: $RecurringItemsTable.$converterreminderType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}reminder_type'],
        )!,
      ),
      reminderLeadDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_lead_days'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      installmentTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_total'],
      ),
      installmentPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installment_paid'],
      ),
      principal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}principal'],
      ),
      totalInterest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_interest'],
      ),
      trialEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}trial_end_date'],
      ),
    );
  }

  @override
  $RecurringItemsTable createAlias(String alias) {
    return $RecurringItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntryDirection, int, int> $converterdirection =
      const EnumIndexConverter<EntryDirection>(EntryDirection.values);
  static JsonTypeConverter2<RecurringKind, int, int> $converterkind =
      const EnumIndexConverter<RecurringKind>(RecurringKind.values);
  static JsonTypeConverter2<AmountType, int, int> $converteramountType =
      const EnumIndexConverter<AmountType>(AmountType.values);
  static JsonTypeConverter2<Cycle, int, int> $convertercycle =
      const EnumIndexConverter<Cycle>(Cycle.values);
  static JsonTypeConverter2<ReminderType, int, int> $converterreminderType =
      const EnumIndexConverter<ReminderType>(ReminderType.values);
}

class RecurringItemRow extends DataClass
    implements Insertable<RecurringItemRow> {
  final int id;
  final String name;
  final EntryDirection direction;
  final RecurringKind kind;
  final AmountType amountType;

  /// 新台幣元。
  final int amount;
  final Cycle cycle;
  final int cycleInterval;
  final int anchorDay;
  final DateTime startDate;
  final DateTime? endDate;
  final int categoryId;
  final String? paymentMethod;
  final ReminderType reminderType;
  final int reminderLeadDays;
  final bool active;
  final int? installmentTotal;
  final int? installmentPaid;
  final int? principal;
  final int? totalInterest;
  final DateTime? trialEndDate;
  const RecurringItemRow({
    required this.id,
    required this.name,
    required this.direction,
    required this.kind,
    required this.amountType,
    required this.amount,
    required this.cycle,
    required this.cycleInterval,
    required this.anchorDay,
    required this.startDate,
    this.endDate,
    required this.categoryId,
    this.paymentMethod,
    required this.reminderType,
    required this.reminderLeadDays,
    required this.active,
    this.installmentTotal,
    this.installmentPaid,
    this.principal,
    this.totalInterest,
    this.trialEndDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['direction'] = Variable<int>(
        $RecurringItemsTable.$converterdirection.toSql(direction),
      );
    }
    {
      map['kind'] = Variable<int>(
        $RecurringItemsTable.$converterkind.toSql(kind),
      );
    }
    {
      map['amount_type'] = Variable<int>(
        $RecurringItemsTable.$converteramountType.toSql(amountType),
      );
    }
    map['amount'] = Variable<int>(amount);
    {
      map['cycle'] = Variable<int>(
        $RecurringItemsTable.$convertercycle.toSql(cycle),
      );
    }
    map['cycle_interval'] = Variable<int>(cycleInterval);
    map['anchor_day'] = Variable<int>(anchorDay);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    {
      map['reminder_type'] = Variable<int>(
        $RecurringItemsTable.$converterreminderType.toSql(reminderType),
      );
    }
    map['reminder_lead_days'] = Variable<int>(reminderLeadDays);
    map['active'] = Variable<bool>(active);
    if (!nullToAbsent || installmentTotal != null) {
      map['installment_total'] = Variable<int>(installmentTotal);
    }
    if (!nullToAbsent || installmentPaid != null) {
      map['installment_paid'] = Variable<int>(installmentPaid);
    }
    if (!nullToAbsent || principal != null) {
      map['principal'] = Variable<int>(principal);
    }
    if (!nullToAbsent || totalInterest != null) {
      map['total_interest'] = Variable<int>(totalInterest);
    }
    if (!nullToAbsent || trialEndDate != null) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate);
    }
    return map;
  }

  RecurringItemsCompanion toCompanion(bool nullToAbsent) {
    return RecurringItemsCompanion(
      id: Value(id),
      name: Value(name),
      direction: Value(direction),
      kind: Value(kind),
      amountType: Value(amountType),
      amount: Value(amount),
      cycle: Value(cycle),
      cycleInterval: Value(cycleInterval),
      anchorDay: Value(anchorDay),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      categoryId: Value(categoryId),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      reminderType: Value(reminderType),
      reminderLeadDays: Value(reminderLeadDays),
      active: Value(active),
      installmentTotal: installmentTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(installmentTotal),
      installmentPaid: installmentPaid == null && nullToAbsent
          ? const Value.absent()
          : Value(installmentPaid),
      principal: principal == null && nullToAbsent
          ? const Value.absent()
          : Value(principal),
      totalInterest: totalInterest == null && nullToAbsent
          ? const Value.absent()
          : Value(totalInterest),
      trialEndDate: trialEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(trialEndDate),
    );
  }

  factory RecurringItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringItemRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      direction: $RecurringItemsTable.$converterdirection.fromJson(
        serializer.fromJson<int>(json['direction']),
      ),
      kind: $RecurringItemsTable.$converterkind.fromJson(
        serializer.fromJson<int>(json['kind']),
      ),
      amountType: $RecurringItemsTable.$converteramountType.fromJson(
        serializer.fromJson<int>(json['amountType']),
      ),
      amount: serializer.fromJson<int>(json['amount']),
      cycle: $RecurringItemsTable.$convertercycle.fromJson(
        serializer.fromJson<int>(json['cycle']),
      ),
      cycleInterval: serializer.fromJson<int>(json['cycleInterval']),
      anchorDay: serializer.fromJson<int>(json['anchorDay']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      reminderType: $RecurringItemsTable.$converterreminderType.fromJson(
        serializer.fromJson<int>(json['reminderType']),
      ),
      reminderLeadDays: serializer.fromJson<int>(json['reminderLeadDays']),
      active: serializer.fromJson<bool>(json['active']),
      installmentTotal: serializer.fromJson<int?>(json['installmentTotal']),
      installmentPaid: serializer.fromJson<int?>(json['installmentPaid']),
      principal: serializer.fromJson<int?>(json['principal']),
      totalInterest: serializer.fromJson<int?>(json['totalInterest']),
      trialEndDate: serializer.fromJson<DateTime?>(json['trialEndDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'direction': serializer.toJson<int>(
        $RecurringItemsTable.$converterdirection.toJson(direction),
      ),
      'kind': serializer.toJson<int>(
        $RecurringItemsTable.$converterkind.toJson(kind),
      ),
      'amountType': serializer.toJson<int>(
        $RecurringItemsTable.$converteramountType.toJson(amountType),
      ),
      'amount': serializer.toJson<int>(amount),
      'cycle': serializer.toJson<int>(
        $RecurringItemsTable.$convertercycle.toJson(cycle),
      ),
      'cycleInterval': serializer.toJson<int>(cycleInterval),
      'anchorDay': serializer.toJson<int>(anchorDay),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'categoryId': serializer.toJson<int>(categoryId),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'reminderType': serializer.toJson<int>(
        $RecurringItemsTable.$converterreminderType.toJson(reminderType),
      ),
      'reminderLeadDays': serializer.toJson<int>(reminderLeadDays),
      'active': serializer.toJson<bool>(active),
      'installmentTotal': serializer.toJson<int?>(installmentTotal),
      'installmentPaid': serializer.toJson<int?>(installmentPaid),
      'principal': serializer.toJson<int?>(principal),
      'totalInterest': serializer.toJson<int?>(totalInterest),
      'trialEndDate': serializer.toJson<DateTime?>(trialEndDate),
    };
  }

  RecurringItemRow copyWith({
    int? id,
    String? name,
    EntryDirection? direction,
    RecurringKind? kind,
    AmountType? amountType,
    int? amount,
    Cycle? cycle,
    int? cycleInterval,
    int? anchorDay,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    int? categoryId,
    Value<String?> paymentMethod = const Value.absent(),
    ReminderType? reminderType,
    int? reminderLeadDays,
    bool? active,
    Value<int?> installmentTotal = const Value.absent(),
    Value<int?> installmentPaid = const Value.absent(),
    Value<int?> principal = const Value.absent(),
    Value<int?> totalInterest = const Value.absent(),
    Value<DateTime?> trialEndDate = const Value.absent(),
  }) => RecurringItemRow(
    id: id ?? this.id,
    name: name ?? this.name,
    direction: direction ?? this.direction,
    kind: kind ?? this.kind,
    amountType: amountType ?? this.amountType,
    amount: amount ?? this.amount,
    cycle: cycle ?? this.cycle,
    cycleInterval: cycleInterval ?? this.cycleInterval,
    anchorDay: anchorDay ?? this.anchorDay,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    categoryId: categoryId ?? this.categoryId,
    paymentMethod: paymentMethod.present
        ? paymentMethod.value
        : this.paymentMethod,
    reminderType: reminderType ?? this.reminderType,
    reminderLeadDays: reminderLeadDays ?? this.reminderLeadDays,
    active: active ?? this.active,
    installmentTotal: installmentTotal.present
        ? installmentTotal.value
        : this.installmentTotal,
    installmentPaid: installmentPaid.present
        ? installmentPaid.value
        : this.installmentPaid,
    principal: principal.present ? principal.value : this.principal,
    totalInterest: totalInterest.present
        ? totalInterest.value
        : this.totalInterest,
    trialEndDate: trialEndDate.present ? trialEndDate.value : this.trialEndDate,
  );
  RecurringItemRow copyWithCompanion(RecurringItemsCompanion data) {
    return RecurringItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      direction: data.direction.present ? data.direction.value : this.direction,
      kind: data.kind.present ? data.kind.value : this.kind,
      amountType: data.amountType.present
          ? data.amountType.value
          : this.amountType,
      amount: data.amount.present ? data.amount.value : this.amount,
      cycle: data.cycle.present ? data.cycle.value : this.cycle,
      cycleInterval: data.cycleInterval.present
          ? data.cycleInterval.value
          : this.cycleInterval,
      anchorDay: data.anchorDay.present ? data.anchorDay.value : this.anchorDay,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      reminderType: data.reminderType.present
          ? data.reminderType.value
          : this.reminderType,
      reminderLeadDays: data.reminderLeadDays.present
          ? data.reminderLeadDays.value
          : this.reminderLeadDays,
      active: data.active.present ? data.active.value : this.active,
      installmentTotal: data.installmentTotal.present
          ? data.installmentTotal.value
          : this.installmentTotal,
      installmentPaid: data.installmentPaid.present
          ? data.installmentPaid.value
          : this.installmentPaid,
      principal: data.principal.present ? data.principal.value : this.principal,
      totalInterest: data.totalInterest.present
          ? data.totalInterest.value
          : this.totalInterest,
      trialEndDate: data.trialEndDate.present
          ? data.trialEndDate.value
          : this.trialEndDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecurringItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('direction: $direction, ')
          ..write('kind: $kind, ')
          ..write('amountType: $amountType, ')
          ..write('amount: $amount, ')
          ..write('cycle: $cycle, ')
          ..write('cycleInterval: $cycleInterval, ')
          ..write('anchorDay: $anchorDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reminderType: $reminderType, ')
          ..write('reminderLeadDays: $reminderLeadDays, ')
          ..write('active: $active, ')
          ..write('installmentTotal: $installmentTotal, ')
          ..write('installmentPaid: $installmentPaid, ')
          ..write('principal: $principal, ')
          ..write('totalInterest: $totalInterest, ')
          ..write('trialEndDate: $trialEndDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    direction,
    kind,
    amountType,
    amount,
    cycle,
    cycleInterval,
    anchorDay,
    startDate,
    endDate,
    categoryId,
    paymentMethod,
    reminderType,
    reminderLeadDays,
    active,
    installmentTotal,
    installmentPaid,
    principal,
    totalInterest,
    trialEndDate,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.direction == this.direction &&
          other.kind == this.kind &&
          other.amountType == this.amountType &&
          other.amount == this.amount &&
          other.cycle == this.cycle &&
          other.cycleInterval == this.cycleInterval &&
          other.anchorDay == this.anchorDay &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.categoryId == this.categoryId &&
          other.paymentMethod == this.paymentMethod &&
          other.reminderType == this.reminderType &&
          other.reminderLeadDays == this.reminderLeadDays &&
          other.active == this.active &&
          other.installmentTotal == this.installmentTotal &&
          other.installmentPaid == this.installmentPaid &&
          other.principal == this.principal &&
          other.totalInterest == this.totalInterest &&
          other.trialEndDate == this.trialEndDate);
}

class RecurringItemsCompanion extends UpdateCompanion<RecurringItemRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<EntryDirection> direction;
  final Value<RecurringKind> kind;
  final Value<AmountType> amountType;
  final Value<int> amount;
  final Value<Cycle> cycle;
  final Value<int> cycleInterval;
  final Value<int> anchorDay;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<int> categoryId;
  final Value<String?> paymentMethod;
  final Value<ReminderType> reminderType;
  final Value<int> reminderLeadDays;
  final Value<bool> active;
  final Value<int?> installmentTotal;
  final Value<int?> installmentPaid;
  final Value<int?> principal;
  final Value<int?> totalInterest;
  final Value<DateTime?> trialEndDate;
  const RecurringItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.direction = const Value.absent(),
    this.kind = const Value.absent(),
    this.amountType = const Value.absent(),
    this.amount = const Value.absent(),
    this.cycle = const Value.absent(),
    this.cycleInterval = const Value.absent(),
    this.anchorDay = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.reminderType = const Value.absent(),
    this.reminderLeadDays = const Value.absent(),
    this.active = const Value.absent(),
    this.installmentTotal = const Value.absent(),
    this.installmentPaid = const Value.absent(),
    this.principal = const Value.absent(),
    this.totalInterest = const Value.absent(),
    this.trialEndDate = const Value.absent(),
  });
  RecurringItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required EntryDirection direction,
    required RecurringKind kind,
    required AmountType amountType,
    required int amount,
    required Cycle cycle,
    this.cycleInterval = const Value.absent(),
    this.anchorDay = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    required int categoryId,
    this.paymentMethod = const Value.absent(),
    required ReminderType reminderType,
    this.reminderLeadDays = const Value.absent(),
    this.active = const Value.absent(),
    this.installmentTotal = const Value.absent(),
    this.installmentPaid = const Value.absent(),
    this.principal = const Value.absent(),
    this.totalInterest = const Value.absent(),
    this.trialEndDate = const Value.absent(),
  }) : name = Value(name),
       direction = Value(direction),
       kind = Value(kind),
       amountType = Value(amountType),
       amount = Value(amount),
       cycle = Value(cycle),
       startDate = Value(startDate),
       categoryId = Value(categoryId),
       reminderType = Value(reminderType);
  static Insertable<RecurringItemRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? direction,
    Expression<int>? kind,
    Expression<int>? amountType,
    Expression<int>? amount,
    Expression<int>? cycle,
    Expression<int>? cycleInterval,
    Expression<int>? anchorDay,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? categoryId,
    Expression<String>? paymentMethod,
    Expression<int>? reminderType,
    Expression<int>? reminderLeadDays,
    Expression<bool>? active,
    Expression<int>? installmentTotal,
    Expression<int>? installmentPaid,
    Expression<int>? principal,
    Expression<int>? totalInterest,
    Expression<DateTime>? trialEndDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (direction != null) 'direction': direction,
      if (kind != null) 'kind': kind,
      if (amountType != null) 'amount_type': amountType,
      if (amount != null) 'amount': amount,
      if (cycle != null) 'cycle': cycle,
      if (cycleInterval != null) 'cycle_interval': cycleInterval,
      if (anchorDay != null) 'anchor_day': anchorDay,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (categoryId != null) 'category_id': categoryId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (reminderType != null) 'reminder_type': reminderType,
      if (reminderLeadDays != null) 'reminder_lead_days': reminderLeadDays,
      if (active != null) 'active': active,
      if (installmentTotal != null) 'installment_total': installmentTotal,
      if (installmentPaid != null) 'installment_paid': installmentPaid,
      if (principal != null) 'principal': principal,
      if (totalInterest != null) 'total_interest': totalInterest,
      if (trialEndDate != null) 'trial_end_date': trialEndDate,
    });
  }

  RecurringItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<EntryDirection>? direction,
    Value<RecurringKind>? kind,
    Value<AmountType>? amountType,
    Value<int>? amount,
    Value<Cycle>? cycle,
    Value<int>? cycleInterval,
    Value<int>? anchorDay,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<int>? categoryId,
    Value<String?>? paymentMethod,
    Value<ReminderType>? reminderType,
    Value<int>? reminderLeadDays,
    Value<bool>? active,
    Value<int?>? installmentTotal,
    Value<int?>? installmentPaid,
    Value<int?>? principal,
    Value<int?>? totalInterest,
    Value<DateTime?>? trialEndDate,
  }) {
    return RecurringItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      direction: direction ?? this.direction,
      kind: kind ?? this.kind,
      amountType: amountType ?? this.amountType,
      amount: amount ?? this.amount,
      cycle: cycle ?? this.cycle,
      cycleInterval: cycleInterval ?? this.cycleInterval,
      anchorDay: anchorDay ?? this.anchorDay,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      categoryId: categoryId ?? this.categoryId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      reminderType: reminderType ?? this.reminderType,
      reminderLeadDays: reminderLeadDays ?? this.reminderLeadDays,
      active: active ?? this.active,
      installmentTotal: installmentTotal ?? this.installmentTotal,
      installmentPaid: installmentPaid ?? this.installmentPaid,
      principal: principal ?? this.principal,
      totalInterest: totalInterest ?? this.totalInterest,
      trialEndDate: trialEndDate ?? this.trialEndDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (direction.present) {
      map['direction'] = Variable<int>(
        $RecurringItemsTable.$converterdirection.toSql(direction.value),
      );
    }
    if (kind.present) {
      map['kind'] = Variable<int>(
        $RecurringItemsTable.$converterkind.toSql(kind.value),
      );
    }
    if (amountType.present) {
      map['amount_type'] = Variable<int>(
        $RecurringItemsTable.$converteramountType.toSql(amountType.value),
      );
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (cycle.present) {
      map['cycle'] = Variable<int>(
        $RecurringItemsTable.$convertercycle.toSql(cycle.value),
      );
    }
    if (cycleInterval.present) {
      map['cycle_interval'] = Variable<int>(cycleInterval.value);
    }
    if (anchorDay.present) {
      map['anchor_day'] = Variable<int>(anchorDay.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (reminderType.present) {
      map['reminder_type'] = Variable<int>(
        $RecurringItemsTable.$converterreminderType.toSql(reminderType.value),
      );
    }
    if (reminderLeadDays.present) {
      map['reminder_lead_days'] = Variable<int>(reminderLeadDays.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (installmentTotal.present) {
      map['installment_total'] = Variable<int>(installmentTotal.value);
    }
    if (installmentPaid.present) {
      map['installment_paid'] = Variable<int>(installmentPaid.value);
    }
    if (principal.present) {
      map['principal'] = Variable<int>(principal.value);
    }
    if (totalInterest.present) {
      map['total_interest'] = Variable<int>(totalInterest.value);
    }
    if (trialEndDate.present) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('direction: $direction, ')
          ..write('kind: $kind, ')
          ..write('amountType: $amountType, ')
          ..write('amount: $amount, ')
          ..write('cycle: $cycle, ')
          ..write('cycleInterval: $cycleInterval, ')
          ..write('anchorDay: $anchorDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('categoryId: $categoryId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reminderType: $reminderType, ')
          ..write('reminderLeadDays: $reminderLeadDays, ')
          ..write('active: $active, ')
          ..write('installmentTotal: $installmentTotal, ')
          ..write('installmentPaid: $installmentPaid, ')
          ..write('principal: $principal, ')
          ..write('totalInterest: $totalInterest, ')
          ..write('trialEndDate: $trialEndDate')
          ..write(')'))
        .toString();
  }
}

class $TransactionEntriesTable extends TransactionEntries
    with TableInfo<$TransactionEntriesTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntryDirection, int> direction =
      GeneratedColumn<int>(
        'direction',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EntryDirection>(
        $TransactionEntriesTable.$converterdirection,
      );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionSource, int> source =
      GeneratedColumn<int>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TransactionSource>(
        $TransactionEntriesTable.$convertersource,
      );
  static const VerificationMeta _dedupeFingerprintMeta = const VerificationMeta(
    'dedupeFingerprint',
  );
  @override
  late final GeneratedColumn<String> dedupeFingerprint =
      GeneratedColumn<String>(
        'dedupe_fingerprint',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _recurringItemIdMeta = const VerificationMeta(
    'recurringItemId',
  );
  @override
  late final GeneratedColumn<int> recurringItemId = GeneratedColumn<int>(
    'recurring_item_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recurring_items (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    amount,
    direction,
    categoryId,
    note,
    source,
    dedupeFingerprint,
    recurringItemId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('dedupe_fingerprint')) {
      context.handle(
        _dedupeFingerprintMeta,
        dedupeFingerprint.isAcceptableOrUnknown(
          data['dedupe_fingerprint']!,
          _dedupeFingerprintMeta,
        ),
      );
    }
    if (data.containsKey('recurring_item_id')) {
      context.handle(
        _recurringItemIdMeta,
        recurringItemId.isAcceptableOrUnknown(
          data['recurring_item_id']!,
          _recurringItemIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      direction: $TransactionEntriesTable.$converterdirection.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}direction'],
        )!,
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      source: $TransactionEntriesTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}source'],
        )!,
      ),
      dedupeFingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dedupe_fingerprint'],
      ),
      recurringItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recurring_item_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TransactionEntriesTable createAlias(String alias) {
    return $TransactionEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntryDirection, int, int> $converterdirection =
      const EnumIndexConverter<EntryDirection>(EntryDirection.values);
  static JsonTypeConverter2<TransactionSource, int, int> $convertersource =
      const EnumIndexConverter<TransactionSource>(TransactionSource.values);
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final int id;
  final DateTime date;

  /// 新台幣元。
  final int amount;
  final EntryDirection direction;
  final int categoryId;
  final String? note;
  final TransactionSource source;
  final String? dedupeFingerprint;
  final int? recurringItemId;
  final DateTime createdAt;
  const TransactionRow({
    required this.id,
    required this.date,
    required this.amount,
    required this.direction,
    required this.categoryId,
    this.note,
    required this.source,
    this.dedupeFingerprint,
    this.recurringItemId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['amount'] = Variable<int>(amount);
    {
      map['direction'] = Variable<int>(
        $TransactionEntriesTable.$converterdirection.toSql(direction),
      );
    }
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['source'] = Variable<int>(
        $TransactionEntriesTable.$convertersource.toSql(source),
      );
    }
    if (!nullToAbsent || dedupeFingerprint != null) {
      map['dedupe_fingerprint'] = Variable<String>(dedupeFingerprint);
    }
    if (!nullToAbsent || recurringItemId != null) {
      map['recurring_item_id'] = Variable<int>(recurringItemId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionEntriesCompanion toCompanion(bool nullToAbsent) {
    return TransactionEntriesCompanion(
      id: Value(id),
      date: Value(date),
      amount: Value(amount),
      direction: Value(direction),
      categoryId: Value(categoryId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      source: Value(source),
      dedupeFingerprint: dedupeFingerprint == null && nullToAbsent
          ? const Value.absent()
          : Value(dedupeFingerprint),
      recurringItemId: recurringItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringItemId),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      amount: serializer.fromJson<int>(json['amount']),
      direction: $TransactionEntriesTable.$converterdirection.fromJson(
        serializer.fromJson<int>(json['direction']),
      ),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      note: serializer.fromJson<String?>(json['note']),
      source: $TransactionEntriesTable.$convertersource.fromJson(
        serializer.fromJson<int>(json['source']),
      ),
      dedupeFingerprint: serializer.fromJson<String?>(
        json['dedupeFingerprint'],
      ),
      recurringItemId: serializer.fromJson<int?>(json['recurringItemId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'amount': serializer.toJson<int>(amount),
      'direction': serializer.toJson<int>(
        $TransactionEntriesTable.$converterdirection.toJson(direction),
      ),
      'categoryId': serializer.toJson<int>(categoryId),
      'note': serializer.toJson<String?>(note),
      'source': serializer.toJson<int>(
        $TransactionEntriesTable.$convertersource.toJson(source),
      ),
      'dedupeFingerprint': serializer.toJson<String?>(dedupeFingerprint),
      'recurringItemId': serializer.toJson<int?>(recurringItemId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionRow copyWith({
    int? id,
    DateTime? date,
    int? amount,
    EntryDirection? direction,
    int? categoryId,
    Value<String?> note = const Value.absent(),
    TransactionSource? source,
    Value<String?> dedupeFingerprint = const Value.absent(),
    Value<int?> recurringItemId = const Value.absent(),
    DateTime? createdAt,
  }) => TransactionRow(
    id: id ?? this.id,
    date: date ?? this.date,
    amount: amount ?? this.amount,
    direction: direction ?? this.direction,
    categoryId: categoryId ?? this.categoryId,
    note: note.present ? note.value : this.note,
    source: source ?? this.source,
    dedupeFingerprint: dedupeFingerprint.present
        ? dedupeFingerprint.value
        : this.dedupeFingerprint,
    recurringItemId: recurringItemId.present
        ? recurringItemId.value
        : this.recurringItemId,
    createdAt: createdAt ?? this.createdAt,
  );
  TransactionRow copyWithCompanion(TransactionEntriesCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      direction: data.direction.present ? data.direction.value : this.direction,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      note: data.note.present ? data.note.value : this.note,
      source: data.source.present ? data.source.value : this.source,
      dedupeFingerprint: data.dedupeFingerprint.present
          ? data.dedupeFingerprint.value
          : this.dedupeFingerprint,
      recurringItemId: data.recurringItemId.present
          ? data.recurringItemId.value
          : this.recurringItemId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('categoryId: $categoryId, ')
          ..write('note: $note, ')
          ..write('source: $source, ')
          ..write('dedupeFingerprint: $dedupeFingerprint, ')
          ..write('recurringItemId: $recurringItemId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    amount,
    direction,
    categoryId,
    note,
    source,
    dedupeFingerprint,
    recurringItemId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.direction == this.direction &&
          other.categoryId == this.categoryId &&
          other.note == this.note &&
          other.source == this.source &&
          other.dedupeFingerprint == this.dedupeFingerprint &&
          other.recurringItemId == this.recurringItemId &&
          other.createdAt == this.createdAt);
}

class TransactionEntriesCompanion extends UpdateCompanion<TransactionRow> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> amount;
  final Value<EntryDirection> direction;
  final Value<int> categoryId;
  final Value<String?> note;
  final Value<TransactionSource> source;
  final Value<String?> dedupeFingerprint;
  final Value<int?> recurringItemId;
  final Value<DateTime> createdAt;
  const TransactionEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.direction = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.note = const Value.absent(),
    this.source = const Value.absent(),
    this.dedupeFingerprint = const Value.absent(),
    this.recurringItemId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransactionEntriesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int amount,
    required EntryDirection direction,
    required int categoryId,
    this.note = const Value.absent(),
    required TransactionSource source,
    this.dedupeFingerprint = const Value.absent(),
    this.recurringItemId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : date = Value(date),
       amount = Value(amount),
       direction = Value(direction),
       categoryId = Value(categoryId),
       source = Value(source);
  static Insertable<TransactionRow> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? amount,
    Expression<int>? direction,
    Expression<int>? categoryId,
    Expression<String>? note,
    Expression<int>? source,
    Expression<String>? dedupeFingerprint,
    Expression<int>? recurringItemId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (direction != null) 'direction': direction,
      if (categoryId != null) 'category_id': categoryId,
      if (note != null) 'note': note,
      if (source != null) 'source': source,
      if (dedupeFingerprint != null) 'dedupe_fingerprint': dedupeFingerprint,
      if (recurringItemId != null) 'recurring_item_id': recurringItemId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransactionEntriesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? amount,
    Value<EntryDirection>? direction,
    Value<int>? categoryId,
    Value<String?>? note,
    Value<TransactionSource>? source,
    Value<String?>? dedupeFingerprint,
    Value<int?>? recurringItemId,
    Value<DateTime>? createdAt,
  }) {
    return TransactionEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      direction: direction ?? this.direction,
      categoryId: categoryId ?? this.categoryId,
      note: note ?? this.note,
      source: source ?? this.source,
      dedupeFingerprint: dedupeFingerprint ?? this.dedupeFingerprint,
      recurringItemId: recurringItemId ?? this.recurringItemId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (direction.present) {
      map['direction'] = Variable<int>(
        $TransactionEntriesTable.$converterdirection.toSql(direction.value),
      );
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(
        $TransactionEntriesTable.$convertersource.toSql(source.value),
      );
    }
    if (dedupeFingerprint.present) {
      map['dedupe_fingerprint'] = Variable<String>(dedupeFingerprint.value);
    }
    if (recurringItemId.present) {
      map['recurring_item_id'] = Variable<int>(recurringItemId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('categoryId: $categoryId, ')
          ..write('note: $note, ')
          ..write('source: $source, ')
          ..write('dedupeFingerprint: $dedupeFingerprint, ')
          ..write('recurringItemId: $recurringItemId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SavingGoalsTable extends SavingGoals
    with TableInfo<$SavingGoalsTable, SavingGoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetAmountMeta = const VerificationMeta(
    'targetAmount',
  );
  @override
  late final GeneratedColumn<int> targetAmount = GeneratedColumn<int>(
    'target_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _monthlyAmountMeta = const VerificationMeta(
    'monthlyAmount',
  );
  @override
  late final GeneratedColumn<int> monthlyAmount = GeneratedColumn<int>(
    'monthly_amount',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    targetAmount,
    targetDate,
    monthlyAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saving_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingGoalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
        _targetAmountMeta,
        targetAmount.isAcceptableOrUnknown(
          data['target_amount']!,
          _targetAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('monthly_amount')) {
      context.handle(
        _monthlyAmountMeta,
        monthlyAmount.isAcceptableOrUnknown(
          data['monthly_amount']!,
          _monthlyAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingGoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingGoalRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      targetAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_amount'],
      )!,
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
      monthlyAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}monthly_amount'],
      ),
    );
  }

  @override
  $SavingGoalsTable createAlias(String alias) {
    return $SavingGoalsTable(attachedDatabase, alias);
  }
}

class SavingGoalRow extends DataClass implements Insertable<SavingGoalRow> {
  final int id;
  final String name;
  final int targetAmount;
  final DateTime? targetDate;
  final int? monthlyAmount;
  const SavingGoalRow({
    required this.id,
    required this.name,
    required this.targetAmount,
    this.targetDate,
    this.monthlyAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['target_amount'] = Variable<int>(targetAmount);
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    if (!nullToAbsent || monthlyAmount != null) {
      map['monthly_amount'] = Variable<int>(monthlyAmount);
    }
    return map;
  }

  SavingGoalsCompanion toCompanion(bool nullToAbsent) {
    return SavingGoalsCompanion(
      id: Value(id),
      name: Value(name),
      targetAmount: Value(targetAmount),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      monthlyAmount: monthlyAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(monthlyAmount),
    );
  }

  factory SavingGoalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingGoalRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetAmount: serializer.fromJson<int>(json['targetAmount']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
      monthlyAmount: serializer.fromJson<int?>(json['monthlyAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'targetAmount': serializer.toJson<int>(targetAmount),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
      'monthlyAmount': serializer.toJson<int?>(monthlyAmount),
    };
  }

  SavingGoalRow copyWith({
    int? id,
    String? name,
    int? targetAmount,
    Value<DateTime?> targetDate = const Value.absent(),
    Value<int?> monthlyAmount = const Value.absent(),
  }) => SavingGoalRow(
    id: id ?? this.id,
    name: name ?? this.name,
    targetAmount: targetAmount ?? this.targetAmount,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    monthlyAmount: monthlyAmount.present
        ? monthlyAmount.value
        : this.monthlyAmount,
  );
  SavingGoalRow copyWithCompanion(SavingGoalsCompanion data) {
    return SavingGoalRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      monthlyAmount: data.monthlyAmount.present
          ? data.monthlyAmount.value
          : this.monthlyAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingGoalRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('targetDate: $targetDate, ')
          ..write('monthlyAmount: $monthlyAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, targetAmount, targetDate, monthlyAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingGoalRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetAmount == this.targetAmount &&
          other.targetDate == this.targetDate &&
          other.monthlyAmount == this.monthlyAmount);
}

class SavingGoalsCompanion extends UpdateCompanion<SavingGoalRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> targetAmount;
  final Value<DateTime?> targetDate;
  final Value<int?> monthlyAmount;
  const SavingGoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.monthlyAmount = const Value.absent(),
  });
  SavingGoalsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int targetAmount,
    this.targetDate = const Value.absent(),
    this.monthlyAmount = const Value.absent(),
  }) : name = Value(name),
       targetAmount = Value(targetAmount);
  static Insertable<SavingGoalRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? targetAmount,
    Expression<DateTime>? targetDate,
    Expression<int>? monthlyAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (targetDate != null) 'target_date': targetDate,
      if (monthlyAmount != null) 'monthly_amount': monthlyAmount,
    });
  }

  SavingGoalsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? targetAmount,
    Value<DateTime?>? targetDate,
    Value<int?>? monthlyAmount,
  }) {
    return SavingGoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      targetDate: targetDate ?? this.targetDate,
      monthlyAmount: monthlyAmount ?? this.monthlyAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<int>(targetAmount.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (monthlyAmount.present) {
      map['monthly_amount'] = Variable<int>(monthlyAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingGoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('targetDate: $targetDate, ')
          ..write('monthlyAmount: $monthlyAmount')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTable extends Profiles
    with TableInfo<$ProfilesTable, ProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _savingsRateMeta = const VerificationMeta(
    'savingsRate',
  );
  @override
  late final GeneratedColumn<int> savingsRate = GeneratedColumn<int>(
    'savings_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, occupation, savingsRate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('savings_rate')) {
      context.handle(
        _savingsRateMeta,
        savingsRate.isAcceptableOrUnknown(
          data['savings_rate']!,
          _savingsRateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      savingsRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}savings_rate'],
      ),
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class ProfileRow extends DataClass implements Insertable<ProfileRow> {
  final int id;
  final String? occupation;

  /// 目標儲蓄率 %。
  final int? savingsRate;
  const ProfileRow({required this.id, this.occupation, this.savingsRate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || savingsRate != null) {
      map['savings_rate'] = Variable<int>(savingsRate);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      savingsRate: savingsRate == null && nullToAbsent
          ? const Value.absent()
          : Value(savingsRate),
    );
  }

  factory ProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileRow(
      id: serializer.fromJson<int>(json['id']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      savingsRate: serializer.fromJson<int?>(json['savingsRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'occupation': serializer.toJson<String?>(occupation),
      'savingsRate': serializer.toJson<int?>(savingsRate),
    };
  }

  ProfileRow copyWith({
    int? id,
    Value<String?> occupation = const Value.absent(),
    Value<int?> savingsRate = const Value.absent(),
  }) => ProfileRow(
    id: id ?? this.id,
    occupation: occupation.present ? occupation.value : this.occupation,
    savingsRate: savingsRate.present ? savingsRate.value : this.savingsRate,
  );
  ProfileRow copyWithCompanion(ProfilesCompanion data) {
    return ProfileRow(
      id: data.id.present ? data.id.value : this.id,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      savingsRate: data.savingsRate.present
          ? data.savingsRate.value
          : this.savingsRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileRow(')
          ..write('id: $id, ')
          ..write('occupation: $occupation, ')
          ..write('savingsRate: $savingsRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, occupation, savingsRate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileRow &&
          other.id == this.id &&
          other.occupation == this.occupation &&
          other.savingsRate == this.savingsRate);
}

class ProfilesCompanion extends UpdateCompanion<ProfileRow> {
  final Value<int> id;
  final Value<String?> occupation;
  final Value<int?> savingsRate;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.occupation = const Value.absent(),
    this.savingsRate = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.occupation = const Value.absent(),
    this.savingsRate = const Value.absent(),
  });
  static Insertable<ProfileRow> custom({
    Expression<int>? id,
    Expression<String>? occupation,
    Expression<int>? savingsRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (occupation != null) 'occupation': occupation,
      if (savingsRate != null) 'savings_rate': savingsRate,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String?>? occupation,
    Value<int?>? savingsRate,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      occupation: occupation ?? this.occupation,
      savingsRate: savingsRate ?? this.savingsRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (savingsRate.present) {
      map['savings_rate'] = Variable<int>(savingsRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('occupation: $occupation, ')
          ..write('savingsRate: $savingsRate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $RecurringItemsTable recurringItems = $RecurringItemsTable(this);
  late final $TransactionEntriesTable transactionEntries =
      $TransactionEntriesTable(this);
  late final $SavingGoalsTable savingGoals = $SavingGoalsTable(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    recurringItems,
    transactionEntries,
    savingGoals,
    profiles,
  ];
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      required EntryDirection type,
      Value<String> icon,
      Value<bool> isSystem,
      Value<int> sortOrder,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<EntryDirection> type,
      Value<String> icon,
      Value<bool> isSystem,
      Value<int> sortOrder,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecurringItemsTable, List<RecurringItemRow>>
  _recurringItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recurringItems,
    aliasName: 'categories__id__recurring_items__category_id',
  );

  $$RecurringItemsTableProcessedTableManager get recurringItemsRefs {
    final manager = $$RecurringItemsTableTableManager(
      $_db,
      $_db.recurringItems,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_recurringItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionEntriesTable, List<TransactionRow>>
  _transactionEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionEntries,
        aliasName: 'categories__id__transaction_entries__category_id',
      );

  $$TransactionEntriesTableProcessedTableManager get transactionEntriesRefs {
    final manager = $$TransactionEntriesTableTableManager(
      $_db,
      $_db.transactionEntries,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntryDirection, EntryDirection, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recurringItemsRefs(
    Expression<bool> Function($$RecurringItemsTableFilterComposer f) f,
  ) {
    final $$RecurringItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recurringItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecurringItemsTableFilterComposer(
            $db: $db,
            $table: $db.recurringItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> transactionEntriesRefs(
    Expression<bool> Function($$TransactionEntriesTableFilterComposer f) f,
  ) {
    final $$TransactionEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionEntries,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionEntriesTableFilterComposer(
            $db: $db,
            $table: $db.transactionEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntryDirection, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> recurringItemsRefs<T extends Object>(
    Expression<T> Function($$RecurringItemsTableAnnotationComposer a) f,
  ) {
    final $$RecurringItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recurringItems,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecurringItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.recurringItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> transactionEntriesRefs<T extends Object>(
    Expression<T> Function($$TransactionEntriesTableAnnotationComposer a) f,
  ) {
    final $$TransactionEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionEntries,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (CategoryRow, $$CategoriesTableReferences),
          CategoryRow,
          PrefetchHooks Function({
            bool recurringItemsRefs,
            bool transactionEntriesRefs,
          })
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<EntryDirection> type = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                type: type,
                icon: icon,
                isSystem: isSystem,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required EntryDirection type,
                Value<String> icon = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                type: type,
                icon: icon,
                isSystem: isSystem,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recurringItemsRefs = false, transactionEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recurringItemsRefs) db.recurringItems,
                    if (transactionEntriesRefs) db.transactionEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recurringItemsRefs)
                        await $_getPrefetchedData<
                          CategoryRow,
                          $CategoriesTable,
                          RecurringItemRow
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._recurringItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).recurringItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (transactionEntriesRefs)
                        await $_getPrefetchedData<
                          CategoryRow,
                          $CategoriesTable,
                          TransactionRow
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._transactionEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (CategoryRow, $$CategoriesTableReferences),
      CategoryRow,
      PrefetchHooks Function({
        bool recurringItemsRefs,
        bool transactionEntriesRefs,
      })
    >;
typedef $$RecurringItemsTableCreateCompanionBuilder =
    RecurringItemsCompanion Function({
      Value<int> id,
      required String name,
      required EntryDirection direction,
      required RecurringKind kind,
      required AmountType amountType,
      required int amount,
      required Cycle cycle,
      Value<int> cycleInterval,
      Value<int> anchorDay,
      required DateTime startDate,
      Value<DateTime?> endDate,
      required int categoryId,
      Value<String?> paymentMethod,
      required ReminderType reminderType,
      Value<int> reminderLeadDays,
      Value<bool> active,
      Value<int?> installmentTotal,
      Value<int?> installmentPaid,
      Value<int?> principal,
      Value<int?> totalInterest,
      Value<DateTime?> trialEndDate,
    });
typedef $$RecurringItemsTableUpdateCompanionBuilder =
    RecurringItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<EntryDirection> direction,
      Value<RecurringKind> kind,
      Value<AmountType> amountType,
      Value<int> amount,
      Value<Cycle> cycle,
      Value<int> cycleInterval,
      Value<int> anchorDay,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<int> categoryId,
      Value<String?> paymentMethod,
      Value<ReminderType> reminderType,
      Value<int> reminderLeadDays,
      Value<bool> active,
      Value<int?> installmentTotal,
      Value<int?> installmentPaid,
      Value<int?> principal,
      Value<int?> totalInterest,
      Value<DateTime?> trialEndDate,
    });

final class $$RecurringItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $RecurringItemsTable, RecurringItemRow> {
  $$RecurringItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('recurring_items__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionEntriesTable, List<TransactionRow>>
  _transactionEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.transactionEntries,
        aliasName:
            'recurring_items__id__transaction_entries__recurring_item_id',
      );

  $$TransactionEntriesTableProcessedTableManager get transactionEntriesRefs {
    final manager = $$TransactionEntriesTableTableManager(
      $_db,
      $_db.transactionEntries,
    ).filter((f) => f.recurringItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _transactionEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecurringItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RecurringItemsTable> {
  $$RecurringItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntryDirection, EntryDirection, int>
  get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<RecurringKind, RecurringKind, int> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<AmountType, AmountType, int> get amountType =>
      $composableBuilder(
        column: $table.amountType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Cycle, Cycle, int> get cycle =>
      $composableBuilder(
        column: $table.cycle,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get cycleInterval => $composableBuilder(
    column: $table.cycleInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get anchorDay => $composableBuilder(
    column: $table.anchorDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ReminderType, ReminderType, int>
  get reminderType => $composableBuilder(
    column: $table.reminderType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get reminderLeadDays => $composableBuilder(
    column: $table.reminderLeadDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installmentTotal => $composableBuilder(
    column: $table.installmentTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get installmentPaid => $composableBuilder(
    column: $table.installmentPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get principal => $composableBuilder(
    column: $table.principal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalInterest => $composableBuilder(
    column: $table.totalInterest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get trialEndDate => $composableBuilder(
    column: $table.trialEndDate,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transactionEntriesRefs(
    Expression<bool> Function($$TransactionEntriesTableFilterComposer f) f,
  ) {
    final $$TransactionEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactionEntries,
      getReferencedColumn: (t) => t.recurringItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionEntriesTableFilterComposer(
            $db: $db,
            $table: $db.transactionEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecurringItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecurringItemsTable> {
  $$RecurringItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountType => $composableBuilder(
    column: $table.amountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycle => $composableBuilder(
    column: $table.cycle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycleInterval => $composableBuilder(
    column: $table.cycleInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get anchorDay => $composableBuilder(
    column: $table.anchorDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderType => $composableBuilder(
    column: $table.reminderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderLeadDays => $composableBuilder(
    column: $table.reminderLeadDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installmentTotal => $composableBuilder(
    column: $table.installmentTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get installmentPaid => $composableBuilder(
    column: $table.installmentPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get principal => $composableBuilder(
    column: $table.principal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalInterest => $composableBuilder(
    column: $table.totalInterest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get trialEndDate => $composableBuilder(
    column: $table.trialEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecurringItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecurringItemsTable> {
  $$RecurringItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntryDirection, int> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecurringKind, int> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AmountType, int> get amountType =>
      $composableBuilder(
        column: $table.amountType,
        builder: (column) => column,
      );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Cycle, int> get cycle =>
      $composableBuilder(column: $table.cycle, builder: (column) => column);

  GeneratedColumn<int> get cycleInterval => $composableBuilder(
    column: $table.cycleInterval,
    builder: (column) => column,
  );

  GeneratedColumn<int> get anchorDay =>
      $composableBuilder(column: $table.anchorDay, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ReminderType, int> get reminderType =>
      $composableBuilder(
        column: $table.reminderType,
        builder: (column) => column,
      );

  GeneratedColumn<int> get reminderLeadDays => $composableBuilder(
    column: $table.reminderLeadDays,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get installmentTotal => $composableBuilder(
    column: $table.installmentTotal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get installmentPaid => $composableBuilder(
    column: $table.installmentPaid,
    builder: (column) => column,
  );

  GeneratedColumn<int> get principal =>
      $composableBuilder(column: $table.principal, builder: (column) => column);

  GeneratedColumn<int> get totalInterest => $composableBuilder(
    column: $table.totalInterest,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get trialEndDate => $composableBuilder(
    column: $table.trialEndDate,
    builder: (column) => column,
  );

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transactionEntriesRefs<T extends Object>(
    Expression<T> Function($$TransactionEntriesTableAnnotationComposer a) f,
  ) {
    final $$TransactionEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.transactionEntries,
          getReferencedColumn: (t) => t.recurringItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecurringItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecurringItemsTable,
          RecurringItemRow,
          $$RecurringItemsTableFilterComposer,
          $$RecurringItemsTableOrderingComposer,
          $$RecurringItemsTableAnnotationComposer,
          $$RecurringItemsTableCreateCompanionBuilder,
          $$RecurringItemsTableUpdateCompanionBuilder,
          (RecurringItemRow, $$RecurringItemsTableReferences),
          RecurringItemRow,
          PrefetchHooks Function({bool categoryId, bool transactionEntriesRefs})
        > {
  $$RecurringItemsTableTableManager(
    _$AppDatabase db,
    $RecurringItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecurringItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecurringItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecurringItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<EntryDirection> direction = const Value.absent(),
                Value<RecurringKind> kind = const Value.absent(),
                Value<AmountType> amountType = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<Cycle> cycle = const Value.absent(),
                Value<int> cycleInterval = const Value.absent(),
                Value<int> anchorDay = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<ReminderType> reminderType = const Value.absent(),
                Value<int> reminderLeadDays = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int?> installmentTotal = const Value.absent(),
                Value<int?> installmentPaid = const Value.absent(),
                Value<int?> principal = const Value.absent(),
                Value<int?> totalInterest = const Value.absent(),
                Value<DateTime?> trialEndDate = const Value.absent(),
              }) => RecurringItemsCompanion(
                id: id,
                name: name,
                direction: direction,
                kind: kind,
                amountType: amountType,
                amount: amount,
                cycle: cycle,
                cycleInterval: cycleInterval,
                anchorDay: anchorDay,
                startDate: startDate,
                endDate: endDate,
                categoryId: categoryId,
                paymentMethod: paymentMethod,
                reminderType: reminderType,
                reminderLeadDays: reminderLeadDays,
                active: active,
                installmentTotal: installmentTotal,
                installmentPaid: installmentPaid,
                principal: principal,
                totalInterest: totalInterest,
                trialEndDate: trialEndDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required EntryDirection direction,
                required RecurringKind kind,
                required AmountType amountType,
                required int amount,
                required Cycle cycle,
                Value<int> cycleInterval = const Value.absent(),
                Value<int> anchorDay = const Value.absent(),
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                required int categoryId,
                Value<String?> paymentMethod = const Value.absent(),
                required ReminderType reminderType,
                Value<int> reminderLeadDays = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int?> installmentTotal = const Value.absent(),
                Value<int?> installmentPaid = const Value.absent(),
                Value<int?> principal = const Value.absent(),
                Value<int?> totalInterest = const Value.absent(),
                Value<DateTime?> trialEndDate = const Value.absent(),
              }) => RecurringItemsCompanion.insert(
                id: id,
                name: name,
                direction: direction,
                kind: kind,
                amountType: amountType,
                amount: amount,
                cycle: cycle,
                cycleInterval: cycleInterval,
                anchorDay: anchorDay,
                startDate: startDate,
                endDate: endDate,
                categoryId: categoryId,
                paymentMethod: paymentMethod,
                reminderType: reminderType,
                reminderLeadDays: reminderLeadDays,
                active: active,
                installmentTotal: installmentTotal,
                installmentPaid: installmentPaid,
                principal: principal,
                totalInterest: totalInterest,
                trialEndDate: trialEndDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecurringItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, transactionEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionEntriesRefs) db.transactionEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$RecurringItemsTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$RecurringItemsTableReferences
                                            ._categoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionEntriesRefs)
                        await $_getPrefetchedData<
                          RecurringItemRow,
                          $RecurringItemsTable,
                          TransactionRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecurringItemsTableReferences
                              ._transactionEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecurringItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recurringItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecurringItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecurringItemsTable,
      RecurringItemRow,
      $$RecurringItemsTableFilterComposer,
      $$RecurringItemsTableOrderingComposer,
      $$RecurringItemsTableAnnotationComposer,
      $$RecurringItemsTableCreateCompanionBuilder,
      $$RecurringItemsTableUpdateCompanionBuilder,
      (RecurringItemRow, $$RecurringItemsTableReferences),
      RecurringItemRow,
      PrefetchHooks Function({bool categoryId, bool transactionEntriesRefs})
    >;
typedef $$TransactionEntriesTableCreateCompanionBuilder =
    TransactionEntriesCompanion Function({
      Value<int> id,
      required DateTime date,
      required int amount,
      required EntryDirection direction,
      required int categoryId,
      Value<String?> note,
      required TransactionSource source,
      Value<String?> dedupeFingerprint,
      Value<int?> recurringItemId,
      Value<DateTime> createdAt,
    });
typedef $$TransactionEntriesTableUpdateCompanionBuilder =
    TransactionEntriesCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> amount,
      Value<EntryDirection> direction,
      Value<int> categoryId,
      Value<String?> note,
      Value<TransactionSource> source,
      Value<String?> dedupeFingerprint,
      Value<int?> recurringItemId,
      Value<DateTime> createdAt,
    });

final class $$TransactionEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionEntriesTable,
          TransactionRow
        > {
  $$TransactionEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) => db.categories
      .createAlias('transaction_entries__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecurringItemsTable _recurringItemIdTable(_$AppDatabase db) =>
      db.recurringItems.createAlias(
        'transaction_entries__recurring_item_id__recurring_items__id',
      );

  $$RecurringItemsTableProcessedTableManager? get recurringItemId {
    final $_column = $_itemColumn<int>('recurring_item_id');
    if ($_column == null) return null;
    final manager = $$RecurringItemsTableTableManager(
      $_db,
      $_db.recurringItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recurringItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionEntriesTable> {
  $$TransactionEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntryDirection, EntryDirection, int>
  get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionSource, TransactionSource, int>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get dedupeFingerprint => $composableBuilder(
    column: $table.dedupeFingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecurringItemsTableFilterComposer get recurringItemId {
    final $$RecurringItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recurringItemId,
      referencedTable: $db.recurringItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecurringItemsTableFilterComposer(
            $db: $db,
            $table: $db.recurringItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionEntriesTable> {
  $$TransactionEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dedupeFingerprint => $composableBuilder(
    column: $table.dedupeFingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecurringItemsTableOrderingComposer get recurringItemId {
    final $$RecurringItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recurringItemId,
      referencedTable: $db.recurringItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecurringItemsTableOrderingComposer(
            $db: $db,
            $table: $db.recurringItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionEntriesTable> {
  $$TransactionEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntryDirection, int> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionSource, int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get dedupeFingerprint => $composableBuilder(
    column: $table.dedupeFingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecurringItemsTableAnnotationComposer get recurringItemId {
    final $$RecurringItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recurringItemId,
      referencedTable: $db.recurringItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecurringItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.recurringItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionEntriesTable,
          TransactionRow,
          $$TransactionEntriesTableFilterComposer,
          $$TransactionEntriesTableOrderingComposer,
          $$TransactionEntriesTableAnnotationComposer,
          $$TransactionEntriesTableCreateCompanionBuilder,
          $$TransactionEntriesTableUpdateCompanionBuilder,
          (TransactionRow, $$TransactionEntriesTableReferences),
          TransactionRow,
          PrefetchHooks Function({bool categoryId, bool recurringItemId})
        > {
  $$TransactionEntriesTableTableManager(
    _$AppDatabase db,
    $TransactionEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<EntryDirection> direction = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<TransactionSource> source = const Value.absent(),
                Value<String?> dedupeFingerprint = const Value.absent(),
                Value<int?> recurringItemId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionEntriesCompanion(
                id: id,
                date: date,
                amount: amount,
                direction: direction,
                categoryId: categoryId,
                note: note,
                source: source,
                dedupeFingerprint: dedupeFingerprint,
                recurringItemId: recurringItemId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int amount,
                required EntryDirection direction,
                required int categoryId,
                Value<String?> note = const Value.absent(),
                required TransactionSource source,
                Value<String?> dedupeFingerprint = const Value.absent(),
                Value<int?> recurringItemId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionEntriesCompanion.insert(
                id: id,
                date: date,
                amount: amount,
                direction: direction,
                categoryId: categoryId,
                note: note,
                source: source,
                dedupeFingerprint: dedupeFingerprint,
                recurringItemId: recurringItemId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, recurringItemId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$TransactionEntriesTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$TransactionEntriesTableReferences
                                            ._categoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (recurringItemId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recurringItemId,
                                    referencedTable:
                                        $$TransactionEntriesTableReferences
                                            ._recurringItemIdTable(db),
                                    referencedColumn:
                                        $$TransactionEntriesTableReferences
                                            ._recurringItemIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransactionEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionEntriesTable,
      TransactionRow,
      $$TransactionEntriesTableFilterComposer,
      $$TransactionEntriesTableOrderingComposer,
      $$TransactionEntriesTableAnnotationComposer,
      $$TransactionEntriesTableCreateCompanionBuilder,
      $$TransactionEntriesTableUpdateCompanionBuilder,
      (TransactionRow, $$TransactionEntriesTableReferences),
      TransactionRow,
      PrefetchHooks Function({bool categoryId, bool recurringItemId})
    >;
typedef $$SavingGoalsTableCreateCompanionBuilder =
    SavingGoalsCompanion Function({
      Value<int> id,
      required String name,
      required int targetAmount,
      Value<DateTime?> targetDate,
      Value<int?> monthlyAmount,
    });
typedef $$SavingGoalsTableUpdateCompanionBuilder =
    SavingGoalsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> targetAmount,
      Value<DateTime?> targetDate,
      Value<int?> monthlyAmount,
    });

class $$SavingGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $SavingGoalsTable> {
  $$SavingGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get monthlyAmount => $composableBuilder(
    column: $table.monthlyAmount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavingGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingGoalsTable> {
  $$SavingGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get monthlyAmount => $composableBuilder(
    column: $table.monthlyAmount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavingGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingGoalsTable> {
  $$SavingGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get targetAmount => $composableBuilder(
    column: $table.targetAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get monthlyAmount => $composableBuilder(
    column: $table.monthlyAmount,
    builder: (column) => column,
  );
}

class $$SavingGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingGoalsTable,
          SavingGoalRow,
          $$SavingGoalsTableFilterComposer,
          $$SavingGoalsTableOrderingComposer,
          $$SavingGoalsTableAnnotationComposer,
          $$SavingGoalsTableCreateCompanionBuilder,
          $$SavingGoalsTableUpdateCompanionBuilder,
          (
            SavingGoalRow,
            BaseReferences<_$AppDatabase, $SavingGoalsTable, SavingGoalRow>,
          ),
          SavingGoalRow,
          PrefetchHooks Function()
        > {
  $$SavingGoalsTableTableManager(_$AppDatabase db, $SavingGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> targetAmount = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<int?> monthlyAmount = const Value.absent(),
              }) => SavingGoalsCompanion(
                id: id,
                name: name,
                targetAmount: targetAmount,
                targetDate: targetDate,
                monthlyAmount: monthlyAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int targetAmount,
                Value<DateTime?> targetDate = const Value.absent(),
                Value<int?> monthlyAmount = const Value.absent(),
              }) => SavingGoalsCompanion.insert(
                id: id,
                name: name,
                targetAmount: targetAmount,
                targetDate: targetDate,
                monthlyAmount: monthlyAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavingGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingGoalsTable,
      SavingGoalRow,
      $$SavingGoalsTableFilterComposer,
      $$SavingGoalsTableOrderingComposer,
      $$SavingGoalsTableAnnotationComposer,
      $$SavingGoalsTableCreateCompanionBuilder,
      $$SavingGoalsTableUpdateCompanionBuilder,
      (
        SavingGoalRow,
        BaseReferences<_$AppDatabase, $SavingGoalsTable, SavingGoalRow>,
      ),
      SavingGoalRow,
      PrefetchHooks Function()
    >;
typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String?> occupation,
      Value<int?> savingsRate,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String?> occupation,
      Value<int?> savingsRate,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get savingsRate => $composableBuilder(
    column: $table.savingsRate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get savingsRate => $composableBuilder(
    column: $table.savingsRate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get savingsRate => $composableBuilder(
    column: $table.savingsRate,
    builder: (column) => column,
  );
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          ProfileRow,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (
            ProfileRow,
            BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow>,
          ),
          ProfileRow,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<int?> savingsRate = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                occupation: occupation,
                savingsRate: savingsRate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<int?> savingsRate = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                occupation: occupation,
                savingsRate: savingsRate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      ProfileRow,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (ProfileRow, BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow>),
      ProfileRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$RecurringItemsTableTableManager get recurringItems =>
      $$RecurringItemsTableTableManager(_db, _db.recurringItems);
  $$TransactionEntriesTableTableManager get transactionEntries =>
      $$TransactionEntriesTableTableManager(_db, _db.transactionEntries);
  $$SavingGoalsTableTableManager get savingGoals =>
      $$SavingGoalsTableTableManager(_db, _db.savingGoals);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
}
