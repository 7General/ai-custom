# 代码-设计一致性检查报告

## 文档信息

| 项目 | 内容 |
|------|------|
| 检查时间 | 2026-06-16 |
| 版本 | v2.0（基于 v1.0 增量更新） |
| 设计文档 | `docs/code/OPBMainViewController-design.md` (v1.3) |
| API文档 | `docs/api/login-api.md` |
| 扫描文件 | `viewcontroller/OPBMainViewController.swift`、`service/OPBLoginRequest.swift`、`entity/OPBLoginResponse.swift` |

---

## 1. 总体一致性评分

| 检查维度 | 一致率 | 评级 | v1.0 → v2.0 |
|---------|-------|------|------------|
| 功能一致性（F1-F7） | 6/7（86%） | ⚠ 基本一致 | 无变化 |
| 模块对应性 | 3/3（100%） | ✅ 一致 | 无变化 |
| 接口对应性 | 1/1（100%） | ✅ 一致 | 无变化 |
| 数据模型对应性 | 3/3 字段，类型偏差 | ⚠ 基本一致 | 无变化 |
| 代码规范一致性 | 9/10（90%） | ⚠ 基本一致 | ↑ 提升（C-02 已修复） |
| 代码真实存在性 | 阻断性问题存在（`blackTheme101`） | ❌ | B-01 仍未修复 |
| **综合评级** | | **❌ 不通过** | 无变化 |

---

## 2. 本次变更验证

| 变更 | 位置 | 规范要求 | 状态 |
|-----|------|---------|------|
| `// MARK: - 生命周期-----` → `// MARK: - 生命周期` | `:18` | MARK 格式不含多余字符 | ✅ 已修复（C-02） |

---

## 3. 功能一致性详情

| 编号 | 设计功能 | 代码实现位置 | 状态 | 说明 |
|-----|---------|-------------|------|------|
| F1 | 页面顶部展示 App Logo | `OPBMainViewController.swift:204-209` | ⚠ | `logoImageView` 存在但未设置图片名（TODO 占位） |
| F2 | 手机号输入框，左侧固定 +86 | `OPBMainViewController.swift:218-225` | ✅ | `areaCodeLabel.text="+86"` 正确 |
| F3 | 密码输入框，默认隐藏，支持切换 | `OPBMainViewController.swift:249-263` | ✅ | `isSecureTextEntry=true`，切换正常 |
| F4 | 登录按钮，两项不为空才可点击 | `OPBMainViewController.swift:192-196` | ✅ | `updateLoginButtonState()` 逻辑正确 |
| F5 | 忘记密码路由跳转 | `OPBMainViewController.swift:172-174` | ✅ | `openURL("opay://forgot_password")` 正确 |
| F6 | 登录成功存 token，跳转首页 | `OPBMainViewController.swift:163-165` | ✅ | `opb_login_token`/`opb_login_userId`，`opay://home` |
| F7 | 登录失败展示 Toast | `OPBMainViewController.swift:167-168` | ✅ | `showHUDText(entity.errorMessage)` |

**一致率：6/7（86%）**

---

## 4. 接口对应详情

| 设计接口 | 代码位置 | 请求参数 | 状态 |
|---------|---------|---------|------|
| POST `/api/v1/user/login` | `OPBLoginRequest.swift:7-8` | phone, password ✅ | ✅ 完全对应 |

**一致率：1/1（100%）**

---

## 5. 数据模型对应详情

| 设计字段 | 设计类型 | 代码字段 | 代码类型 | 状态 |
|---------|---------|---------|---------|------|
| `token` | `String?` | `token` | `String = ""` | ⚠ 类型不匹配 |
| `userId` | `String?` | `userId` | `String = ""` | ⚠ 类型不匹配 |
| `expireTime` | `Int?` | `expireTime` | `Int = 0` | ⚠ 类型不匹配 |

> 字段名全部正确，类型可选性存在偏差，不影响功能运行。

---

## 6. 代码规范一致性检查

