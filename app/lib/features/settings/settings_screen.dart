import 'package:flutter/material.dart';

/// 設定：職業／收入檔案、儲蓄目標、資料匯出。
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: const Center(child: Text('個人檔案與匯出（下一步實作）')),
    );
  }
}
