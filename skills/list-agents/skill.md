---
name: list-agents
description: 列出所有可用的 subagents 及其用途。当用户说「有什么 agent」「subagent 列表」「/list-agents」「忘了有什么 agent」时触发。
---

# Subagent 完整列表

## 通用型

| Agent | 用途 |
|-------|------|
| `Explore` | 快速探索代码库，搜索文件/关键字，理解架构 |
| `general-purpose` | 通用任务，研究复杂问题，多步骤执行 |
| `Plan` | 设计实现方案，识别关键文件，考虑架构权衡 |
| `Bash` | 执行 bash 命令，git 操作，终端任务 |

## 规划与架构

| Agent | 用途 |
|-------|------|
| `planner` | 复杂功能规划，重构规划 |
| `architect` | 系统设计，可扩展性，技术决策 |
| `feature-dev:code-architect` | 分析现有模式，设计功能架构蓝图 |
| `feature-dev:code-explorer` | 深度分析现有功能，追踪执行路径 |

## 代码质量

| Agent | 用途 |
|-------|------|
| `code-reviewer` | 代码质量、安全、可维护性审查 |
| `feature-dev:code-reviewer` | 审查 bug、逻辑错误、安全漏洞 |
| `security-reviewer` | 安全漏洞检测（OWASP Top 10、注入、SSRF） |
| `refactor-cleaner` | 清理死代码、重复代码、合并功能 |

## 测试

| Agent | 用途 |
|-------|------|
| `test-creator` | 生成单元测试、集成测试、边界测试 |
| `tdd-guide` | TDD 指导，先写测试再写代码 |
| `e2e-runner` | 浏览器 E2E 测试（headed mode） |

## 构建与错误

| Agent | 用途 |
|-------|------|
| `build-error-resolver` | 修复构建/TypeScript 错误，最小改动 |

## 文档与 Prompt

| Agent | 用途 |
|-------|------|
| `doc-updater` | 更新 codemaps、README、文档 |
| `prompt-writer` | 写高质量 system prompts |
| `claude-code-guide` | 回答 Claude Code / API 使用问题 |

## 配置

| Agent | 用途 |
|-------|------|
| `statusline-setup` | 配置 Claude Code 状态栏设置 |

## UI/UX/无障碍 (Skills)

| Skill | 用途 | 标准 |
|-------|------|------|
| `/ui-reviewer` | UI 代码审查：设计系统合规、响应式、组件结构 | Design Tokens, React/Vue 最佳实践 |
| `/ux-reviewer` | UX 启发式评估：可用性、用户流程、交互逻辑 | Nielsen Norman 10 条原则 |
| `/a11y-reviewer` | 无障碍审查：可访问性检查 | WCAG 2.2 AA |

---

## 常用场景速查

| 我想要... | 用这个 Agent/Skill |
|----------|-------------------|
| 探索/理解项目 | `Explore` |
| 规划新功能 | `planner` |
| Review 代码 | `code-reviewer` |
| 检查安全问题 | `security-reviewer` |
| 写测试 | `test-creator` |
| 修构建错误 | `build-error-resolver` |
| 清理死代码 | `refactor-cleaner` |
| 跑 E2E 测试 | `e2e-runner` |
| 写 Prompt | `prompt-writer` |
| 更新文档 | `doc-updater` |
| 检查 UI 代码 | `/ui-reviewer` |
| 检查用户体验 | `/ux-reviewer` |
| 检查无障碍 | `/a11y-reviewer` |
| 前端全面检查 | 并行跑 ui + ux + a11y |

## 并行运行示例

```
"用 code-reviewer 和 security-reviewer 并行检查"
"parallel 跑 test-creator 和 e2e-runner"
```

## 后台运行示例

```
"后台跑 test-creator"
"background 运行 refactor-cleaner"
```
