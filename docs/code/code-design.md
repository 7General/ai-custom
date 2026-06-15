# OPBMainViewController 代码检查报告

## 文档信息
- 版本：v1.1
- 日期：2026-06-15

## 1. 概述

### 1.1 背景
对 `OPBMainViewController.swift` 登录页面进行编码规范检查。

### 1.2 检查范围
`MSCustomAi/Classes/viewcontroller/OPBMainViewController.swift`

## 2. 检查结果

### 2.1 命名规范

| 问题 | 位置 | 说明 |
|------|------|------|
| `var __go:String = ""` | 第21行 | 变量名以下划线 `_` 开头，违反命名规范 |
| `func __ttt()` | 第23行 | 方法名以下划线 `_` 开头，违反命名规范 |
| `var __go` 声明位置 | 第21行 | 普通变量应在 `viewDidLoad()` 之前声明 |

### 2.2 主题颜色适配

| 问题 | 位置 | 说明 |
|------|------|------|
| `setTitleColor(.white, for: .normal)` | 第258行 loginButton 懒加载 | 直接使用 `UIColor.white`，未使用 `theme_` 前缀，不支持暗黑适配。应改用 `it.theme_setTitleColor(MSThemeHelper.mainWhite, forState: .normal)` |

### 2.2.1 未找到的主题颜色

| 文件位置 | 问题 | 说明 |
|----------|------|------|
| `Classes/viewcontroller/OPBMainViewController.swift` | 在引用表中未找到颜色：`#098793` | infoLabel 背景色，已使用 `ThemeColorPicker` 内联，建议补充到 MSThemeHelper |

### 2.3 SnapKit 约束顺序

规范要求：top → leading → bottom → trailing → center → width → height

| 问题 | 位置 | 当前顺序 | 正确顺序 |
|------|------|----------|----------|
| `phoneTextField` 约束 | 第77-81行 | leading → trailing → top → bottom | top → leading → bottom → trailing |
| `passwordTextField` 约束 | 第89-92行 | leading → trailing → top → bottom | top → leading → bottom → trailing |

### 2.4 MARK 分组

| 问题 | 位置 | 说明 |
|------|------|------|
| 主类体缺少 MARK 注释 | 第12-31行 | 属性区域缺少 `// MARK: - 属性`，生命周期缺少 `// MARK: - 生命周期` |

### 2.5 合规项（通过）

- ViewController 继承 `OPBUIViewController` ✅
- `setupUI()` / `setupLayout()` / `setupAction()` / `setupStyle()` 方法完整 ✅
- `deinit` 已添加 ✅
- 懒加载使用 `it` 命名临时对象 ✅
- 网络请求使用 `OPBNetworkManager.shared.start` 规范写法 ✅
- 路由跳转使用 `OPNewRouterManager.openURL` ✅
- 主题颜色大部分属性使用 `theme_` 前缀 ✅
- MARK 注释使用中文 ✅
- SnapKit 使用 `leading/trailing`（非 left/right） ✅
