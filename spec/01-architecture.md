# 01 系統架構

## 總覽

MVP 是一個 **local-first 的 Flutter App**：

- 所有財務資料存在裝置上的 SQLite，**沒有帳號、沒有雲端資料庫**（ADR-002）
- 唯一的網路呼叫是 AI 功能（NL 記帳解析、月度建議），經由 thin proxy 呼叫 Claude API（ADR-004）
- 提醒使用本機排程通知，不依賴推播伺服器

```text
┌─────────────────────────────────────┐
│ Flutter App (Android first)         │
│                                     │
│  presentation  ── features/ 畫面與  │
│       │           Riverpod providers│
│  domain        ── 純 Dart：實體、    │
│       │           計算引擎（可單測） │
│  data          ── Drift(SQLite)、   │
│                   repositories      │
└───────┬─────────────────┬───────────┘
        │                 │
   本機排程通知      AI Proxy ──> Claude API
 (flutter_local_     (beta 前上線，
  notifications)      持有 API key)
```

## 分層規則

| 層 | 內容 | 規則 |
|---|---|---|
| presentation | `features/` 下的畫面、widget、Riverpod providers | 不直接碰 DB，只依賴 domain 與 repositories |
| domain | 實體（RecurringItem、Transaction…）、計算引擎（OccurrenceEngine、SafeToSpendCalculator、CashflowProjection） | **純 Dart、零 Flutter 依賴**，全部可單元測試 |
| data | Drift 資料表、DAO、repositories | domain 不 import data 的 Drift 型別；repository 負責轉換 |

核心價值（現金流計算）全部在 domain 層的純 Dart 裡，這是測試的重點區。

## 典型資料流

新增一筆訂閱：

1. `features/recurring/` 表單 → repository 寫入 Drift
2. Drift 的 reactive query（stream）自動更新 dashboard 的 providers
3. `NotificationScheduler` 重新排程未來 N 次「即將扣款」通知

## AI 呼叫路徑（ADR-004）

- **Dogfood 階段**：dev API key 以 `--dart-define` 注入，直連 Claude API。key 不進版控、此組建不發佈。
- **公開 beta 之前**：必須上 thin proxy（Cloudflare Workers 或 Supabase Edge Function），App 端移除直連。
- AI 不可用時 App 要能正常運作：NL 解析 fallback 成手動表單，月度建議顯示「暫無」。

## 通知架構

- `flutter_local_notifications` + `timezone` 做本機排程
- App 每次啟動（及每次收支設定變更）重算並排程未來 30 天內的所有提醒
- 兩種提醒型態：「即將自動扣款」與「記得去繳費」（依 RecurringItem.reminderType）

## Phase 2 輸入管線（預留位置）

通知監聽（Android platform channel）、CSV 匯入、發票 QR 掃描三個來源
統一進 `IngestService`：解析 → AI 分類 → 去重（dedupeFingerprint）→ 寫入 Transaction。
詳細規格見 `07-input-pipeline-spec.md`（未撰寫）。

## 備份與換機策略（2026-07-07 定案，ADR-005）

資料不落在開發者伺服器；備份走使用者自己的 OS 管道＋App 內匯出。

| 情境 | 機制 |
|---|---|
| 同平台換機（Android→Android / iOS→iOS） | OS 備份自動還原：Android Auto Backup（存使用者 Google 帳號、配額 25MB、Android 9+ 端側加密）；iOS iCloud 裝置備份 |
| 跨平台換機（Android↔iOS） | App 內「完整備份檔」JSON 匯出 → 新機匯入（OS 備份跨生態不通） |
| 手機遺失且未開 OS 備份 | 僅能靠使用者曾匯出的備份檔；設定頁顯示備份狀態，久未備份溫和提醒 |

- Drift 資料庫位置（已查證 drift_flutter 0.3.0 原始碼）：預設 `getApplicationDocumentsDirectory()`
  ——Android 為 `app_flutter/financial_app.sqlite`、iOS 為 `Documents/`，**兩平台 OS 備份預設涵蓋**；
  Android manifest 已明確宣告 `allowBackup="true"`。
- 匯出雙格式：**JSON** 完整備份（全部實體＋schema 版本號，還原用）；**CSV** 人讀／試算表分析用
  （塞不下完整結構，不保證可還原）。
- JSON 為明文財務資料：匯出 UI 需提醒存放於私人雲端；檔案加密列為後期選項
  （忘記密碼＝備份作廢的支援成本，MVP 不做）。
- **附件設計約束**：未來若有發票照片等附件，不進資料庫、不進 Auto Backup
  （25MB 配額會爆）——存本機專用目錄並以 `dataExtractionRules` 排除於備份。

## 明確不在 MVP 架構內

帳號系統、雲端同步（驗證成功後另立 ADR 選 BaaS）、多裝置、銀行整合、載具 API。
