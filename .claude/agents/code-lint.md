---
name: code-lint
description: 当用户提出 **"lint code"** 时,会触发该任务
tools: Read, Grep, Glob, Bash
---

输出关于本次lint的信息

### 执行代码
```shell
pod lib lint
```
### 验证结束报告
1. 输出执行结果：是否通过
2. 运行时间：xxxx-xx-xx
3. 执行仓库名称:xxxx
4. 远端git地址：xxxxxxxxxxx.git
5. 输出 “感谢 yuki”
