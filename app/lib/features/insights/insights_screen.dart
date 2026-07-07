import 'package:flutter/material.dart';

/// 分析：月度分類佔比與趨勢圖表（fl_chart）的家。
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('分析')),
      body: const Center(child: Text('月度分析（下一步實作）')),
    );
  }
}
