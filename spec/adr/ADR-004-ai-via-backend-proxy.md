# ADR-004: AI 功能經 thin proxy 呼叫 Claude API

- Status: Accepted
- Date: 2026-07-07
- Product: financialApp

## Context

MVP 有兩個 AI 功能：自然語言記帳解析（「午餐 120」→ 結構化交易）與
AI 每月預算建議。皆使用 Claude API。API key 絕不能隨 App 發佈——
內嵌在 App 裡的 key 一定會被反編譯抽出並盜用。

## Decision

```text
Dogfood 階段：dev key 以 --dart-define 注入直連 Claude API（不進版控、不發佈）
公開 beta 前：必須上 thin proxy（Cloudflare Workers 或 Supabase Edge Function），
             key 只存在 proxy，附 rate limit
模型：NL 解析/分類用 claude-haiku-4-5；月度建議用 claude-sonnet-5
```

## Rationale

- dogfood 直連省一個部署件，最快開始驗證
- proxy 是發佈的硬條件不是選配：防 key 盜用、控成本、可集中換模型與調 prompt
- 便宜快的模型跑高頻小任務（解析），貴的模型跑低頻高價值任務（月報）

## Consequences

正面：key 安全、成本可控（估每活躍使用者每月數元台幣）。

代價：

- 公開前多一個部署件（Workers 免費額度足夠 beta）
- AI 功能需要網路；App 必須在 AI 不可用時完整可用
  （NL 解析 fallback 手動表單；月報顯示「暫無」）

## Alternatives Considered

### API key 內嵌 App

必被抽出盜刷，否決。

### 使用者自帶 key

體驗差，僅考慮做為進階選項，不是主路徑。

### 純本地規則解析（無 AI）

作為離線 fallback 保留（正規表達式抓金額），但分類品質不足以當主路徑。

## Implementation Notes

- App 端集中在 `data/ai/` 單一 client，切換直連/proxy 只改 base URL 與 header
- prompt 與輸出 JSON schema 契約寫入 `06-ai-spec.md`（撰寫中）
- proxy 上線時記錄用量（每 user 每日呼叫數）防濫用

## Related Documents

- `spec/01-architecture.md`
- `spec/06-ai-spec.md`（規劃中）
