---
name: code-skill-new
description: iOS编码技能。触发关键词：编码、写代码、编码实现
---

iOS 编码规范

## 前置条件 

| 场景 | 参考文件 |
|------|---------|
| 编码通用规范（必须） | `rules/编码规范.md` |
| 组件目录结构 | `rules/组件结构.md` |
| 主题颜色查表 | `reference/theme-color-map.md` |
| UI约束布局 | 使用 `/snapkit-skill` |
| 网络请求 | 使用 `/request-send-skill` |
| 字体映射 | OPBUtils/font/UIFont+extrnsion.swift|

## 禁止：

1. Theme 常量
2. UIFont 常量
3. 字号映射关系
5. 约束值

发现任何未知内容，立即停止编码并向用户确认。


## 编码步骤

### 1. 主题颜色查找流程

1. 用**浅色 hex 值**在 `reference/theme-color-map.md` 表中匹配常量名
2. **找到** → 直接引用：
   ```swift
   view.theme_backgroundColor = OPBThemeHelper.mainBackColor
   label.theme_textColor = OPBThemeHelper.blackTheme85
   ```
3. **找不到** → 在 `setupStyle()` 中用 `ThemeColorPicker` 内联，并输出提示：
   | 文件位置 | 缺失颜色 | 说明 |
   |---------|---------|------|
   | 文件路径 | #xxxxxx | 用途 |


### 2. 字体设置

#### 字体规则

1. 禁止使用：

```swift
UIFont.systemFont(...)
UIFont.boldSystemFont(...)
UIFont.italicSystemFont(...)
```

2. 必须使用：

`OPBUtils/font/UIFont+extrnsion.swift`

根据设计稿中的：

- 字体(Font Family)
- 字重(Font Weight)
- 字号(Font Size)

选择对应字体。

字重对应关系表
| 设计稿字体 | 对应字体 | 
|---------|---------|
| Normal | _regularFont |
| Medium | _mediumFont | 
| Semi Bold | _semiboldFont |
| Bold | _boldFont |

#### 字号匹配流程（必须遵守）

示例如下

**优先使用 UIFont+extrnsion.swift 中已定义的静态字体**
```
示例一：设计稿字体是：Normal，字体大小为14 

优先匹配:UIFont._sm4 

示例二：设计稿字体是：Normal，字体大小为16 

优先匹配:UIFont._sm6 

示例三：设计稿字体是：Medium，字体大小为22

优先匹配:UIFont._nm2Medium 

```

**如果没有对应字号**
```
示例一：设计稿字体是：Normal，字体大小为46 

优先匹配:UIFont._regularFont.withSize(46~) 

示例二：设计稿字体是：Medium，字体大小为9

优先匹配:UIFont._mediumFont.withSize(9~) 
```

#### 无法匹配

出现以下情况：
- 找不到字体
- 找不到字号
- 找不到对应 UIFont 扩展

禁止推测

禁止：
如果 UIFont+extrnsion.swift 中已存在对应静态字体

不得使用：
UIFont._regularFont.withSize(...)
UIFont._mediumFont.withSize(...)
UIFont._semiboldFont.withSize(...)
UIFont._boldFont.withSize(...)


输出：

| 文件 | 字体 | 字号 | 说明 |
|------|------|------|------|



### 3. UI 布局

写 UI 代码时**必须遵循 SnapKit 规范**，详见 `/snapkit-skill`。

### 4. 网络图片加载

```swift
imageView.kf.setImage(
    with: entity.imageUrl.handlerURL(),
    placeholder: OPBThemePlaceholderView.default()
)
```

### 5. 网络请求

详见 `/request-send-skill`



## 编码完成后

在终端输出简要检查结果即可，无需强制生成文档。检查项：

- `rules/编码规范.md` 中的各项规则是否遵守
- 主题颜色是否使用 `theme_` 前缀
- 未找到的颜色列表（如有）
- 约束是否使用 `leading/trailing`
