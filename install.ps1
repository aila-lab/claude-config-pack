# Claude Code Config Pack Installer (Windows PowerShell)
# Installs 68 skills + 22 AI agents + 12 Cream Labs skills + GSD system + swarm rules

$ErrorActionPreference = "Stop"

$CLAUDE_DIR = "$env:USERPROFILE\.claude"
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Claude Code Config Pack Installer" -ForegroundColor Cyan
Write-Host "  68 Skills | 22 AI Agents | 12 Cream Labs" -ForegroundColor Cyan
Write-Host "  31 GSD Commands | 13 Skill Swarms" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Backup existing config
if (Test-Path $CLAUDE_DIR) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $BACKUP = "$CLAUDE_DIR\backups\pre-install-$timestamp"
    Write-Host "[1/6] Backing up existing config..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $BACKUP -Force | Out-Null
    if (Test-Path "$CLAUDE_DIR\CLAUDE.md") { Copy-Item "$CLAUDE_DIR\CLAUDE.md" $BACKUP }
    if (Test-Path "$CLAUDE_DIR\skills") { Copy-Item -Recurse "$CLAUDE_DIR\skills" "$BACKUP\skills" }
    if (Test-Path "$CLAUDE_DIR\ai-agents") { Copy-Item -Recurse "$CLAUDE_DIR\ai-agents" "$BACKUP\ai-agents" }
    Write-Host "  Backup complete." -ForegroundColor Green
} else {
    Write-Host "[1/6] No existing config found. Fresh install." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $CLAUDE_DIR -Force | Out-Null
}

# Install components
Write-Host "[2/6] Installing unified router (CLAUDE.md)..." -ForegroundColor Yellow
Copy-Item "$SCRIPT_DIR\CLAUDE.md" "$CLAUDE_DIR\CLAUDE.md" -Force

Write-Host "[3/6] Installing 68 skills..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$CLAUDE_DIR\skills" -Force | Out-Null
Copy-Item -Recurse "$SCRIPT_DIR\skills\*" "$CLAUDE_DIR\skills\" -Force

Write-Host "[4/7] Installing 22 AI agents..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$CLAUDE_DIR\ai-agents" -Force | Out-Null
Copy-Item -Recurse "$SCRIPT_DIR\ai-agents\*" "$CLAUDE_DIR\ai-agents\" -Force

Write-Host "[5/7] Installing 12 Cream Labs blockchain/Web3 skills..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$CLAUDE_DIR\cream-labs" -Force | Out-Null
Copy-Item -Recurse "$SCRIPT_DIR\cream-labs\*" "$CLAUDE_DIR\cream-labs\" -Force

Write-Host "[6/7] Installing GSD system..." -ForegroundColor Yellow
foreach ($dir in @("get-shit-done", "agents", "commands", "hooks")) {
    New-Item -ItemType Directory -Path "$CLAUDE_DIR\$dir" -Force | Out-Null
    Copy-Item -Recurse "$SCRIPT_DIR\$dir\*" "$CLAUDE_DIR\$dir\" -Force
}

Write-Host "[7/7] Installing settings..." -ForegroundColor Yellow
if (!(Test-Path "$CLAUDE_DIR\settings.json")) {
    Copy-Item "$SCRIPT_DIR\settings.json" "$CLAUDE_DIR\settings.json"
}
if (!(Test-Path "$CLAUDE_DIR\package.json")) {
    Copy-Item "$SCRIPT_DIR\package.json" "$CLAUDE_DIR\package.json"
}

$skillCount = (Get-ChildItem "$CLAUDE_DIR\skills" -Directory).Count

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "  Installation Complete!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Skills:     $skillCount"
Write-Host "  AI Agents:  22"
Write-Host "  Cream Labs: 12 blockchain/Web3 skills"
Write-Host "  GSD:        31 commands"
Write-Host "  Swarms:     13 auto-chains"
Write-Host ""
Write-Host "  Note: Update paths in CLAUDE.md if your"
Write-Host "  home directory differs from the original."
Write-Host ""
Write-Host "================================================" -ForegroundColor Green
