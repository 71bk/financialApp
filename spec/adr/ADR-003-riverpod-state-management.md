# ADR-003: 使用 Riverpod 做狀態管理

- Status: Accepted
- Date: 2026-07-07
- Product: financialApp

## Context

dashboard（Safe-to-Spend、現金流投影）由資料庫內容衍生，資料一變畫面就要跟著變。
需要一個與 Drift 的 stream 整合順暢、可測試、一人維護得動的狀態管理方案。

## Decision

```text
狀態管理：flutter_riverpod
```

## Rationale

- `StreamProvider` 直接包 Drift reactive query，衍生值用 provider 組合，樣板最少
- 編譯期安全（相較 provider 的 runtime lookup）
- provider 可以在純 Dart 測試中 override，配合 domain 層單測策略
- 目前 Flutter 社群主流，資料與範例最多

## Consequences

正面：資料流單向清楚、測試容易。

代價：provider 組合有學習曲線；避免過度抽象——MVP 階段不上 code-gen 的
`riverpod_generator`，先用手寫 provider，需要時再引入（屆時更新本 ADR）。

## Alternatives Considered

### bloc

結構嚴謹但樣板量大，一人專案負擔過重。

### provider

Riverpod 的前身，官方也建議新專案用 Riverpod。

### GetX / signals

生態或成熟度不符長期維護需求。

## Implementation Notes

- providers 放在各 feature 資料夾內（`features/<name>/providers.dart`）
- widget 不直接開 DB；一律經 provider → repository

## Related Documents

- `spec/01-architecture.md`
- `spec/02-tech-stack.md`
