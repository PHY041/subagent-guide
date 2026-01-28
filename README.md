# Subagent Guide

> Claude Code Subagent 完全指南 - 让 AI 团队帮你写代码

**你不是程序员，你是 AI 团队的 CEO**

Claude Code 不是一个 AI，而是一个 AI 团队。学会用 Subagent，让它们各司其职。

## 这是什么？

一套 Claude Code 的 Subagent 最佳实践配置：

- **Agent Orchestrator** - 自动调度合适的 AI agent 完成任务
- **Pre-flight Check** - 强制执行最佳实践，避免常见错误
- **自定义 Skills** - `/agent-manager`, `/list-agents` 等快捷命令
- **完整指南** - 从小白到高手的 Subagent 使用指南

## 快速开始

### 一键安装

```bash
git clone https://github.com/anthropics/subagent-guide.git
cd subagent-guide
./install.sh
```

### 手动安装

```bash
# 复制 rules 到全局配置
cp -r rules/* ~/.claude/rules/

# 复制 skills 到全局配置
cp -r skills/* ~/.claude/skills/
```

### 验证安装

重启 Claude Code，然后：

```
你: /list-agents
Claude: [显示所有可用的 subagents]

你: /agent-manager
Claude: [进入 Agent Manager 模式，分析任务并推荐 agents]
```

## 核心概念

### Subagent 是什么？

> Subagent = 独立运行的 AI 小弟，有自己的记忆空间，干完活汇报结果

**为什么需要 Subagent？**

```
没有 Subagent：
主 Agent 读 1000 行代码 → 记忆爆满 → 忘了前面的内容 → 写出垃圾代码

有 Subagent：
派 Explore 小弟去读 → 返回 50 字摘要 → 主 Agent 轻松写代码
```

### 可用的 Subagents

| Agent | 用途 | 能改代码 |
|-------|------|----------|
| `Explore` | 快速探索代码库、理解架构 | ❌ |
| `planner` | 功能规划、步骤拆分 | ❌ |
| `architect` | 系统设计、架构决策 | ❌ |
| `code-reviewer` | 代码质量审查 | ❌ |
| `security-reviewer` | 安全漏洞检测 | ✅ |
| `test-creator` | 生成测试用例 | ✅ |
| `refactor-cleaner` | 清理死代码 | ✅ |
| `build-error-resolver` | 修复构建错误 | ✅ |
| `e2e-runner` | 端到端测试 | ❌ |
| `doc-updater` | 更新文档 | ✅ |
| `prompt-writer` | 写 LLM prompts | ❌ |

### 识别 Subagent

**Subagent 在跑：**
```
● Task: Explore codebase
  IN  "分析项目结构..."
  ├── Read config.py
  ├── Grep "function"
  └── 返回结果
```

**主 Agent 在跑：**
```
● Read config.py
● Edit main.py
● Bash npm install
```

## 正确的开发流程

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
code-reviewer + security-reviewer → 并行检查
  ↓
test-creator → 补测试
  ↓
✅ 上线
```

## 强制规则

安装后，Claude 会自动遵守这些规则：

### Pre-flight Check

每次任务前自动检查：

```
□ 需要读 3+ 文件？ → MUST 先用 Explore
□ 是新功能？ → MUST 先用 planner
□ 涉及安全敏感代码？ → MUST 写完后用 security-reviewer
```

### MUST vs NEVER

| MUST（必须做） | NEVER（绝对不做）|
|---------------|-----------------|
| 读 3+ 文件前用 `Explore` | 直接读 500+ 行到主上下文 |
| 新功能前用 `planner` | 不理解项目就写代码 |
| 安全代码后用 `security-reviewer` | 跳过 review |

## 包含的文件

```
subagent-guide/
├── README.md                    # 你在看的这个
├── docs/
│   ├── subagent-guide.md        # 技术参考
│   └── vibe-coding-guide.md     # Vibe Coding 秘籍（小白教程）
├── rules/
│   ├── agents.md                # Agent Orchestrator 规则
│   └── coding-style.md          # Python 代码风格
├── skills/
│   ├── agent-manager/           # /agent-manager 命令
│   │   └── skill.md
│   └── list-agents/             # /list-agents 命令
│       └── skill.md
├── install.sh                   # 安装脚本
└── uninstall.sh                 # 卸载脚本
```

## 快捷命令

| 命令 | 作用 |
|------|------|
| `/agent-manager` | 分析任务，推荐 agents，生成执行计划 |
| `/list-agents` | 查看所有可用的 subagents |

## 快捷触发词

| 你说 | Claude 理解为 |
|------|--------------|
| "帮我理解这个项目" | Explore agent |
| "规划一下" | planner |
| "review 一下" | code-reviewer |
| "有没有安全问题" | security-reviewer |
| "写测试" | test-creator |
| "清理代码" | refactor-cleaner |
| "构建失败了" | build-error-resolver |
| "并行检查" | code-reviewer + security-reviewer |

## 完整文档

- [Subagent 完整指南](docs/subagent-guide.md) - 技术参考
- [Vibe Coding 秘籍](docs/vibe-coding-guide.md) - 从小白到高手的完整教程

## License

MIT

---

**让 AI 团队给你打工 🚀**
