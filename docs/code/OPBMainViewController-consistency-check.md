# OPBMainViewController - 代码一致性检查报告

## 文档信息
- 版本：v1.0
- 日期：2026-06-16
- 设计文档：`docs/design/login-design.md`
- API 文档：`docs/api/login-api.md`
- 代码评审简报：`docs/code/OPBMainViewController-code-review.md`
- 代码扫描范围：`MSCustomAi/Classes/`
- 扫描文件：`OPBMainViewController.swift` / `OPBLoginRequest.swift` / `OPBLoginResponse.swift`

---

## 1. 总体评分

| 检查维度 | 结果 | 评级 |
|---------|------|------|
| 功能一致性（F1-F7） | 6 / 7（86%） | ⚠ 基本一致 |
| 模块对应性 | 3 / 4（75%） | ⚠ 基本一致 |
| 接口对应性 | 1 / 1（100%） | ✓ 一致 |
| 数据模型对应性 | 3 / 3（100%） | ✓ 一致 |
| 代码真实存在性 | 存在阻断性问题 | ✗ 不通过 |
| **综合评级** | | **✗ 不通过** |

> 存在 1 个阻断性问题（`infoLabel` 未声明导致编译失败），必须修复后才能继续。

---

## 2. 功能一致性详情（F1–F7）

| 编号 | 设计功能 | 代码实现位置 | 状态 | 说明 |
|-----|---------|-------------|------|------|
| F1 | 顶部展示 App Logo | `OPBMainViewController.swift:200-205`（`logoImageView`） | ✓ | 图片名为 TODO，不影响结构 |
| F2 | 手机号输入框 + 左侧 `+86` 区号 | `:214-221`（`areaCodeLabel`）/ `:229-236`（`phoneTextField`） | ✓ | |
| F3 | 密码输入框默认隐藏 + 明文切换 | `:245-252`（`isSecureTextEntry=true`）/ `:172-176`（`didTapTogglePassword`） | ✓ | |
| F4 | 登录按钮非空才可点击 | `:188-192`（`updateLoginButtonState`） | ✓ | |
| F5 | 忘记密码按钮路由跳转 | `:168-170`（`didTapForgotPassword` → `opay://forgot_password`） | ✓ | |
| F6 | 登录成功存 token + 跳转首页 | `:159-161`（UserDefaults + `opay://home`） | ✓ | |
| F7 | 登录失败展示错误 Toast | `:163`（`showHUDText(entity.errorMessage)`） | ✓ | |

### 验收条件差异（未完全实现）

> 设计文档 `2.3 验收条件`：
> "WHEN 点击登录按钮 THEN 发起登录网络请求，**按钮显示 Loading 状态**"

当前代码仅调用 `view.showHUDIndicatorAtCenter()`，`loginButton` 在请求过程中未置为禁用状态，用户可重复点击触发多次请求。

---

## 3. 模块对应详情

| 设计模块 | 设计目录 | 文件是否存在 | 状态 |
|---------|---------|-------------|------|
| `OPBMainViewController` | `viewcontroller/` | ✓ | 一致 |
| `OPBLoginRequest` | `service/` | ✓ | 一致 |
| `OPBLoginResponse` | `entity/` | ✓ | 一致 |
| 路由注册（`opay://login`） | `router/` | ✗ 目录不存在 | 缺失 |

---

## 4. 接口对应详情

| 设计接口 | 请求参数 | 代码位置 | 状态 |
|---------|---------|---------|------|
| POST `/api/v1/user/login` | phone, password | `OPBLoginRequest.swift:7-9` | ✓ 完全对应 |

```swift
// OPBLoginRequest.swift:7
override func requestUrl() -> String {
    return "/api/v1/user/login"   // ✓ 与设计一致
}
```

---

## 5. 数据模型对应详情

### OPBLoginResponse（`entity/OPBLoginResponse.swift`）

