/// 收支方向。
enum EntryDirection { income, expense }

/// 週期性收支的種類。
enum RecurringKind { salary, bill, subscription, installment, other }

/// 金額性質：固定（房租、訂閱）或估計（水電這類變動帳單）。
enum AmountType { fixed, estimated }

/// 重複週期。
enum Cycle { monthly, yearly, customDays }

/// 提醒型態：即將自動扣款 / 記得去繳費 / 不提醒。
enum ReminderType { autoDebit, manualPay, none }

/// 變動收支的資料來源。
enum TransactionSource { manual, nlParse, notification, csv, qr }
