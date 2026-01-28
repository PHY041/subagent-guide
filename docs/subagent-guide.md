# Vibe Coding 秘籍：让 AI 帮你写代码的正确姿势

> 今日传授：如何用 Claude Code 像老板一样管理一群 AI 员工

---

## 第一章：核心心法

### 你不是程序员，你是 AI 团队的 CEO

```
传统开发：你写代码
Vibe Coding：你管理 AI 写代码
```

Claude Code 不是一个 AI，而是**一个 AI 团队**：

| 角色 | AI 员工 | 职责 |
|------|---------|------|
| CEO | 你 | 定方向、做决策 |
| 项目经理 | 主 Agent | 协调、执行 |
| 架构师 | `architect` | 设计系统 |
| 规划师 | `planner` | 拆分任务 |
| 程序员 | 主 Agent | 写代码 |
| 代码审查员 | `code-reviewer` | 检查质量 |
| 安全专家 | `security-reviewer` | 找漏洞 |
| 测试工程师 | `test-creator` | 写测试 |
| 清洁工 | `refactor-cleaner` | 清理垃圾代码 |

---

## 第二章：Subagent 是什么？

### 一句话解释

> Subagent = 可以独立干活的 AI 小弟，干完活汇报结果

### 为什么需要 Subagent？

**没有 Subagent 时：**
```
你：帮我改这个项目

主 Agent：
  读文件1... (占用记忆)
  读文件2... (占用记忆)
  读文件3... (占用记忆)
  读文件4... (占用记忆)
  ...
  💥 记忆爆炸，忘了前面的内容
```

**有 Subagent 时：**
```
你：帮我改这个项目

主 Agent → 派出 Explore 小弟

Explore 小弟（独立工作）：
  读文件1...
  读文件2...
  读文件3...
  总结：这个项目是 XXX，关键文件是 YYY

主 Agent：收到 50 字总结，开始干活
```

### 识别 Subagent 的方法

看到这样的 UI = Subagent 在跑：
```
● Task: Explore codebase
  IN  "分析项目结构..."
  ├── Read config.py
  ├── Grep "function"
  └── 返回结果
```

看到这样的 UI = 主 Agent 在跑：
```
● Read config.py
● Edit main.py
● Bash npm install
```

---

## 第三章：开发流程秘籍

### 小白最常犯的错误

```
❌ 错误姿势：
你：帮我做一个电商网站
AI：好的！开始写代码... (写了一堆垃圾)
你：不对不对，我要的不是这样
AI：好的重写... (又写了一堆垃圾)
```

### 正确姿势：先想清楚再动手

```
✅ 正确姿势：

第一步：写 PRD（产品需求文档）
你：/prd-writer
AI：你的用户是谁？要解决什么问题？...
    [多轮问答，搞清楚要做什么]

第二步：设计架构
你：用 architect 帮我设计
AI：推荐用 Next.js + Supabase，因为...
    [画出系统图]

第三步：规划任务
你：用 planner 拆分步骤
AI：第一步做登录，第二步做商品列表...
    [详细的实现计划]

第四步：写代码
AI：[按计划一步步实现]

第五步：检查质量
AI：[自动启动 code-reviewer + security-reviewer]
```

### 流程图

```
想法
  ↓
/prd-writer → 搞清楚做什么
  ↓
architect → 设计怎么做
  ↓
planner → 拆成小步骤
  ↓
写代码（主 Agent）
  ↓
code-reviewer + security-reviewer → 检查
  ↓
test-creator → 补测试
  ↓
e2e-runner → 完整测试
  ↓
✅ 上线
```

---

## 第四章：必背口诀

### Pre-flight Check（起飞前检查）

每次开始任务前，默念：

```
📋 三问自己：

1. 要读很多文件吗？
   → YES: 先派 Explore 小弟去看

2. 是新功能吗？
   → YES: 先让 planner 做计划

3. 涉及登录/支付/用户数据吗？
   → YES: 写完必须让 security-reviewer 检查
```

### MUST vs NEVER

| MUST（必须做） | NEVER（绝对不做）|
|---------------|-----------------|
| 复杂任务先规划 | 不懂就直接写代码 |
| 安全代码要检查 | 跳过 review |
| 大项目先写 PRD | 边想边做 |
| 用 subagent 分担工作 | 让主 agent 读 1000 行代码 |

---

## 第五章：实战秘籍

### 秘籍 1：Agent Manager

不知道用什么 agent？问管家：

