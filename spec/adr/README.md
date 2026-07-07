# 架構決策紀錄（ADR）

記錄 financialApp 決定了什麼、以及為什麼。格式沿用 CVita 的 ADR 模式。

## 狀態詞彙

- **Accepted**：目前有效的決策
- **Proposed**：討論中，尚未定案
- **Deprecated**：曾接受但不再建議
- **Superseded**：已被另一份 ADR 取代

## 紀錄

- `ADR-001-flutter-android-first.md` — Flutter，Android 優先
- `ADR-002-local-first-sqlite-drift.md` — local-first，SQLite（Drift），MVP 無帳號
- `ADR-003-riverpod-state-management.md` — Riverpod 狀態管理
- `ADR-004-ai-via-backend-proxy.md` — AI 經 thin proxy 呼叫 Claude API
- `ADR-005-backup-and-device-migration.md` — 備份與換機：OS 備份管道＋雙格式匯出

## 使用規則

改架構或實作重大功能前，先讀相關 ADR。
實作與已接受的 ADR 衝突時，新增一份 ADR 取代舊決策，不默默改方向。

新紀錄使用下一個流水號，包含：

```text
Status
Date
Context
Decision
Rationale
Consequences
Alternatives Considered
Implementation Notes
Related Documents
```
