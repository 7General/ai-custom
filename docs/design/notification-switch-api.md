# 通知开关功能 - API 接口文档

## 文档信息
- 版本：v1.0
- 日期：2026-06-11
- 状态：已确认

---

## 接口列表

| # | 方法 | 路径 | 说明 |
|---|------|------|------|
| 1 | GET | /api/v1/notification/settings | 获取用户通知开关状态 |
| 2 | PUT | /api/v1/notification/settings | 更新通知开关状态 |

---

## 接口详情

### 接口一：获取用户通知开关状态

**GET** `/api/v1/notification/settings`

**请求头**
```
Authorization: Bearer {token}
```

**响应示例**
```json
{
  "code": 200,
  "data": {
    "push_enabled": true,
    "updated_at": "2026-06-11T10:00:00Z"
  }
}
```

---

### 接口二：更新通知开关状态

**PUT** `/api/v1/notification/settings`

**请求头**
```
Authorization: Bearer {token}
Content-Type: application/json
```

**请求体**
```json
{
  "push_enabled": false
}
```

**响应示例**
```json
{
  "code": 200,
  "data": {
    "push_enabled": false,
    "updated_at": "2026-06-11T10:30:00Z"
  }
}
```

---

## 错误码

| code | 说明 |
|------|------|
| 200 | 成功 |
| 401 | 未登录 / token 失效 |
| 500 | 服务端异常 |
