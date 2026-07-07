# financialApp 規格文件

產品：**financialApp**（暫名）
定位：**訂閱與分期的未來現金流規劃器——AI 財務教練**

本目錄包含產品、架構與實作規格。文件架構參考 CVita 的「編號規格 ＋ ADR」模式，
但配合一人開發的規模精簡，文件隨需要增加，不預先寫滿。

## 文件索引

### 產品

- `PLAN.md` — 產品計畫書：定位、功能藍圖（Phase 1–3）、風險、驗證指標

### 架構與實作

- `01-architecture.md` — 系統架構：local-first、分層、AI 呼叫路徑
- `02-tech-stack.md` — 技術選型與套件清單
- `03-data-model.md` — 資料模型與核心計算邏輯

### 規劃中（尚未撰寫，動工前補）

- `04-notifications-spec.md` — 扣款/繳費提醒的排程規則
- `05-safe-to-spend-spec.md` — Safe-to-Spend 與現金流投影的完整公式與邊界案例
- `06-ai-spec.md` — AI 輸入/輸出契約（NL 記帳解析、月度建議）
- `07-input-pipeline-spec.md` — Phase 2 輸入管線（通知監聽、CSV、QR）

### 架構決策紀錄

- `adr/README.md` — ADR 索引與撰寫規則
- `adr/ADR-001` ～ `ADR-005` — 已接受的決策

## 閱讀指引

- 產品方向：先讀 `PLAN.md`
- 寫程式前：讀 `01`、`02`、`03` 與相關 ADR
- 改架構或換套件：先讀 `adr/README.md`，新增 ADR 取代舊決策，不默默改方向

文件衝突時，以較具體的文件為準，並在動工前把最終結論寫回文件。
