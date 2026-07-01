---
name: my-git-skill
description: 提交当前仓库代码,并生成可用的git commit message。触发关键词：提交代码、推送、push、acp、ACP
allowed-tools:
  - Read
  - Glob
---

请基于当前仓库的变更，为即将执行的提交生成符合仓库约定的 commit message，并推送到远端。

## 提交规范
- 优先使用约定式提交：
```txt
<type>:[optional scope]
<version>:按以下优先级获取版本号：
  1. 根目录存在 *.podspec 文件 → 读取 s.version 字段
  2. 项目中存在 Info.plist 文件 → 读取 CFBundleShortVersionString 字段
  3. 都不存在 → 省略 version 行
```
- `type` 使用：`feat`、`fix`、`refactor`、`docs`、`test`、`chore`
- 提交说明使用中文描述**变更目的**，专业术语保留英文
- 保持原子化提交：一次 commit 只包含一个类型变更

## 任务
1. 先查看当前变更，优先读取 staged diff；如果没有 staged 变更，再看工作区变更
2. 常见应拆分场景包括但不限于：服务端与客户端、算法与接口层、测试与生产代码、重构与功能修复、文档与代码、不同目录下互不依赖的业务变更
3. 对当前这次提交分别判断最合适的 `type`，必要时补充简短 `scope`
4. 直接产出可用于提交的 commit message；并明确每条对应的文件/变更范围
5. 只有在用户已经提供 commit message 草稿时，才做规范性修正
6. 提交后记得先pull, 然后push

## 输出约束
- 以可直接提交的 commit message 为核心输出
- 不要输出与提交规范无关的长篇说明
- `subject` 保持简洁，聚焦“为什么改”而不是流水账式“改了什么”
- 如果无法判断 `scope`，可省略 scope

## 输出push报告
#### 当前项目:git仓库名称 - push简报 - [yyyy-MM-dd]

### 修改文件预览

| 编号 | 	修改文件 | 本次提交信息 | 作者 |
|---------------| -----------------------| ------- |----|
|FILE-01| `xxx/xxxx/xxx.xx` |	`本次修改 了xxxx`| xx|
|FILE-02| `xxx/xxxx/xxx.xx` |	`本次修改了xxxx`|xx|
|FILE-03| `xxx/xxxx/xxx.xx` |	`本次修改了xxxx`|xx|

### 提交预览

| 提交编号 | 	提交内容 |
|---------------| -----------------------| 
|commite-01| `xxx` |	
|commite-02| `xxx` |	
|commite-02| `xxx` |

