---
name: request-send-skill
description: 按照标准流程实现网络请求功能，确保代码质量与组件结构合规。触发关键词： 创建网络请求、修改网络请求代码
allowed-tools:
  - Read
  - Write
  - Glob
---


## 前置条件
- 读取相关的规则文件（按需加载，最多4个）
- 读取相关的wiki（按需加载）
- 确认当前任务涉及的模块类型


## 添加网络请求步骤

  

**如果 wiki 中没有某个字段，才询问用户补充。**

### 1. 定义响应实体对象

- 继承 `OPBResponseModel`
- 添加头文件 `import OPBJARVIS`
- 从 wiki `## 响应数据` JSON 中提取所有字段，**包括嵌套对象（需额外定义子类）**
  - 如有结合对象出现：
  ```swift
  @objc static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return [
            [有嵌套对象的字段]: [定义的子类对象].self,
        ]
    }
  ```

### 2. 定义网络请求对象

- 继承 `OPBBaseRequest`
- 添加头文件 `import OPBJARVIS`
- 严格按 wiki 中 `## 请求格式` 的结构实现 `requestArgument()`
- host 如果是 `OPBNetworkManager.shared.baseUrl(...)` 形式，**直接使用该表达式，不要硬编码 URL 字符串**
- 默认是`.post`,非必要不重写 `requestMethod()`
- `## host` → `baseUrl()`，注意：如果是 `OPBNetworkManager.shared.baseUrl(...)` 形式，需原样使用
- `## requestUrl` → `requestUrl()`
- `## 入参` → 请求类属性字段
- `## 加密方式` → `encryptType()` 返回值（`.kong` 或 `.encrypt`）
- `## 请求格式` → `requestArgument()` 返回值，**严格按 wiki 中的结构生成，不要简化**

### 3. 实现request
  ### Swift 写法（强制要求）
```swift
   view.showHUDIndicatorAtCenter()
   
   let request = OPBQRScanTaskRequest()
   request.qrContent = qrContent
   request.qrContentSubType = qrType
   request.qrFrom = qrFrom
   request.qrScanSdk = scanSdk
   
   OPBNetworkManager.shared.start(request) {[weak self] request, data, error in
      guard let `self` = self else { return }
      view.hiddenHUDIndicatorAtCenter()
      
      guard let entity = [`响应的实体对象`].jsonToModel(data as Any, modelType: OPBQRBindEntity.self) as? OPBQRBindEntity  else {
         return
      }
      
      if entity.isNormalData() {
         // TOODO----
      } else {
         // TOODO----
      }
   }
```
  

### 4. 输出接口定义报告

#### [接口]整体预览

#### 请求对象
- 定义的网络请求对象: [创建对象名称]
- 添加的实体对象: [创建对象名称]
- 加密方式: [加密方式]
- 接口入参: [`param1`, `param2`...]
- 接口路径: [requestUrl]
- host: [baseUrl]

<!-- ### 5. 开启 code-review
- 报告生成完成后，自动进行 `code review` -->



