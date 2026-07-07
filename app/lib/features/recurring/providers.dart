import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/recurring_item.dart';

/// 目前生效中的週期性收支（Drift reactive query，資料一變 UI 就跟著變）。
final activeRecurringItemsProvider = StreamProvider<List<RecurringItem>>(
  (ref) => ref.watch(recurringRepositoryProvider).watchActive(),
);
