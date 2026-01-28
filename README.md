# Vibe Coding Guide

> 让 AI 帮你写代码的正确姿势 - Claude Code Subagent 最佳实践

**Vibe Coding = 你当 CEO，AI 当员工**

不要自己写代码，要管理 AI 写代码。

## 这是什么？

这是一套 Claude Code 的配置和最佳实践，让你像管理团队一样管理 AI：

- **Agent Orchestrator** - 自动调度合适的 AI agent 完成任务
- **Pre-flight Check** - 强制执行最佳实践，避免常见错误
- **自定义 Skills** - `/agent-manager`, `/list-agents` 等快捷命令
- **完整秘籍** - 从小白到高手的 Vibe Coding 指南

## 快速开始

### 一键安装

```bash
git clone https://github.com/YOUR_USERNAME/vibe-coding-guide.git
cd vibe-coding-guide
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
Claude: [进入 Agent Manager 模式]
```

## 核心概念

### Subagent 是什么？

Subagent = 可以独立干活的 AI 小弟，干完活汇报结果。

```
没有 Subagent：主 Agent 读 1000 行代码 → 记忆爆炸
有 Subagent：派小弟去读 → 返回 50 字摘要 → 主 Agent 轻松干活
```

### 可用的 Subagents

| Agent | 用途 |
|-------|------|
| `Explore` | 快速探索代码库、理解架构 |
| `planner` | 功能规划、步骤拆分 |
| `architect` | 系统设计、架构决策 |
| `code-reviewer` | 代码质量审查 |
| `security-reviewer` | 安全漏洞检测 |
| `test-creator` | 生成测试用例 |
| `refactor-cleaner` | 清理死代码 |
| `build-error-resolver` | 修复构建错误 |
| `e2e-runner` | 端到端测试 |
| `doc-updater` | 更新文档 |
| `prompt-writer` | 写 LLM prompts |

### 正确的开发流程

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
✅ 上线
```

## 包含的文件

```
vibe-coding-guide/
├── README.md                    # 你在看的这个
├── docs/
│   └── vibe-coding-guide.md     # 完整秘籍
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

安装后可用的命令：

| 命令 | 作用 |
|------|------|
| `/agent-manager` | 分析任务，推荐 agents，生成执行计划 |
| `/list-agents` | 查看所有可用的 subagents |

## 快捷触发词

自然语言也能触发 agents：

| 你说 | Claude 理解为 |
|------|--------------|
| "帮我理解这个项目" | Explore agent |
| "规划一下" | planner |
| "review 一下" | code-reviewer |
| "有没有安全问题" | security-reviewer |
| "写测试" | test-creator |
| "清理代码" | refactor-cleaner |
| "构建失败了" | build-error-resolver |

## 强制规则

安装后，Claude 会自动遵守这些规则：

### MUST（必须做）

- 读 3+ 文件前，先用 `Explore` agent
- 实现新功能前，先用 `planner`
- 安全敏感代码写完后，必须跑 `security-reviewer`
- 大型项目必须先写 PRD

### NEVER（绝对不做）

- 直接读超过 500 行代码到主上下文
- 不理解项目就直接写代码
- 跳过 planner 直接实现复杂功能

## 完整文档

- [Vibe Coding 秘籍](docs/vibe-coding-guide.md) - 从小白到高手的完整指南
- [Agent Orchestrator 规则](rules/agents.md) - 详细的调度规则

## 贡献

欢迎提 PR 和 Issue！

## License

MIT

---

**让 AI 给你打工，而不是你给 AI 打工 🚀**
