import 'package:flutter/material.dart';

/// 記帳：自然語言快速輸入（Phase 1）與自動來源確認（Phase 2）的家。
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('記帳')),
      body: const Center(child: Text('快速記帳（下一步實作）')),
    );
  }
}
