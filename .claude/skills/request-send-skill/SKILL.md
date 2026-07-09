---
name: request-send-skill
description: 按照标准流程实现网络请求功能，确保代码质量与组件结构合规。触发关键词： 创建网络请求、修改网络请求代码
---


## 前置条件

| 场景 | 参考文件 |
|------|---------|
| 编码通用规范（必须） | `rules/编码规范.md` |
| 组件目录结构 | `rules/组件结构.md` |

## 执行原则

wiki 中缺失的字段或不确认的细节，必须和用户逐项确认，不要假设和忽略。

## 禁止：

1.推测字段
2.推测字段类型
3.推测默认值
4.推测 host
5.推测 requestUrl
6.推测 encryptType

发现任何未知内容，立即停止编码并向用户确认。

## 优先复用

编码前先检查项目中是否已存在同名或同功能的 Request / Entity / ResponseModel（使用 `glob` 和 `read` 工具）。

如果已存在，
**必须向用户确认**：
1. 展示已有类和需要修改的内容
- **用户确认方案可执行**：开始执行
- **用户认为有问题**：立刻停止

**禁止创建重复类。**


## 添加网络请求步骤

### 阶段一：定义响应实体对象

1.继承 `OPBResponseModel`
2.添加头文件 `import OPBJARVIS`
3.从 wiki `## 响应数据` JSON 中提取所有字段，**包括嵌套对象（需额外定义子类）**
  - 如有嵌套对象：
  ```swift
  @objc static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return [
            [有嵌套对象的字段]: [定义的子类对象].self,
        ]
    }
  ```

### 阶段二：定义网络请求对象

1.继承 `OPBBaseRequest`
2.添加头文件 `import OPBJARVIS`
3.严格按 wiki 中 `## 请求格式` 的结构实现 `requestArgument()`
4.host 如果是 `OPBNetworkManager.shared.baseUrl(...)` 形式，**直接使用该表达式，不要硬编码 URL 字符串**
5.默认是`.post`,非必要不重写 `requestMethod()`
- `## host` → `baseUrl()`，注意：如果是 `OPBNetworkManager.shared.baseUrl(...)` 形式，需原样使用
- `## requestUrl` → `requestUrl()`
- `## 入参` → 请求类属性字段
- `## 加密方式` → `encryptType()` 返回值（`.kong` 或 `.encrypt`）
- `## 请求格式` → `requestArgument()` 返回值，**严格按 wiki 中的结构生成，不要简化**

### 阶段三：实现request

```swift
view.showHUDIndicatorAtCenter()

let request = OPBQRScanTaskRequest()
request.qrContent = qrContent
request.qrContentSubType = qrType
request.qrFrom = qrFrom
request.qrScanSdk = scanSdk

OPBNetworkManager.shared.start(request) {[weak self] request, data, error in
    guard let `self` = self else { return }
    // 关闭HUD
    view.hiddenHUDIndicatorAtCenter()

    guard let entity = OPBQRBindEntity.jsonToModel(data as Any, modelType: OPBQRBindEntity.self) as? OPBQRBindEntity else {
        return
    }

    if entity.isNormalData() {
        // TODO----
    } else {
        // TODO----
    }
}
```

### 阶段四：完成后

自检清单：
- [ ] 实体类继承 `OPBResponseModel`
- [ ] 已 `import OPBJARVIS`
- [ ] host 未硬编码 URL 字符串
- [ ] `requestArgument()` 严格按 wiki 结构生成
- [ ] 嵌套对象已定义子类并实现 `modelContainerPropertyGenericClass`
- [ ] 无重复类

在终端输出简要信息即可

- 定义的网络请求对象名称
- 添加的实体对象名称
- 加密方式、接口路径
