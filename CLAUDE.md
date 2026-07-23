# CLAUDE.md — financialApp 工作方式

> 最後更新：2026-07-23
> 事實（架構、技術棧、資料規則、地雷）看 **AGENTS.md**；本檔只講「怎麼工作」。
> 每次因專案特性犯錯，就把該地雷補進 AGENTS.md 第 8 節「最容易踩的地雷」。

---

## 1. 開始任務前的固定流程

1. 讀 **AGENTS.md**（尤其第 2 節現況、第 4 節分層、第 8 節地雷）。
2. 需要產品脈絡才讀 `spec/`：方向看 `PLAN.md`，動計算／資料看 `03-data-model.md` 與相關 ADR。
3. `git status` 看有無未提交變更，不要覆蓋。
4. 動手前確認要碰的東西「是否已存在」——AGENTS.md 第 2 節標 ❌ 的（AI client、通知排程、CashflowProjection、多數 repository）目前是空的，是新建不是修改。

## 2. 先規劃再動手（碰到這些先講計畫再改）

```
碰到以下 → 先提 3~5 行計畫與風險，等使用者確認：
  • 改 Drift schema / migration（牽動 schemaVersion + 資料）
  • 動 enum 順序或既有欄位語意
  • AI 呼叫 / API key 相關（ADR-004）
  • 部署、上架設定（applicationId、minSdk、簽章）
  • 換套件或改架構（要先寫新 ADR）
其餘一般功能 → 直接做，做完照第 4 節回報。
```

## 3. Self-review 清單（回報前逐項過）

1. 有沒有改到任務外的檔案？
2. 跨層是否一致：domain 改了，data 的 Row 轉換（`_toDomain`/`_toCompanion`）跟 presentation 有沒有同步？
3. domain 層有沒有不小心 import 到 Drift／Flutter？
4. 動了 schema：`schemaVersion` +1 了嗎？migration 補了嗎？`build_runner build` 跑了嗎？
5. 動了 enum：是不是只在**尾端 append**，沒有重排？
6. 金額有沒有誤用 double？（一律 int）
7. 該跑的 `flutter analyze` / `flutter test` 跑了嗎？
8. 值得回寫 AGENTS.md 的新地雷有嗎？

## 4. 回報格式

```
## 改了什麼
- （一句話總結）

## 改了哪些檔
- app/lib/...（每檔一行，說明用途）

## 驗證
- flutter analyze：<結果>
- flutter test：<結果，幾個過>
- （動過 schema）build_runner build：<結果>

## 剩餘風險 / 未完成
- （沒有就寫「無」）
```

## 5. 各類檔案修改規則

### domain 層（`lib/domain/`）
- 純 Dart，**零 Flutter／Drift import**。加計算邏輯優先放這裡並補 `test/domain/` 測試。
- 日期溢出、期數推導這類邏輯集中在既有 service，不要在畫面或 repository 重寫。

### data 層（`lib/data/`）
- 改表 → 改 `tables.dart` → `schemaVersion` +1 → 補 migration → `dart run build_runner build`。
- **不手改 `database.g.dart`**。
- repository 是 Row ↔ domain 的唯一轉換點；新增欄位時 `_toDomain` 與 `_toCompanion` 都要補。

### presentation 層（`lib/features/`）
- 只透過 provider → repository 取資料，**不直接開 DB、不 import Drift**。
- 目前多數畫面是佔位（見 AGENTS.md 第 2 節）；把佔位換成真畫面時，資料一律走 `StreamProvider` 包 Drift reactive query（參考 `features/recurring/providers.dart`）。
- UI 文案用繁體中文；金額顯示帶 `NT$`。

### 驗證（本機無 Android SDK）
- 只能 `flutter analyze` + `flutter test`，**跑不了 App 畫面**。UI 改動無法目視驗證，回報時要誠實說明「已通過 analyze/test，但未在裝置上實跑」。

## 6. 不要做的事

- 沒被要求就 commit／push／deploy。
- 為修小 bug 做大重構、改名、排版。
- 引入新依賴或新架構（Riverpod／Drift／go_router／local-first 都是 ADR 定案，要改先寫 ADR）。
- 動 schema 卻不配 migration；手改 `*.g.dart`；重排 enum。
- 把 API key 寫進 App／版控。
- 加 i18n／多語系、多幣別、double 金額（明確不做）。

## 7. 這個專案目前最容易誤判的點

1. **多數畫面是空殼**——「接上現金流投影」不是接現成的，`CashflowProjection` 還沒寫，要新建。動手前先確認目標物存不存在。
2. **domain 模型 ≠ Drift Row**：`RecurringItem`（domain）和 `RecurringItemRow`（Drift）是兩個型別，別在 presentation 直接用 Row。
3. **enum 用 int index 存 DB**：在中間插值或重排會位移既有資料語意，只能尾端 append。
4. **改 Drift 表是連鎖動作**：schemaVersion +1 → migration → `build_runner build`，缺一就崩或掉資料。
5. **`sqlparser` 釘死 0.44.5**，別「順手升級依賴」把它動掉（會讓產碼掛掉）。
6. **AI 尚未實作**，且 key 一律走 proxy、不進 App（ADR-004）——別圖方便把 key 內嵌或直連。
7. **spec 不等於現況**：spec 是設計意圖，程式碼才是現況（例：spec 描述的 `CashflowProjection`、AI client、通知排程都還沒實作）。以程式碼為準，發現 spec 與程式碼對不上就回報，別默默照 spec 假設。
