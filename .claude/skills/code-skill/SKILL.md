---
name: code-skill
description: 按照标准流程实现功能编码，确保代码质量与架构合规。当需要编码或修改项目代码时，自动触发该技能
allowed-tools:
  - Read
  - Write
---

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

### 1. 声明变量

- 定义对应变量
- 向用户确认路径（如有歧义）
- 检查：字段类型、命名规范

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



