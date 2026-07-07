# 02 技術選型

## 平台

| 項目 | 選擇 | 決策 |
|---|---|---|
| App 框架 | Flutter（stable channel）/ Dart 3 | ADR-001 |
| 首發平台 | Android（minSdk 26 / Android 8.0+） | ADR-001 |
| iOS | 第二波，捷徑（Shortcuts）補自動記帳 | ADR-001 |

## 套件

| 領域 | 套件 | 用途 |
|---|---|---|
| 狀態管理 | `flutter_riverpod` | providers；與 Drift stream 整合（ADR-003） |
| 本機資料庫 | `drift` + `drift_flutter` | SQLite、型別安全、reactive queries（ADR-002） |
| 路由 | `go_router` | 宣告式路由、deep link 預留 |
| 本機通知 | `flutter_local_notifications` + `timezone` + `flutter_timezone` | 扣款/繳費排程提醒 |
| 圖表 | `fl_chart` | 現金流投影、分類分析 |
| 格式化 | `intl` | TWD 金額、日期（zh_TW） |
| HTTP | `http` | AI proxy 呼叫（夠用就不上 dio） |
| QR 掃描 | `mobile_scanner` | Phase 2 才加入 |
| dev | `flutter_lints`、`build_runner`、`drift_dev` | lint 與 Drift 產碼 |

## 版本策略

- 用 `flutter pub add <pkg>` 取當下最新 stable，實際版本鎖在 `pubspec.lock`（進版控）
- 不手抄版本號進文件；本表只記「用什麼、為什麼」

### 已知釘版（升級前必讀）

- **`sqlparser` 釘在 0.44.5**（dev dependency，2026-07-07）：sqlparser 0.44.6 移除了
  `DartPlaceholder.when`，會讓 drift_dev 2.34.0 的 codegen 掛掉；而修好的
  drift_dev ≥2.34.2 需要 analyzer 13，被目前 Flutter SDK 的 flutter_test
  釘版擋住。**解法**：等 Flutter SDK 升級後，改用 drift_dev ≥2.34.2 並移除
  sqlparser 釘版。
- build_runner 2.15 已移除 `--delete-conflicting-outputs` 旗標（會自動處理），
  指令只要 `dart run build_runner build`。

## 慣例

- 金額一律以 **int（新台幣元）** 儲存與計算，不用 double（不做多幣別，見 PLAN 明確不做）
- 日期時間存 UTC epoch，顯示時轉 `Asia/Taipei`；「週期日」（每月幾號）存 int day-of-month，月底問題（31 號 → 2 月）由 OccurrenceEngine 統一處理
- 純 Dart 的 domain 層不 import Flutter / Drift