| 设计字段 | 设计类型 | 代码字段 | 代码类型 | 状态 |
|---------|---------|---------|---------|------|
| `token` | `String?` | `token` | `String`（默认 `""`） | ⚠ 类型不一致 |
| `userId` | `String?` | `userId` | `String`（默认 `""`） | ⚠ 类型不一致 |
| `expireTime` | `Int?` | `expireTime` | `Int`（默认 `0`） | ⚠ 类型不一致 |

> 字段均存在，但设计定义为可选类型，代码使用非可选 + 默认值方案，功能等效，不影响运行。

### UserDefaults Key

| 设计 Key | 数据来源 | 登出清除 | 代码实现 | 状态 |
|---------|---------|---------|---------|------|
| `opb_login_token` | `entity.token` | 是 | `OPBMainViewController.swift:159` | ✓ |
| `opb_login_userId` | `entity.userId` | 是 | `:160` | ✓ |

> `expireTime` 字段存在于模型中但未被存储，设计未要求存储，属正常。

---

## 6. 代码真实存在性检查

### 文件存在性

| 文件路径 | 是否存在 |
|---------|---------|
| `Classes/viewcontroller/OPBMainViewController.swift` | ✓ |
| `Classes/service/OPBLoginRequest.swift` | ✓ |
| `Classes/entity/OPBLoginResponse.swift` | ✓ |
| `Classes/router/`（路由注册） | ✗ |

### 属性/方法存在性

| 符号 | 代码位置 | 状态 |
|-----|---------|------|
| `setupUI()` | `:40` | ✓ |
| `setupLayout()` | `:54` | ✓ |
| `setupAction()` | `:118` | ✓ |
| `setupStyle()` | `:126` | ✓ |
| `didTapLogin()` | `:140` | ✓ |
| `didTapForgotPassword()` | `:168` | ✓ |
| `didTapTogglePassword()` | `:172` | ✓ |
| `updateLoginButtonState()` | `:188` | ✓ |
| `infoLabel` | 未声明 | **✗ 阻断** |

---

## 7. 问题汇总

### 阻断性问题（必须修复）

| 编号 | 问题 | 位置 | 修复建议 |
|-----|------|------|---------|
| C-01 | `infoLabel` 在 `setupStyle()` 中使用，但从未声明为属性，导致编译失败 | `:130` | 在懒加载 extension 中补充声明，在 `setupUI()` 中 addSubview，在 `setupLayout()` 中添加约束 |

### 一般问题（建议修复）

| 编号 | 问题 | 位置 | 修复建议 |
|-----|------|------|---------|
| C-02 | 登录请求发起后 `loginButton` 未禁用，用户可重复点击 | `:144` | 请求前 `loginButton.isEnabled = false`，回调中恢复 |
| C-03 | `opay://login` 路由未注册，`router/` 目录不存在 | 缺失 | 在 `router/` 下新增路由注册文件 |

---

## 8. 功能-代码映射清单

| 设计功能 | 文件 | 函数/属性 | 行号 |
|---------|------|----------|------|
| F1 App Logo | OPBMainViewController.swift | `logoImageView` | 200–205 |
| F2 手机号输入 + 区号 | OPBMainViewController.swift | `areaCodeLabel`, `phoneTextField` | 214–236 |
| F3 密码输入 + 切换明文 | OPBMainViewController.swift | `passwordTextField`, `didTapTogglePassword` | 245–252, 172–176 |
| F4 登录按钮状态控制 | OPBMainViewController.swift | `updateLoginButtonState` | 188–192 |
| F5 忘记密码跳转 | OPBMainViewController.swift | `didTapForgotPassword` | 168–170 |
| F6 登录成功存储 + 跳转 | OPBMainViewController.swift | `didTapLogin` | 159–161 |
| F7 登录失败 Toast | OPBMainViewController.swift | `didTapLogin` | 163 |
| 接口 POST /api/v1/user/login | OPBLoginRequest.swift | `requestUrl()` | 7–9 |
| 响应模型 token/userId/expireTime | OPBLoginResponse.swift | class OPBLoginResponse | 3–7 |

---

## 附录

### 变更历史
| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-16 | 初版 |
