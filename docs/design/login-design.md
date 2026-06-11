# 登录页面 - 技术设计文档

## 文档信息
- 版本：v1.0
- 日期：2026-06-11
- 状态：已批准

---

## 1. 概述

### 1.1 背景
将 `OPBMainViewController` 改造为登录页面，提供手机号 + 密码的登录入口。

### 1.2 目标
- 用户输入中国手机号和密码完成登录
- 登录成功后存储 token 并跳转首页

### 1.3 范围
- 登录页 UI 改造
- 登录网络请求封装
- token 本地持久化

---

## 2. 需求分析

### 2.1 功能需求

| # | 需求描述 |
|---|---------|
| F1 | 页面顶部展示 App Logo |
| F2 | 手机号输入框，左侧固定显示 `+86` |
| F3 | 密码输入框，默认隐藏，支持明文切换 |
| F4 | 登录按钮，手机号和密码均不为空时才可点击 |
| F5 | 忘记密码文字按钮，路由跳转到找回密码页 |
| F6 | 登录成功存储 token 至 UserDefaults，跳转首页 |
| F7 | 登录失败展示错误 Toast |

### 2.2 非功能需求
- 区号固定 +86，不支持多国选择
- 登出时需清除 token（不在 UserDefaults 白名单）

### 2.3 验收条件

```
GIVEN 用户进入登录页
WHEN 手机号或密码任意一项为空
THEN 登录按钮置灰不可点击

GIVEN 用户填写完手机号和密码
WHEN 点击登录按钮
THEN 发起登录网络请求，按钮显示 Loading 状态

GIVEN 登录请求返回成功
WHEN 收到有效 token
THEN 使用 UserDefaults 存储 token，路由跳转首页

GIVEN 登录请求返回业务错误
WHEN 如手机号或密码错误
THEN Toast 展示服务端错误信息，停留登录页

GIVEN 用户登出
WHEN 清除缓存
THEN token 从 UserDefaults 中清除
```

---

## 3. 架构设计

### 3.1 模块划分

```
OPBMainViewController（viewcontroller/）
    ├── setupUI()       — 添加 logoImageView、phoneField、passwordField、loginButton、forgotButton
    ├── setupLayout()   — SnapKit 约束
    ├── setupAction()   — 按钮事件、输入框 editingChanged 监听
    └── setupStyle()    — SwiftTheme 主题适配

OPBLoginRequest（service/）
    └── POST /api/v1/user/login

OPBLoginResponse（entity/）
    └── token、userId、expireTime
```

### 3.2 路由
- 登录页注册：`opay://login`
- 忘记密码跳转：`opay://forgot_password`（push）
- 登录成功跳转：`opay://home`（push）

---

## 4. 接口设计

### POST `/api/v1/user/login`

**请求参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `phone` | String | 是 | 手机号（不含区号） |
| `password` | String | 是 | 密码 |

**请求示例**
```json
{
  "phone": "13800138000",
  "password": "123456"
}
```

**响应示例**
```json
{
  "code": 0,
  "message": "success",
  "data": {
    "token": "eyJ...",
    "userId": "usr_123",
    "expireTime": 3600
  }
}
```

**错误码**

| code | 说明 |
|------|------|
| 0 | 成功 |
| 1001 | 手机号不存在 |
| 1002 | 密码错误 |
| 1003 | 账号已被禁用 |

---

## 5. 数据模型

### OPBLoginResponse（entity/OPBLoginResponse.swift）

| 字段 | 类型 | 说明 |
|------|------|------|
| `token` | `String?` | 登录令牌 |
| `userId` | `String?` | 用户 ID |
| `expireTime` | `Int?` | 过期时长（秒） |

### UserDefaults Key

| Key | 说明 | 登出清除 |
|-----|------|---------|
| `opb_login_token` | 登录 token | 是（不在白名单） |
| `opb_login_userId` | 用户 ID | 是（不在白名单） |

---

## 6. 风险与依赖

### 6.1 外部依赖
- `OPRouter` — 路由跳转
- `SnapKit` — 布局约束
- `SwiftTheme` — 主题适配

### 6.2 待确认
- 忘记密码路由 key 由宿主 App 提供
- 首页路由 key 由宿主 App 提供

---

## 附录

### 变更历史
| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-11 | 初版 |
