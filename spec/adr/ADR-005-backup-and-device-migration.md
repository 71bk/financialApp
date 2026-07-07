# ADR-005: 備份與換機——OS 備份管道＋雙格式匯出

- Status: Accepted
- Date: 2026-07-07
- Product: financialApp

## Context

ADR-002 選了 local-first、無帳號，代價是換機與手機遺失的資料風險。財務資料
累積數月後遺失＝信任毀滅，「資料不會消失」是必須解的題；但為了備份提前架
伺服器與帳號系統，等於推翻 local-first 的全部好處。另外 Google 與 Apple 的
裝置備份互不相通，跨平台換機是 OS 機制救不了的缺口。

## Decision

```text
同平台換機：OS 備份（Android Auto Backup、iOS iCloud 裝置備份）
            manifest 明確宣告 allowBackup="true"
跨平台換機：App 內「完整備份檔」JSON 匯出／匯入（含 schema 版本號）
人讀分析：  CSV 匯出（不保證可還原）
可視化：    設定頁顯示 OS 備份狀態與上次匯出時間，久未備份溫和提醒
```

## Rationale

- Drift 資料庫（drift_flutter 0.3.0 預設 `getApplicationDocumentsDirectory()`，
  已查證原始碼）位於兩平台 OS 備份的**預設涵蓋範圍**——同平台換機零程式碼解決
- 備份存在**使用者自己的** Google／Apple 帳號，與「資料不離開使用者」的隱私敘事一致，
  開發者依然什麼都看不到
- OS 備份跨生態不通，JSON 完整備份檔是跨平台換機的唯一路徑
- CSV 塞不下完整結構（分期欄位、提醒設定會丟失），故還原用 JSON、人讀用 CSV，
  雙格式各司其職

## Consequences

正面：零伺服器成本、涵蓋主要換機情境、隱私承諾保持完整。

代價：

- 使用者關掉 OS 備份且從不匯出 → 資料仍會滅失（接受；以備份狀態可視化緩解，
  剩下是使用者自己的選擇）
- JSON 為明文財務資料：匯出 UI 需提醒存放於私人雲端；檔案加密列為後期選項
  （忘記密碼＝備份作廢的支援成本，MVP 不做）
- Android Auto Backup 配額 25MB：純帳目資料多年無虞，但**附件（發票照片等）
  不得進資料庫與備份範圍**——未來若做附件，存專用目錄並以
  `dataExtractionRules` 排除（設計約束，違反會讓所有使用者的備份爆額）

## Alternatives Considered

### 自建雲端同步（帳號＋伺服器）

徹底解法，但背上帳號系統、個資責任與維運成本，MVP 驗證失敗時全是沉沒成本。
驗證成功後另立 ADR 選 BaaS。

### 只靠手動匯出

使用者會忘。單獨不及格，只能當第二道保險。

### 使用者雲碟檔案同步（iCloud Drive／Google Drive 檔案層同步）

衝突處理複雜、平台間行為不一致，且多數只解同生態情境。不採。

## Implementation Notes

- `AndroidManifest.xml` 已加 `android:allowBackup="true"`（附註解指回本 ADR）
- 備份檔命名：`financial_app_backup_YYYYMMDD.json`；匯入時檢查 schema 版本號，
  版本不符走遷移或明確報錯
- 匯出／匯入功能排 Phase 1 尾段（PLAN 功能表 #9）
- iOS 側無需設定：Documents 目錄預設進 iCloud 備份

## Related Documents

- `spec/adr/ADR-002-local-first-sqlite-drift.md`
- `spec/01-architecture.md`（備份與換機策略節）
- `spec/PLAN.md`（Phase 1 #9）
