#!/bin/bash
# Good Guys — Installer
# Installs 34 agents + 67 skills + 13 swarms + 52 commands

set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
USERNAME="$(whoami)"

echo ""
echo "  ___                _    ___"
echo " / __|___ ___  _  __| |  / __|_  _ _  _ ___"
echo "| (_ / _ \ _ \| |/ _\` | | (_ | || | || (_-<"
echo " \___\___\___/ \__\__,_|  \___|\_,_|\_, /__/"
echo "                                     |__/"
echo ""
echo " Your AI Development Crew — v2.0.0"
echo " 34 agents · 67 skills · 13 swarms · 52 commands"
echo ""

# Backup existing config
if [ -d "$CLAUDE_DIR" ]; then
  BACKUP="$CLAUDE_DIR/backups/pre-install-$(date +%Y%m%d-%H%M%S)"
  echo "[1/7] Backing up existing config..."
  mkdir -p "$BACKUP"
  [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP/"
  [ -f "$CLAUDE_DIR/settings.json" ] && cp "$CLAUDE_DIR/settings.json" "$BACKUP/"
  [ -d "$CLAUDE_DIR/agents" ] && cp -r "$CLAUDE_DIR/agents" "$BACKUP/"
  echo "  Backup: $BACKUP"
else
  echo "[1/7] Fresh install."
  mkdir -p "$CLAUDE_DIR"
fi

# Install CLAUDE.md
echo "[2/7] Installing CLAUDE.md..."
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
sed -i "s/USERNAME/$USERNAME/g" "$CLAUDE_DIR/CLAUDE.md"

# Install agents
echo "[3/7] Installing 34 agents..."
mkdir -p "$CLAUDE_DIR/agents"
cp -r "$SCRIPT_DIR/agents/"* "$CLAUDE_DIR/agents/"

# Install skills
echo "[4/7] Installing skills..."
mkdir -p "$CLAUDE_DIR/skills"
cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"

# Install Good Guys system
echo "[5/7] Installing Good Guys system..."
mkdir -p "$CLAUDE_DIR/good-guys"
cp -r "$SCRIPT_DIR/good-guys/"* "$CLAUDE_DIR/good-guys/"
mkdir -p "$CLAUDE_DIR/shared"
cp -r "$SCRIPT_DIR/shared/"* "$CLAUDE_DIR/shared/"
mkdir -p "$CLAUDE_DIR/commands"
cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/"
mkdir -p "$CLAUDE_DIR/hooks"
cp -r "$SCRIPT_DIR/hooks/"* "$CLAUDE_DIR/hooks/"

# Install Cream Labs
echo "[6/7] Installing Cream Labs..."
mkdir -p "$CLAUDE_DIR/cream-labs"
cp -r "$SCRIPT_DIR/cream-labs/"* "$CLAUDE_DIR/cream-labs/"

# Settings & setup
echo "[7/7] Installing settings..."
cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"
sed -i "s/USERNAME/$USERNAME/g" "$CLAUDE_DIR/settings.json"
[ -f "$SCRIPT_DIR/setup-wizard.cjs" ] && cp "$SCRIPT_DIR/setup-wizard.cjs" "$CLAUDE_DIR/setup-wizard.cjs"
[ -f "$SCRIPT_DIR/package.json" ] && cp "$SCRIPT_DIR/package.json" "$CLAUDE_DIR/package.json"

echo ""
echo "================================================"
echo "  Good Guys installed!"
echo "================================================"
echo ""
echo "  Agents:   34"
echo "  Skills:   $(ls "$CLAUDE_DIR/skills/" | wc -l)"
echo "  Swarms:   13"
echo "  Commands: 52"
echo ""
echo "  Run setup wizard: node ~/.claude/setup-wizard.cjs"
echo "  Then try: /gg:help"
echo ""
echo "  \"Hi, I'm your buddy! Wanna build something?\""
echo "================================================"
