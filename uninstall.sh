#!/bin/bash

# Subagent Guide Uninstaller
# 卸载 Subagent Guide 配置

set -e

CLAUDE_DIR="$HOME/.claude"

echo "🗑️  Subagent Guide Uninstaller"
echo "================================"
echo ""

# 确认卸载
read -p "Are you sure you want to uninstall Subagent Guide? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

# 删除 rules
echo ""
echo "📋 Removing rules..."
rules_to_remove=("agents.md" "coding-style.md")
for rule in "${rules_to_remove[@]}"; do
    if [ -f "$CLAUDE_DIR/rules/$rule" ]; then
        rm "$CLAUDE_DIR/rules/$rule"
        echo "   ✅ Removed $rule"
    fi
done

# 删除 skills
echo ""
echo "🎯 Removing skills..."
skills_to_remove=("agent-manager" "list-agents")
for skill in "${skills_to_remove[@]}"; do
    if [ -d "$CLAUDE_DIR/skills/$skill" ]; then
        rm -rf "$CLAUDE_DIR/skills/$skill"
        echo "   ✅ Removed $skill"
    fi
done

echo ""
echo "================================"
echo "✨ Uninstallation complete!"
echo ""
echo "Note: Backup files (*.backup.*) were not removed."
echo "You can manually delete them from ~/.claude/ if needed."
