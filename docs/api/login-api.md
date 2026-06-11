# 登录 API 接口文档

## 文档信息
- 版本：v1.0
- 日期：2026-06-11
- 状态：已确认

---

## 接口列表

| # | 方法 | 路径 | 说明 |
|---|------|------|------|
| 1 | POST | `/api/v1/user/login` | 用户登录 |

---

## 接口详情

### POST `/api/v1/user/login`

用户使用手机号 + 密码登录，返回登录令牌。

#### 请求头

| 字段 | 值 |
|------|----|
| `Content-Type` | `application/json` |

#### 请求参数

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| `phone` | String | 是 | 手机号（不含区号，中国手机号 11 位） |
| `password` | String | 是 | 登录密码 |

#### 请求示例

```json
{
  "phone": "13800138000",
  "password": "123456"
}
```

#### 响应参数

| 参数名 | 类型 | 说明 |
|--------|------|------|
| `code` | Int | 业务状态码，0 为成功 |
| `message` | String | 状态描述 |
| `data.token` | String | 登录令牌 |
| `data.userId` | String | 用户 ID |
| `data.expireTime` | Int | token 有效期（秒） |

#### 响应示例（成功）

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "userId": "usr_123456",
    "expireTime": 3600
  }
}
```

#### 响应示例（失败）

```json
{
  "code": 1002,
  "message": "手机号或密码错误",
  "data": null
}
```

#### 错误码

| code | 说明 | 客户端处理 |
|------|------|-----------|
| 0 | 成功 | 存储 token，跳转首页 |
| 1001 | 手机号不存在 | Toast 提示 |
| 1002 | 密码错误 | Toast 提示 |
| 1003 | 账号已被禁用 | Toast 提示 |

---

## 本地存储

登录成功后客户端写入 `UserDefaults`：

| Key | 来源字段 | 登出清除 |
|-----|---------|---------|
| `opb_login_token` | `data.token` | 是 |
| `opb_login_userId` | `data.userId` | 是 |

---

## 变更历史

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-11 | 初版 |
