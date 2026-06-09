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


