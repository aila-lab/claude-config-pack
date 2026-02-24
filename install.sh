#!/bin/bash
# Claude Code Config Pack Installer
# Installs 68 skills + 22 AI agents + 12 Cream Labs skills + GSD system + swarm rules

set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "================================================"
echo "  Claude Code Config Pack Installer"
echo "  68 Skills | 22 AI Agents | 12 Cream Labs"
echo "  31 GSD Commands | 13 Skill Swarms"
echo "================================================"
echo ""

# Backup existing config
if [ -d "$CLAUDE_DIR" ]; then
  BACKUP="$CLAUDE_DIR/backups/pre-install-$(date +%Y%m%d-%H%M%S)"
  echo "[1/6] Backing up existing config to $BACKUP..."
  mkdir -p "$BACKUP"
  [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP/"
  [ -d "$CLAUDE_DIR/skills" ] && cp -r "$CLAUDE_DIR/skills" "$BACKUP/"
  [ -d "$CLAUDE_DIR/ai-agents" ] && cp -r "$CLAUDE_DIR/ai-agents" "$BACKUP/"
  echo "  Backup complete."
else
  echo "[1/6] No existing config found. Fresh install."
  mkdir -p "$CLAUDE_DIR"
fi

# Install CLAUDE.md (unified router)
echo "[2/6] Installing unified router (CLAUDE.md)..."
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# Install skills
echo "[3/6] Installing 68 skills..."
mkdir -p "$CLAUDE_DIR/skills"
cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"
echo "  $(ls "$CLAUDE_DIR/skills/" | wc -l) skills installed."

# Install AI agents
echo "[4/7] Installing 22 AI agents..."
mkdir -p "$CLAUDE_DIR/ai-agents"
cp -r "$SCRIPT_DIR/ai-agents/"* "$CLAUDE_DIR/ai-agents/"

# Install Cream Labs
echo "[5/7] Installing 12 Cream Labs blockchain/Web3 skills..."
mkdir -p "$CLAUDE_DIR/cream-labs"
cp -r "$SCRIPT_DIR/cream-labs/"* "$CLAUDE_DIR/cream-labs/"

# Install GSD system
echo "[6/7] Installing GSD (Get Shit Done) system..."
mkdir -p "$CLAUDE_DIR/get-shit-done"
cp -r "$SCRIPT_DIR/get-shit-done/"* "$CLAUDE_DIR/get-shit-done/"
mkdir -p "$CLAUDE_DIR/agents"
cp -r "$SCRIPT_DIR/agents/"* "$CLAUDE_DIR/agents/"
mkdir -p "$CLAUDE_DIR/commands"
cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/"
mkdir -p "$CLAUDE_DIR/hooks"
cp -r "$SCRIPT_DIR/hooks/"* "$CLAUDE_DIR/hooks/"

# Install settings (only if not exists)
echo "[7/7] Installing settings..."
if [ ! -f "$CLAUDE_DIR/settings.json" ]; then
  cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  settings.json installed."
else
  echo "  settings.json already exists, skipping."
fi

if [ ! -f "$CLAUDE_DIR/package.json" ]; then
  cp "$SCRIPT_DIR/package.json" "$CLAUDE_DIR/package.json"
fi

echo ""
echo "================================================"
echo "  Installation Complete!"
echo "================================================"
echo ""
echo "  Skills:     $(ls "$CLAUDE_DIR/skills/" | wc -l)"
echo "  AI Agents:  22"
echo "  Cream Labs: 12 blockchain/Web3 skills"
echo "  GSD:        31 commands"
echo "  Swarms:     13 auto-chains"
echo ""
echo "  CLAUDE.md path: $CLAUDE_DIR/CLAUDE.md"
echo ""
echo "  Note: Update paths in CLAUDE.md if your"
echo "  home directory differs from the original."
echo ""
echo "  To verify: claude --version"
echo "  Then ask: 'agents' or 'show skills'"
echo "================================================"
