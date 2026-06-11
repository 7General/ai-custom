---
name: code-skill
description: 按照标准流程实现功能编码，确保代码质量与架构合规。包含颜色、字体、lazy、UIButton、UILabel、UIImageView、UICollectionView、网络请求、相对宽度、渐变色、富文本、MARK注释、命名规范、初始化顺序。当需要编码或修改项目代码时，自动触发该技能
allowed-tools:
  - Read
  - Write
---

## iOS编码规范

## 参考
| data | 	When to Use	Reference | Reference |
|---------------| -----------------------| ------- |
|主题颜色适配| 字体颜色、背景色、填充色 |	`reference/theme-color-map.md`|


## 前置条件
- 读取相关的规则文件（按需加载）
- 读取`组件结构.md`相关的规则文件（按需加载）
- 读取相关的wiki（按需加载）
- 确认当前任务涉及的模块类型


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
   ```swift
   // [TODO-Color] 缺少语义化颜色：浅色 #007AFF / 暗黑 #000000D9
   // 建议在 MSThemeHelper 中补充：
   // public static let xxx : MSThemeColor = MSThemeColor("#007AFF", "#000000D9")
   ```

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

<!--  TODO......
1. 需要关于网络请求的wiki
2. 需要询问用户，指定网络wiki位置
---
怎么询问用户，要提醒用户传一个网络请求的wiki
---
 -->



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



