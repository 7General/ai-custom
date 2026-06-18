
## 项目：一个Pod组件项目

## 技术栈
- Swift、Object-C
- **Minimum iOS**: 13.0


### 特别关注
- [] 所有创建的文件都必须以`OPB`为前缀开始

### 🔴 阶段流转规则（必须遵守）

**每个阶段结束时，必须：**
1. 读取 `.harness/config.yaml`，找到当前阶段节点
2. 按以下规则判断下一步：

### 规则一：有 `threshold` 的阶段（有合格标准）

```
得分 >= threshold  →  执行 on_pass.next
得分 <  threshold  →  执行 on_fail.next（按配置决定：回到上一阶段或停止等待修复）
```

### auto 字段含义

```
auto: true   →  直接执行下一步，告知用户正在进行
auto: false  →  告知用户结果，等待用户确认后再执行
next: null   →  流程到此结束，询问用户是否有新指令
```


### 文件索引
|文件 |  用途 |
|--- |---    | 
| `rules/工程结构.md` | 项目目录结构规范 |
| `rules/编码规范.md` | 编码标准与约定 |
| `rules/组件结构.md` | 组件的目录和结构规范 |



## Coding Guidelines

### 1. Think Before Coding

- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### 2. Simplicity First

Minimum code that solves the problem. Nothing speculative.

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

### 3. Surgical Changes

Touch only what you must. Clean up only your own mess.

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.
- Remove imports/variables/functions that YOUR changes made unused.
- Every changed line should trace directly to the user's request.

### 4. Goal-Driven Execution

Transform tasks into verifiable goals:

- "Add feature X" → state what files will change, verify: compile passes
- "Fix the bug" → describe root cause before writing fix
- "Refactor X" → verify: behavior unchanged, no new warnings

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```