```
你：/agent-manager

AI：分析你的任务...
    推荐：
    Phase 1: planner
    Phase 2: 写代码
    Phase 3: code-reviewer + security-reviewer (并行)

    要执行吗？
```

### 秘籍 2：并行加速

一个人干活慢，多派几个一起干：

```
你：并行检查代码

AI：同时启动：
    ● Task: code-reviewer (检查质量)
    ● Task: security-reviewer (检查安全)

    [两个同时跑，速度翻倍]
```

### 秘籍 3：后台运行

让 AI 干活，你去喝咖啡：

```
你：后台跑 test-creator

AI：好的，后台运行中...
    [你可以继续做别的]

    ... 10 分钟后 ...

AI：测试写好了！生成了 15 个测试用例
```

### 秘籍 4：随时查手册

忘了有什么 agent？

```
你：/list-agents

AI：[显示完整的 agent 列表]
```

---

## 第六章：配置持久化

### 让规则永久生效

```
~/.claude/
├── rules/
│   └── agents.md      ← 写在这里，所有项目都生效
├── skills/
│   ├── agent-manager/ ← 自定义技能
│   └── list-agents/
```

### 项目专属规则

```
你的项目/
└── CLAUDE.md          ← 只对这个项目生效
```

---

## 第七章：大型项目门禁

### 项目越大，准备越充分

```
小项目：直接写
中项目：先 planner
大项目：PRD → 架构 → planner → 写代码
```

### 大项目检查清单

```
开始前必须有：
☐ PRD（做什么）
☐ 架构设计（怎么做）
☐ ADR（为什么这样做）

没有这些文档？停！先补上。
```

---

## 第八章：所有 Subagents 一览

### 通用型

| Agent | 用途 | 模型建议 |
|-------|------|----------|
| `Explore` | 快速探索代码库，搜索文件/关键字，理解架构 | haiku |
| `general-purpose` | 通用任务，研究复杂问题，多步骤执行 | sonnet |
| `Plan` | 设计实现方案，识别关键文件，考虑架构权衡 | sonnet |

### 规划与架构

| Agent | 用途 | 模型建议 |
|-------|------|----------|
| `planner` | 复杂功能规划，重构规划 | sonnet |
| `architect` | 系统设计，可扩展性，技术决策 | opus |
| `feature-dev:code-architect` | 分析现有模式，设计功能架构蓝图 | sonnet |
| `feature-dev:code-explorer` | 深度分析现有功能，追踪执行路径 | sonnet |

### 代码质量

| Agent | 用途 | 能改代码 |
|-------|------|----------|
| `code-reviewer` | 代码质量、安全、可维护性审查 | ❌ |
| `feature-dev:code-reviewer` | 审查 bug、逻辑错误、安全漏洞 | ❌ |
| `security-reviewer` | 安全漏洞检测（OWASP Top 10、注入、SSRF） | ✅ |
| `refactor-cleaner` | 清理死代码、重复代码、合并功能 | ✅ |

### 测试

| Agent | 用途 | 能改代码 |
|-------|------|----------|
| `test-creator` | 生成单元测试、集成测试、边界测试 | ✅ |
| `tdd-guide` | TDD 指导，先写测试再写代码 | ❌ |
| `e2e-runner` | 浏览器 E2E 测试（headed mode） | ❌ |

### 构建与文档

| Agent | 用途 | 能改代码 |
|-------|------|----------|
| `build-error-resolver` | 修复构建/TypeScript 错误，最小改动 | ✅ |
| `doc-updater` | 更新 codemaps、README、文档 | ✅ |
| `prompt-writer` | 写高质量 system prompts | ❌ |

---

## 终章：一句话总结

> **Vibe Coding = 你当 CEO，AI 当员工**
>
> 你的工作：想清楚要什么，做关键决策
> AI 的工作：规划、写代码、测试、检查
>
> 不要自己写代码，要管理 AI 写代码

---

## 快速参考卡

| 我想... | 说这个 |
|---------|--------|
| 理解项目 | "帮我理解这个项目" |
| 写需求 | `/prd-writer` |
| 设计架构 | "用 architect 设计" |
| 规划功能 | "规划一下怎么实现" |
| 检查代码 | "review 一下" |
| 检查安全 | "有没有安全问题" |
| 写测试 | "补测试" |
| 清理代码 | "清理死代码" |
| 不知道用啥 | `/agent-manager` |
| 查看所有 agent | `/list-agents` |

---

**恭喜你学会了 Vibe Coding！现在去让 AI 给你打工吧 🚀**
