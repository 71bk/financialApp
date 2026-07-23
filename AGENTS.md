# AGENTS.md — financialApp 專案事實

> 最後更新：2026-07-23　適用範圍：整個 repo（`financialApp/`）
> 主要參考：`spec/PLAN.md`（產品）、`spec/01~03`（架構/技術/資料）、`spec/adr/`（決策）
> 本檔是「程式碼現況的事實」；產品意圖看 `spec/`。兩者衝突時以本檔＋程式碼為準，並回報差異。

---

## 1. Agent 工作原則

- **先讀後改**：欄位名、enum、函式簽名一律用讀的確認，不用猜的。改前先看 `git status`。
- **沿用既有 pattern**：不引入新依賴、新架構、新狀態管理工具。技術選型已鎖在 `spec/adr/`，要改先寫新 ADR，不默默改方向。
- **小範圍 patch**：不整份重寫，不做任務外的重構／改名／排版。
- **改後驗證**：跑本檔第 7 節的指令。跑不了要明說「未執行」與原因，不可默默略過。

## 2. 專案現況（重要：這是初始骨架，多數畫面是佔位）

只有 2 個 commit。**domain 與 data 層已完成且有測試；presentation 層大多是佔位畫面**。

| 區塊 | 狀態 |
|---|---|
| `domain/`（計算引擎、模型） | ✅ 完成，14 個單元測試全過 |
| `data/`（Drift 表、repository、seed） | ✅ 完成，schemaVersion=1 |
| `features/recurring/` | 🚧 有接 provider 的清單；新增表單是 stub（按下只跳 SnackBar） |
| `features/dashboard｜transactions｜insights｜settings` | 🚧 全是佔位畫面（`Center(Text('下一步實作'))`） |
| AI client（`data/ai/`） | ❌ 尚未建立 |
| 通知排程（`NotificationScheduler`） | ❌ 尚未建立 |
| `CashflowProjection`（現金流投影引擎） | ❌ 尚未建立（spec 有設計，程式碼未實作） |
| Category／Profile／SavingGoal 的 repository | ❌ 尚未建立（只有 recurring、transaction 兩個 repository） |

> 寫「接上某功能」前，先確認它是否已存在——上表 ❌ 的東西目前是空的，要新建。

## 3. 目錄結構

```
financialApp/
├─ AGENTS.md / CLAUDE.md      ← 本文件
├─ spec/                       產品與架構規格（PLAN.md、01~03、adr/）
├─ README.md
└─ app/                        Flutter 專案（套件名 financial_app）
   ├─ pubspec.yaml             依賴；版本鎖在 pubspec.lock
   ├─ analysis_options.yaml    lint：package:flutter_lints
   ├─ android/ ios/            原生殼
   ├─ test/domain/             單元測試（目前只測 domain）
   └─ lib/
      ├─ main.dart             進入點 → ProviderScope → FinancialApp
      ├─ app.dart              MaterialApp.router
      ├─ core/                 router.dart（go_router + 底部導覽）、theme.dart
      ├─ domain/               ★純 Dart，零 Flutter/Drift 依賴，測試重點
      │  ├─ models/            enums、recurring_item、transaction_entry、saving_goal
      │  └─ services/          occurrence_engine、safe_to_spend_calculator
      ├─ data/                 Drift 與 repository
      │  ├─ db/                tables.dart、database.dart、database.g.dart(產碼)
      │  ├─ repositories/      recurring_repository、transaction_repository
      │  └─ providers.dart     databaseProvider 等 DI
      └─ features/<name>/      各分頁：<name>_screen.dart（＋需要時 providers.dart）
```

## 4. 分層規則（違反會破壞架構，最重要）

| 層 | 可以 | 不可以 |
|---|---|---|
| `presentation`（features） | 依賴 provider → repository、domain 模型 | **不直接碰 DB**、不 import Drift 型別 |
| `domain` | 純 Dart 邏輯與模型 | **不 import Flutter、不 import Drift**（含 `package:drift`） |
| `data` | Drift 表、DAO、repository；負責 Row ↔ domain 轉換 | 不把 Drift Row 型別外洩到 domain／presentation |

**核心價值（現金流計算）全在 `domain/services/` 的純 Dart 裡，這是單元測試的重點區。**

