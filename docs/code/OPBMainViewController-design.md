# OPBMainViewController - 代码评审简报

## 文档信息
- 版本：v1.3
- 日期：2026-06-15

## 1. 概述

### 1.1 背景
对 `OPBMainViewController.swift` 登录页面进行 TDD 代码评审。

### 1.2 检查范围
`MSCustomAi/Classes/viewcontroller/OPBMainViewController.swift`

## 2. 问题清单

### 2.1 命名 & 结构规范

| 编号 | 问题 | 位置 | 说明 |
|------|------|------|------|
| Q-01 | `// MARK: - 生命周期-----` | 第18行 | 多余的 `-----` 后缀，标准格式为 `// MARK: - 生命周期` |
| Q-02 | `var infoLabel = UILabel()` | 第27行 | 声明在 `viewDidLoad()` 之后，规范要求普通变量在 `viewDidLoad()` 前声明 |

### 2.2 未找到的主题颜色

| 文件位置 | 问题 | 说明 |
|----------|------|------|
| OPBMainViewController.swift:134 | 在引用表中未找到颜色：`#098793` | infoLabel 背景色，已用 `ThemeColorPicker` 内联 |
| OPBMainViewController.swift:222 | 在引用表中未找到常量：`blackTheme101` | areaCodeLabel 文字色，疑似笔误（近似 `blackTheme85_01`?） |

### 2.3 合规项（通过）

| 检查项 | 状态 |
|--------|------|
| 继承 `OPBUIViewController` | ✅ |
| `setupUI/Layout/Action/Style` 方法完整 | ✅ |
| `deinit` 移除观察者 | ✅ |
| 懒加载使用 `it` 命名 | ✅ |
| 网络请求 `OPBNetworkManager.shared.start` 规范写法 | ✅ |
| `[weak self]` 防循环引用 | ✅ |
| 路由跳转 `OPNewRouterManager.openURL` | ✅ |
| 主题颜色使用 `theme_` 前缀 | ✅ |
| MARK 注释使用中文 | ✅ |
| SnapKit 约束顺序正确 | ✅ |
| SnapKit 使用 `leading/trailing` | ✅ |
| HUD 显示/隐藏成对调用 | ✅ |

## 附录

### 变更历史
| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-15 | 初版 |
| v1.1 | 2026-06-15 | 更新检查项 |
| v1.2 | 2026-06-15 | TDD 评审 |
| v1.3 | 2026-06-15 | 基于当前代码重新评审，新增 Q-01~Q-04 |
