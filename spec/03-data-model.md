# 03 資料模型

概念層定義。實際 Drift 資料表以此為準實作，欄位命名用 camelCase（Dart）/ snake_case（SQL）。

## 實體

### Profile（單列）

| 欄位 | 型別 | 說明 |
|---|---|---|
| occupation | String? | 職業（給 AI 建議用） |
| savingsRate | int? | 目標儲蓄率 %（可空，AI 可建議） |

收入不放這裡——收入是 `RecurringItem`（direction = income）。

### Category

| 欄位 | 型別 | 說明 |
|---|---|---|
| id | int PK | |
| name | String | |
| type | enum | expense / income |
| icon | String | icon 名稱 |
| isSystem | bool | 系統預設分類不可刪 |
| sortOrder | int | |

### RecurringItem（週期性收支——產品資料底座）

| 欄位 | 型別 | 說明 |
|---|---|---|
| id | int PK | |
| name | String | 例：Netflix、電話費、月薪 |
| direction | enum | income / expense |
| kind | enum | salary / bill / subscription / installment / other |
| amountType | enum | fixed / estimated（水電這類變動帳單用 estimated） |
| amount | int | 元；estimated 時為估計值 |
| cycle | enum | monthly / yearly / customDays |
| cycleInterval | int | 搭配 customDays，例：每 14 天 |
| anchorDay | int | 每月幾號（monthly）；月底溢出由 OccurrenceEngine 處理 |
| startDate / endDate | date / date? | endDate 空 = 持續中 |
| categoryId | FK | |
| paymentMethod | String? | 信用卡/轉帳/超商… |
| reminderType | enum | autoDebit（即將扣款通知）/ manualPay（繳費期限提醒）/ none |
| reminderLeadDays | int | 提前幾天提醒 |
| active | bool | 暫停不刪除 |
| **分期欄位**（kind = installment 才有） | | |
| installmentTotal | int? | 總期數 |
| installmentPaid | int? | 已繳期數（其餘為衍生值） |
| principal | int? | 本金總額 |
| totalInterest | int? | 總利息/手續費 → UI 顯示「多付多少」 |
| **訂閱欄位**（kind = subscription 才有） | | |
| trialEndDate | date? | 免費試用到期日（到期前提醒） |

### 次數型通行證（pass，Phase 2 預留，暫不實作）

健身房季票、溜冰「90 天 3000 元可用 30 次」這類「期限＋次數」的票。

- **MVP 記法**：現有 RecurringItem 就裝得下——kind = subscription、cycle = customDays（如 90）、
  reminderType = manualPay（到期前提醒續購）。現金流投影與提醒直接可用。
- **Phase 2 擴充**：
  - `RecurringKind` 增加 `pass`
  - RecurringItem 增加 `usageQuota`（int?，次數配額，例：30）
  - 新表 **PassUsage**（打卡紀錄）：id、recurringItemId FK、date、note?
- **衍生洞察**（AI 教練素材）：每次成本 = amount ÷ 已用次數；「還剩 X 次、Y 天」提醒；
  低使用率 → 閒置偵測（與 PLAN Phase 3 的訂閱閒置偵測同族）。

分類（category）不另立，記在娛樂／運動等既有分類即可。

### Transaction（變動收支）

| 欄位 | 型別 | 說明 |
|---|---|---|
| id | int PK | |
| date | date | |
| amount | int | 元 |
| direction | enum | income / expense |
| categoryId | FK | |
| note | String? | |
| source | enum | manual / nlParse / notification / csv / qr |
| dedupeFingerprint | String? | hash(date, amount, 來源特定 id)；自動來源用於去重 |
| recurringItemId | FK? | 由固定收支實現時回連（水電實際帳單校正估計值） |
| createdAt | datetime | |

### SavingGoal

| 欄位 | 型別 | 說明 |
|---|---|---|
| id / name / targetAmount | | |
| targetDate | date? | 有目標日 → 反推每月應存 |
| monthlyAmount | int? | 或直接指定每月存多少 |

## 核心計算（domain 層純 Dart，單元測試重點）

### OccurrenceEngine

把 RecurringItems 展開成日期區間內的「發生事件」清單。
規則：月底溢出取當月最後一天；分期到 `installmentTotal` 期滿自動結束；
estimated 金額若同期已有回連的實際 Transaction，以實際值取代。

### SafeToSpendCalculator

週期 = 發薪日到下一個發薪日（無薪資設定時退化為日曆月）。

```text
可自由花費 = 週期內定期收入
           − 週期內固定支出（含分期、估計帳單）
           − 儲蓄目標
今日可花   = (可自由花費 − 本週期已發生的變動支出) ÷ 週期剩餘天數
```

### CashflowProjection

未來 3–6 個月逐月：定期收入、固定支出、分期（標示哪個月結束）、
估計帳單、可自由花費。供 dashboard 圖表與購買決策模擬器（Phase 3）使用。

## 去重規則（Phase 2 前不實作，先留欄位）

自動來源（通知監聽/CSV）寫入前以 `dedupeFingerprint` 查重；
同日同金額不同來源視為疑似重複，進「待確認」而非直接丟棄。
