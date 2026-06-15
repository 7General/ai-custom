---
name: code-skill
description: 按照标准流程实现功能编码，确保代码质量与架构合规。触发关键词：编码、开始编码、代码技能、开始写代码
allowed-tools:
  - Read
  - Write
---

## iOS编码规范

## 参考
| data | 	When to Use	Reference | Reference |
|---------------| -----------------------| ------- |
|主题颜色适配| 字体颜色、背景色、填充色 |	`reference/theme-color-map.md`|
|组件结构| 组件具体配置和文件结构 |	`rules/组件结构.md`|
|编码规范| 代码编写规范和示例 |	`rules/编码规范.md`|


## 前置条件
- **必须读取** `rules/编码规范.md`（每次编码任务都需要）
- 读取相关的规则文件（按需加载）
- 确认当前任务涉及的模块类型

## 代码检查流程

### 标准代码检查流程

```
编码步骤
    ├─ 命名规范
    ├─ 主题颜色（默认支持暗黑适配）
    ├─ 重要提醒：写 UI 代码时必须遵循 SnapKit 规范
    ├─ 网络图片加载
    ├─ 网络请求规范
    └─ MARK 分组规范（中文）
    ↓
代码检查简报文档生成（必须同时生成两个文件）
    └─ docs/code/{feature}-design.md
```


## 编码步骤


### 1. 命名规范

- ViewController: 名称 + VC 后缀（如 `HomePageVC`）
- 自定义 View: 描述性名称 + View 后缀
- 工具类: LS 前缀 + 用途 + Tool/Helper
- 向用户确认路径（如有歧义）
- MARK 注释：**必须使用中文**

### 2. 主题颜色（默认支持暗黑适配）

所有颜色属性**必须**使用 `theme_` 前缀（SwiftTheme），不允许直接赋值 `UIColor`。

**查找流程：**

1. 用**浅色（light）hex 值**在`reference/theme-color-map.md`表中查找，匹配到哪个常量名就用哪个
2. **找到** → 直接引用，例如：
   ```swift
   view.theme_backgroundColor = MSThemeHelper.mainBackColor
   label.theme_textColor = MSThemeHelper.blackTheme85
   ```
3. **找不到** → 在 `setupStyle()` 中用 `ThemeColorPicker` 内联，并在文件顶部输出一条文档注释记录缺失颜色，格式如下：
   ### 输出文档简报
   | 文件位置        |       问题          	 | 说明      |
   |---------------| -----------------------| ------- |
   |classsess/OPBMianViewColtroller.swift| 在引用表中未找到颜色：#xxxxee |	xxxx|



### 3. 重要提醒：写 UI 代码时必须遵循 SnapKit 规范

**当编写任何包含 UI 布局的代码时（ViewController、View、addLayout 等），必须遵循以下 SnapKit 规范**：

1. **约束顺序**：top → leading → bottom → trailing → center → width → height
2. **必须使用 `leading/trailing`，绝对不要用 `left/right`**
3. **每个约束单独一行**
4. **相对于父视图时用 `equalToSuperview()`，相对于其他视图时用 `equalTo(view.snp.xxx)`**

详细规范请使用 `/snapkit-skill` skill。

### 4. 网络图片加载

```swift
imageView.kf.setImage(with: entity.imageUrl.handlerURL(),placeholder: OPBThemePlaceholderView.default())
```


### 5. 网络请求规范

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
      
      guard let entity = OPBQRBindEntity.jsonToModel(data as Any, modelType: OPBQRBindEntity.self) as? OPBQRBindEntity  else {
         return
      }
      
      if entity.isNormalData() {
         // TOODO----
      } else {
         // TOODO----
      }
   }
```
详细规范请使用 `/request-send-skill` skill。



### 6. MARK 分组规范（中文）

所有 MARK 注释必须使用中文：

```swift
class MyViewController: UIViewController {
    // MARK: - 属性
    // MARK: - 生命周期
    // MARK: - 设置
    // MARK: - 数据
    // MARK: - 按钮事件
    // MARK: - 公开方法
    // MARK: - 私有方法
}
```

## 代码简报生成

必须生成代码检查简报文档：
- 保存位置：docs/code/code-design.md



## 代码简报

### 代码简报模版

```markdown
# 功能名称 - 代码简报

## 文档信息
- 版本：v1.0
- 作者：[作者]
- 日期：2026-05-28

## 1. 概述

### 1.1 背景
描述功能背景和业务价值

### 1.2 目标
明确设计目标和成功指标

### 1.3 范围
定义功能范围和边界

## 2. 需求分析

### 2.1 功能需求
列出所有功能需求

### 2.2 未找到的主题颜色
列出所有未找到的主题颜色

```

## 附录

### 变更历史
| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0 | 2026-06-11 | 初版 |



