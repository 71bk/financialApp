# ADR-002: Local-first，SQLite（Drift），MVP 無帳號

- Status: Accepted
- Date: 2026-07-07
- Product: financialApp

## Context

財務資料高度敏感。MVP 的目標是驗證留存，不是營運服務；在驗證成功前
維運後端資料庫、帳號系統與個資保護責任都是負擔。dashboard 需要資料
變動時即時反應（新增訂閱 → Safe-to-Spend 立刻更新）。

## Decision

```text
資料儲存：裝置本機 SQLite，使用 Drift（+ drift_flutter）
帳號系統：MVP 不做（無註冊、無登入）
備份：CSV/JSON 匯出與匯入
```

## Rationale

- 隱私是可以行銷的賣點：「你的財務資料不離開你的手機」
- 完全離線可用，沒有伺服器成本與個資外洩面
- Drift 提供型別安全與 reactive queries（stream），天然驅動 Riverpod providers
- 現金流計算需要 SQL 等級的聚合查詢能力

## Consequences

正面：零後端維運、開發速度快、隱私敘事強。

代價：

- 換機/刪 App 會遺失資料 → 以匯出/匯入緩解，onboarding 要提醒
- 不支援多裝置同步 → 驗證成功後再做雲端同步（屆時需帳號，另立 ADR）
- 資料表 schema 遷移要靠 Drift migration 紀律，第一天就開 schemaVersion

## Alternatives Considered

### Supabase / Firebase cloud-first

同步免費拿到，但 MVP 就背上 auth、個資責任與費用；驗證失敗時全是沉沒成本。

### Isar

效能好但專案維護狀況有疑慮，長期風險高。

### Hive / shared_preferences

鍵值儲存，撐不起聚合查詢與關聯。

## Implementation Notes

- 金額存 int（新台幣元）；日期存 UTC epoch
- domain 層不 import Drift 型別，由 repository 轉換
- 匯出功能列入 Phase 1 尾段（信任感 + 備份一次滿足）

## Related Documents

- `spec/01-architecture.md`
- `spec/03-data-model.md`