## 5. 技術棧（實測自 pubspec.yaml 與 `flutter --version`）

- **Flutter 3.44.5 stable / Dart 3.12.2**（SDK 約束 `^3.12.2`）。Flutter 安裝在 `D:\flutter`（已在 PATH）。
- **首發 Android**（ADR-001），iOS 隨後。`applicationId = com.financialapp.financial_app`。

| 領域 | 套件 | 版本（pubspec） |
|---|---|---|
| 狀態管理 | `flutter_riverpod` | ^3.3.2 |
| 本機 DB | `drift` + `drift_flutter` | ^2.34.1 / ^0.3.0 |
| 路由 | `go_router` | ^17.3.0 |
| 本機通知 | `flutter_local_notifications` + `timezone` + `flutter_timezone` | ^22.0.1 / ^0.11.1 / ^5.1.0 |
| 圖表 | `fl_chart` | ^1.2.0 |
| 格式化 | `intl` | ^0.20.3 |
| HTTP | `http` | ^1.6.0 |
| dev | `flutter_lints` / `build_runner` / `drift_dev` / `sqlparser` | ^6.0.0 / ^2.15.0 / ^2.34.0 / **0.44.5（釘死）** |

### 「沒有使用」清單（別憑直覺引入）

- ❌ **無帳號／登入／JWT／session**（local-first，MVP 無帳號，ADR-002）
- ❌ **無雲端資料庫／後端**（全部本機 SQLite）
- ❌ **無 `dio`**（HTTP 用 `http` 就好，ADR-004）
- ❌ **無 `riverpod_generator`／provider 產碼**（MVP 手寫 provider，ADR-003）
- ❌ **無 `mobile_scanner`**（QR 掃描是 Phase 2，尚未加入）
- ❌ **無 `freezed`／`json_serializable`**（模型是手寫 class）
- ❌ **無多幣別、無 double 金額、無 i18n／多語系**（明確不做，見 PLAN）

## 6. 資料模型規則（業務規則，非 schema 本身）

### 型別對照：domain 模型 vs Drift Row 是**不同型別**

repository 負責轉換，別搞混：

| domain（純 Dart） | Drift Row（`@DataClassName`） | 表 |
|---|---|---|
| `RecurringItem` | `RecurringItemRow` | `RecurringItems` |
| `TransactionEntry` | `TransactionRow` | `TransactionEntries` |
| `SavingGoal` | `SavingGoalRow` | `SavingGoals` |
| （無 domain 模型） | `CategoryRow` | `Categories` |
| （無 domain 模型） | `ProfileRow` | `Profiles` |

Row 加 `Row` 後綴就是為了避免與 domain 撞名。**presentation 只看得到左欄，右欄不出 data 層。**

### 硬規則

- **金額一律 `int`（新台幣元）**，永不用 double。
- **日期**：domain 用 `DateTime`；Drift `DateTimeColumn` 底層存 epoch。顯示層轉 `Asia/Taipei`（用 `intl`／`timezone`）。
- **`anchorDay` 月底溢出**（如 31 號在 2 月）統一由 `OccurrenceEngine._clampedDate` 取當月最後一天處理，**別在別處重寫日期邏輯**。
- **分期**：`OccurrenceEngine` 用 `installmentTotal` + `startDate` 推導期數；`installmentPaid` 只是顯示用的衍生值，不參與展開計算。
- **enum 存 int index（`intEnum`）**：`EntryDirection`、`RecurringKind`、`AmountType`、`Cycle`、`ReminderType`、`TransactionSource` 在 DB 裡存的是**enum 的順序 index**。⚠️ 見第 8 節地雷 #1。
- **系統分類**：`database.dart` 的 `_seedCategories` 在建庫時塞入 `isSystem=true` 的預設分類；id 是 autoincrement，**不要在程式碼寫死分類 id**。
- `id == 0` 在 domain 模型代表「尚未持久化」。

## 7. 驗證指令（★每次改完必跑；已實測可用）

**本機無 Android SDK，跑不了 App 畫面（無法 `flutter run` / `flutter build apk`）。UI 改動無法實機驗證，只能靠下列指令。**

```powershell
cd D:\App\financialApp\app

# 1. 靜態分析（實測：No issues found）
flutter analyze

# 2. 單元測試（實測：14 個測試全過）
flutter test
```

