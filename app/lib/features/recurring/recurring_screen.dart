import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/enums.dart';
import 'providers.dart';

/// 固定收支：訂閱、分期、帳單與定期收入的管理入口。
class RecurringScreen extends ConsumerWidget {
  const RecurringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(activeRecurringItemsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('固定收支')),
      body: items.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('讀取失敗：$error')),
        data: (list) => list.isEmpty
            ? const _EmptyState()
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  final isIncome = item.direction == EntryDirection.income;
                  return ListTile(
                    leading: Icon(
                      isIncome ? Icons.trending_up : Icons.trending_down,
                    ),
                    title: Text(item.name),
                    subtitle: Text('每月 ${item.anchorDay} 號'),
                    trailing: Text(
                      '${isIncome ? '+' : '-'}NT\$ ${item.amount}',
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('新增表單將在下一步實作')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.autorenew,
            size: 48,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 12),
          Text('還沒有固定收支', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            '先加入薪資、訂閱、分期與帳單',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
