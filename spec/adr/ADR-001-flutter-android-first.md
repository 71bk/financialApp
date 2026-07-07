# ADR-001: 使用 Flutter，Android 優先

- Status: Accepted
- Date: 2026-07-07
- Product: financialApp

## Context

financialApp 是「UI 密集＋通知密集」的行動 App：自訂儀表板與圖表（現金流投影、
Safe-to-Spend 大數字）、準時的排程提醒（扣款/繳費）是產品命脈。Phase 2 需要
Android 通知監聽（NotificationListenerService）做自動記帳。一人開發，長期維護
成本重要。開發者背景偏 Vue/Vite（非 React）。

## Decision

```text
App 框架：Flutter（stable channel）+ Dart 3
首發平台：Android（minSdk 26）
iOS：第二波，以捷徑（Apple Pay 交易觸發、Siri）補自動記帳
```

## Rationale

- `flutter_local_notifications` 是行動生態最成熟的本機排程通知方案，直接命中留存命脈
- 自訂 UI 與圖表是 Flutter 強項，跨裝置渲染一致
- 通知監聽需要原生程式碼，Flutter platform channel 的補洞路徑比 React Native 跳出 Expo 生態單純
- 一人專案的隱形成本在升級維護：Flutter 依賴地獄明顯少於 React Native
- 開發者不熟 React，React Native 唯一的決定性優勢不存在

## Consequences

正面：單一 codebase、通知與圖表基礎穩、維護省心。

代價：

- 需要學 Dart（估一至兩週上手）
- 未來若要 Web 版，Flutter Web 不如 react-native-web 順（Web 版不在藍圖，接受）
- iOS 自動記帳體驗先天弱於 Android（平台限制，與框架無關）

## Alternatives Considered

### React Native + Expo

JS 背景可沿用生態，但通知監聽需退出 Expo 託管流程、版本升級歷來痛苦，
且開發者不熟 React，學習成本與 Flutter 相當。

### 原生 Kotlin（Android only）

系統整合最強，但 iOS 要整套重寫，一人負擔不起。

### PWA

無法做排程通知與通知監聽，直接出局。

## Implementation Notes

- Flutter SDK 安裝於 `D:\flutter`（git clone stable，`flutter upgrade` 升級）
- App 專案位於 repo 的 `app/`，套件名 `financial_app`
- applicationId 先用佔位 `com.financialapp.app`，上架前定案

## Related Documents

- `spec/02-tech-stack.md`
- `spec/PLAN.md`（四、技術方向）
