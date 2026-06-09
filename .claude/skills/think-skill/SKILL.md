---
name: think-skill
description: 统计当前工程代码信息。当需要统计代码、think-code时，自动触发该技能
allowed-tools:
  - Read
  - Glob
---


## 上下文条件

输出`MSCustomAi/Classess/`下所有`.swift`文件信息报告

## 1. 输出文件信息报告文档

### 编号 1 =======
1. 🍓🍓🍓 -[文件位置]:
2. 🚀🚀🚀🚀 -[line]:


### 编号 2 =======
1. 🍓🍓🍓 -[文件位置]:
2. 🚀🚀🚀🚀 -[line]:

## 2. 要和用户确认后上传

- [ ] 询问用户是否要上传代码
     如用户同意，按以下格式提交，并推送到远端 提交前，先读取根目录 *.podspec 文件中的 s.version 字段作为版本号
      [feat] 本次修改内容
      [version] 1.0。0

