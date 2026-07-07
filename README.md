# financialApp

**訂閱與分期的未來現金流規劃器——AI 財務教練。**

不是又一個記帳 App：發薪日那一刻就告訴你，這個月的錢會怎麼被固定支出吃掉、
今天還能花多少（Safe-to-Spend）。記帳只是餵資料的手段，規劃才是產品。

## Repo 結構

```text
financialApp/
├── spec/          規格文件（產品計畫、架構、資料模型）與 ADR
│   └── adr/       架構決策紀錄
├── app/           Flutter App（package: financial_app）
└── server/        （未來）AI thin proxy，公開 beta 前建立
```

## 開始開發

前置需求：

1. Flutter SDK（stable）：位於 `D:\flutter`，把 `D:\flutter\bin` 加入 PATH
2. Android Studio（含 Android SDK）——用來跑模擬器與組建 APK

```powershell
cd app
flutter pub get
flutter run          # 需要已連接裝置或模擬器
flutter test         # domain 層單元測試
flutter analyze
```

## 文件入口

- 產品方向：`spec/PLAN.md`
- 架構與技術：`spec/01-architecture.md`、`spec/02-tech-stack.md`、`spec/03-data-model.md`
- 決策紀錄：`spec/adr/README.md`

改架構前先讀相關 ADR；與 ADR 衝突的實作，請新增 ADR 取代舊決策。

## 目前狀態

Phase 1（MVP）骨架建立中。功能藍圖與驗證指標見 `spec/PLAN.md`。