改到 `data/db/tables.dart` 或 `database.dart`（Drift schema）後，**必須重新產碼**：

```powershell
cd D:\App\financialApp\app
dart run build_runner build
```

- ⚠️ 指令**不要**加 `--delete-conflicting-outputs`：build_runner 2.15 已移除該旗標（會自動處理）。
- 產出的 `database.g.dart` 是機器產碼，**不要手改**。

## 8. 最容易踩的地雷（弱模型必看）

1. **改 enum 順序＝毀資料**。`enums.dart` 的 enum 以 `intEnum` 存 index。**在中間插入或重排 enum 值，會讓 DB 既有資料的意義整個位移**（原本 index=1 的 `expense` 變別的）。只能在 enum **尾端 append 新值**，不可重排。
2. **改 Drift 表要配 migration**。`schemaVersion = 1`，`MigrationStrategy` 目前只有 `onCreate`。任何動 `tables.dart` 的欄位／表：必須①`schemaVersion` +1 ②在 `migration` 補對應 `onUpgrade` 步驟。忘了＝既有安裝升級時崩潰或掉資料（ADR-002 紀律）。
3. **改 schema 後忘了 `dart run build_runner build`** → `database.g.dart` 與 `tables.dart` 不同步，編譯錯。
4. **`sqlparser` 釘死 0.44.5，別升**。0.44.6 移除 `DartPlaceholder.when`，會讓 drift_dev 2.34.0 產碼掛掉；修好的 drift_dev ≥2.34.2 又需要更新的 Flutter SDK。詳見 `spec/02-tech-stack.md`。
5. **別在 domain 層 import Drift 或 Flutter**。domain 是純 Dart 測試區，一 import 就破功。
6. **API key 絕不進 App／版控**（ADR-004）。AI 未實作；未來一律經 thin proxy 呼叫 Claude API，dogfood 期才用 `--dart-define` 注入 dev key。
7. **`applicationId` 上架後永久不可變更**。目前為 `com.financialapp.financial_app`（gradle namespace／applicationId、MainActivity package、kotlin 資料夾路徑四處一致）。產品名仍為暫名，正式名稱定案後上架前需一次改到位（四處同步 + 資料夾改名 + `dart run build_runner` 不涉及、但要重編 Android）。
8. **`minSdk` 已釘死 26**（`android/app/build.gradle.kts`，非 Flutter 預設；Android 8.0+，Phase 2 通知監聽需要）。降版前先確認所有原生外掛支援。

## 9. 禁止事項

1. 未經使用者要求：**不 commit / push / merge / deploy**。
2. **不改 Drift schema 而不同步 `schemaVersion` + migration**。
3. **不手改 `*.g.dart`**。
4. **不在 domain 層 import Drift / Flutter**。
5. **不引入新依賴或替換既有技術選型**（改架構要先寫 ADR）。
6. **不把 API key／`.env` 寫進 App 或版控**。
7. **金額不用 double；不重排 enum；不加 i18n／多語系**。

## 10. 完成標準

- `flutter analyze` 無 issue、`flutter test` 全過。
- 動過 schema 有跑 `build_runner build` 且加了 migration。
- 回報包含：改了什麼、改了哪些檔、驗證結果、剩餘風險。
- 若踩到本檔沒寫的新地雷，補進第 8 節。

## 11. 常用檔案位置

| 想找 | 檔案 |
|---|---|
| App 進入點 | `app/lib/main.dart` → `app/lib/app.dart` |
| 路由與底部導覽 | `app/lib/core/router.dart` |
| 主題／配色 | `app/lib/core/theme.dart`（seed color `0xFF00696D`） |
| enum 定義 | `app/lib/domain/models/enums.dart` |
| 計算引擎（測試重點） | `app/lib/domain/services/` |
| Drift 表定義 | `app/lib/data/db/tables.dart` |
| DB 與 seed | `app/lib/data/db/database.dart` |
| Repository | `app/lib/data/repositories/` |
| DI providers | `app/lib/data/providers.dart` |
| 各分頁畫面 | `app/lib/features/<name>/<name>_screen.dart` |
| 單元測試 | `app/test/domain/` |
| 產品／架構規格 | `spec/`（PLAN.md、01~03、adr/） |
