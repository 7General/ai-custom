---
name: git-task
description: 提交本地修改代码 commit -> push。当需要`cp`，时自动触发对应 Agent。
---


## 工作目标

对当前项目的所有改动进行分析，并生成修改报告。

随后：

1. 用户确认
2. 生成 Commit Message
3. Commit
4. Push

---

# 第一阶段：分析改动

执行：

```bash
git status

git diff --stat

git diff
```

如果存在 Staged 内容：

```bash
git diff --cached
```

---

# 输出格式要求

必须严格按照以下格式输出。

---

## 1. 输出修改文档报告

### 编号 1 =======

1. [文件位置] 🍓🍓🍓

```text
OPBHomeKit/Module/Home/
```

2. [当前文件名] 🚀🚀🚀🚀

```text
OPBSavingRCollectionCell.swift
```

3. [修改点]

```swift
[line: 125-148]

OPBSavingRCollectionCell.swift

1. 新增 Skeleton Theme 切换逻辑

2. 新增方法

func updateSkeletonThemeIfNeeded()

3. Dark Mode 下重新创建 SkeletonGradient

4. 避免 Skeleton 颜色不更新问题
```

---

### 编号 2 =======

1. [文件位置] 🍓🍓🍓

```text
OPBHomeKit/Module/Guide/
```

2. [当前文件名] 🚀🚀🚀🚀

```text
OPBNormalHomeGuide.swift
```

3. [修改点]

```swift
[line: 88-132]

OPBNormalHomeGuide.swift

1. 增加 Guide Step 存储逻辑

2. UserDefaults 持久化当前步骤

3. 新增读取当前步骤方法

4. 修复引导重复展示问题
```

---

# 强制要求

每一个修改文件都必须输出：

* 文件位置
* 文件名
* 修改行号
* 修改说明

不得省略。

不得合并多个文件。

一个文件对应一个编号。

---

# 无法读取 Git 的情况

如果 Agent 无法读取项目：

必须输出：

```text
无法读取当前仓库信息。

请提供以下命令结果：

git status
git diff --stat
git diff
```

禁止：

* 伪造文件名
* 猜测修改内容
* 直接进入提交流程

---

# 第二阶段：确认提交

报告输出完成后必须暂停。

向用户确认：

```text
是否确认提交？

[ ] 是
[ ] 否
```

用户未明确回复：

```text
是
确认
提交
commit
继续
```

之前，

禁止执行 Commit。

---

# 第三阶段：读取版本号

提交前必须读取项目根目录：

```text
*.podspec
```

查找：

```ruby
s.version
```

例如：

```ruby
s.version = "1.5.3"
```

得到：

```text
1.5.3
```

---

# 第四阶段：生成 Commit Message

格式：

```text
[feat] 本次修改内容
[version] 1.5.3
```

示例：

```text
[feat] support skeleton dark mode update
[version] 1.5.3
```

或者：

```text
[fix] fix guide duplicate display issue
[version] 1.5.3
```

Commit Message 必须：

* 简洁
* 概括本次改动
* 不超过 80 字符

---

# 第五阶段：执行提交

执行：

```bash
git add .
git commit -m "[feat] support skeleton dark mode update

[version] 1.5.3"
```

---

# 第六阶段：Push

执行：

```bash
git push
```

如果当前分支不存在远端：

```bash
git push -u origin <branch>
```

---

# 最终输出

```text
✅ Commit 成功

Branch:
feature/home-theme

Commit:
abc1234

Version:
1.5.3

Push:
Success
```

---

# 质量要求

必须满足：

☑ 输出文件位置

☑ 输出文件名

☑ 输出修改行号

☑ 修改说明使用代码块

☑ 提交前确认

☑ 自动读取 podspec 版本

☑ 自动生成 Commit Message

☑ Push 结果反馈

☑ 无 Git 信息时禁止编造内容

```
```



