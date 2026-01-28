#!/bin/bash

# Vibe Coding Guide Installer
# 一键安装 Claude Code 最佳实践配置

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "🚀 Vibe Coding Guide Installer"
echo "================================"
echo ""

# 检查 Claude Code 配置目录
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "📁 Creating ~/.claude directory..."
    mkdir -p "$CLAUDE_DIR"
fi

# 创建必要的子目录
mkdir -p "$CLAUDE_DIR/rules"
mkdir -p "$CLAUDE_DIR/skills"

# 备份现有配置（如果存在）
backup_if_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "📦 Backing up existing $file to $backup"
        cp "$file" "$backup"
    fi
}

# 安装 rules
echo ""
echo "📋 Installing rules..."
for rule in "$SCRIPT_DIR/rules/"*.md; do
    if [ -f "$rule" ]; then
        filename=$(basename "$rule")
        backup_if_exists "$CLAUDE_DIR/rules/$filename"
        cp "$rule" "$CLAUDE_DIR/rules/"
        echo "   ✅ $filename"
    fi
done

# 安装 skills
echo ""
echo "🎯 Installing skills..."
for skill_dir in "$SCRIPT_DIR/skills/"*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        if [ -d "$CLAUDE_DIR/skills/$skill_name" ]; then
            echo "   📦 Backing up existing skill: $skill_name"
            mv "$CLAUDE_DIR/skills/$skill_name" "$CLAUDE_DIR/skills/${skill_name}.backup.$(date +%Y%m%d_%H%M%S)"
        fi
        cp -r "$skill_dir" "$CLAUDE_DIR/skills/"
        echo "   ✅ $skill_name"
    fi
done

echo ""
echo "================================"
echo "✨ Installation complete!"
echo ""
echo "Available commands:"
echo "   /agent-manager  - 分析任务，推荐 agents"
echo "   /list-agents    - 查看所有可用的 subagents"
echo ""
echo "Quick test:"
echo "   1. Open Claude Code"
echo "   2. Type: /list-agents"
echo ""
echo "📖 Read the full guide: docs/vibe-coding-guide.md"
echo ""
echo "Happy Vibe Coding! 🎉"