| 编号 | 规范要求 | 代码现状 | 位置 | 状态 |
|-----|---------|---------|------|------|
| R-01 | 普通变量在 `viewDidLoad()` 前声明 | `var infoLabel` 在 `viewDidLoad()` 之后 | `:27` | ❌ |
| R-02 | MARK 格式 `// MARK: - 名称` | `// MARK: - 生命周期` | `:18` | ✅ 已修复 |
| R-03 | 继承 `OPBUIViewController` | ✅ | `:16` | ✅ |
| R-04 | `setupUI/Layout/Action/Style` 完整 | ✅ 四个方法均存在 | `:40-136` | ✅ |
| R-05 | `deinit` + `removeObserver` | ✅ | `:29-32` | ✅ |
| R-06 | 懒加载闭包用 `it` | ✅ 全部使用 | `:204-281` | ✅ |
| R-07 | 无 `_` 开头变量/方法 | ✅ | — | ✅ |
| R-08 | 路由 `OPNewRouterManager.openURL` | ✅ | `:165,173` | ✅ |
| R-09 | 主题颜色 `theme_` 前缀 | ✅ | — | ✅ |
| R-10 | SnapKit 使用 `leading/trailing` | ✅ | `:54-119` | ✅ |

**规范一致率：9/10（90%）**

---

## 7. 未找到的主题颜色

| 文件位置 | 颜色/常量 | 说明 | 状态 |
|---------|---------|------|------|
| `:134` | `#098793` | infoLabel 背景色，inline 临时处理，暗黑值未定 | ⚠ 待补充常量 |
| `:222` | `MSThemeHelper.blackTheme101` | MSThemeHelper 中不存在 | ❌ 编译报错 |

---

## 8. 问题汇总

### 🔴 阻断性问题（必须修复）

| 编号 | 问题 | 位置 | 修复建议 |
|-----|------|------|---------|
| B-01 | `MSThemeHelper.blackTheme101` 不存在，编译失败 | `:222` | 改为 `blackTheme85_01` 或补充新常量 |

### 🟡 一般问题（建议修复）

| 编号 | 问题 | 位置 | 状态 |
|-----|------|------|------|
| C-01 | `var infoLabel` 声明在 `viewDidLoad()` 之后 | `:27` | ❌ 未修复 |
| C-02 | MARK 格式多余 `-----` | `:18` | ✅ 已修复 |
| C-03 | Logo 图片名 TODO 占位 | `:207` | ❌ 未修复 |
| C-04 | `#098793` 未定义为语义化颜色常量 | `:134` | ❌ 未修复 |
| C-05 | `OPBLoginResponse` 字段类型可选性差异 | `OPBLoginResponse.swift` | ❌ 未修复 |

---

## 9. 功能-代码映射清单

### F1：页面顶部 Logo
- **文件**：`OPBMainViewController.swift`
- **懒加载**：`logoImageView`（第 204-209 行）
- **布局**：`setupLayout()` 第 55-59 行
- **⚠ 图片名未设置（TODO 占位）**

### F2：手机号输入框
- **组件**：`phoneContainerView`、`areaCodeLabel`（+86）、`phoneSeparatorView`、`phoneTextField`
- **懒加载**：第 211-240 行 / **布局**：第 61-84 行

### F3：密码输入框
- **组件**：`passwordContainerView`、`passwordTextField`、`togglePasswordButton`
- **懒加载**：第 242-263 行 / **切换逻辑**：`didTapTogglePassword()` 第 176-180 行

### F4：登录按钮状态控制
- **核心方法**：`updateLoginButtonState()` 第 192-196 行
- **触发**：`textFieldDidChange()` 第 182-184 行 + `setupStyle()` 初始化

### F5：忘记密码跳转
- **方法**：`didTapForgotPassword()` 第 172-174 行 / **路由**：`opay://forgot_password`

### F6：登录成功处理
- **方法**：`didTapLogin()` 第 144-170 行
- **存储**：第 163-164 行（UserDefaults）/ **跳转**：第 165 行（`opay://home`）

### F7：登录失败 Toast
- **实现**：`didTapLogin()` 第 167-168 行 / `view.showHUDText(entity.errorMessage)`

---

## 附录 - 变更历史

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-16 | 初版一致性检查 |
| v2.0 | 2026-06-16 | 增量更新：C-02 已修复，B-01 仍阻断 |
