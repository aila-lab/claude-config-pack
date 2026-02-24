# Good Guys — Installer (Windows PowerShell)
# Installs 34 agents + 67 skills + 13 swarms + 52 commands

$ErrorActionPreference = "Stop"

$CLAUDE_DIR = "$env:USERPROFILE\.claude"
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$USERNAME = $env:USERNAME

Write-Host ""
Write-Host "  Good Guys — Your AI Development Crew" -ForegroundColor Cyan
Write-Host "  34 agents | 67 skills | 13 swarms | 52 commands" -ForegroundColor Cyan
Write-Host ""

# Backup
if (Test-Path $CLAUDE_DIR) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $BACKUP = "$CLAUDE_DIR\backups\pre-install-$timestamp"
    Write-Host "[1/7] Backing up existing config..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $BACKUP -Force | Out-Null
    if (Test-Path "$CLAUDE_DIR\CLAUDE.md") { Copy-Item "$CLAUDE_DIR\CLAUDE.md" $BACKUP }
    if (Test-Path "$CLAUDE_DIR\settings.json") { Copy-Item "$CLAUDE_DIR\settings.json" $BACKUP }
    if (Test-Path "$CLAUDE_DIR\agents") { Copy-Item -Recurse "$CLAUDE_DIR\agents" "$BACKUP\agents" }
} else {
    Write-Host "[1/7] Fresh install." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $CLAUDE_DIR -Force | Out-Null
}

# CLAUDE.md
Write-Host "[2/7] Installing CLAUDE.md..." -ForegroundColor Yellow
Copy-Item "$SCRIPT_DIR\CLAUDE.md" "$CLAUDE_DIR\CLAUDE.md" -Force
(Get-Content "$CLAUDE_DIR\CLAUDE.md") -replace 'USERNAME', $USERNAME | Set-Content "$CLAUDE_DIR\CLAUDE.md"

# Agents
Write-Host "[3/7] Installing 34 agents..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$CLAUDE_DIR\agents" -Force | Out-Null
Copy-Item -Recurse "$SCRIPT_DIR\agents\*" "$CLAUDE_DIR\agents\" -Force

# Skills
Write-Host "[4/7] Installing skills..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$CLAUDE_DIR\skills" -Force | Out-Null
Copy-Item -Recurse "$SCRIPT_DIR\skills\*" "$CLAUDE_DIR\skills\" -Force

# Good Guys system
Write-Host "[5/7] Installing Good Guys system..." -ForegroundColor Yellow
foreach ($dir in @("good-guys", "shared", "commands", "hooks", "cream-labs")) {
    New-Item -ItemType Directory -Path "$CLAUDE_DIR\$dir" -Force | Out-Null
    Copy-Item -Recurse "$SCRIPT_DIR\$dir\*" "$CLAUDE_DIR\$dir\" -Force
}

# Settings
Write-Host "[6/7] Installing settings..." -ForegroundColor Yellow
Copy-Item "$SCRIPT_DIR\settings.json" "$CLAUDE_DIR\settings.json" -Force
(Get-Content "$CLAUDE_DIR\settings.json") -replace 'USERNAME', $USERNAME | Set-Content "$CLAUDE_DIR\settings.json"

# Setup wizard
Write-Host "[7/7] Installing setup wizard..." -ForegroundColor Yellow
if (Test-Path "$SCRIPT_DIR\setup-wizard.cjs") { Copy-Item "$SCRIPT_DIR\setup-wizard.cjs" "$CLAUDE_DIR\setup-wizard.cjs" }
if (Test-Path "$SCRIPT_DIR\package.json") { Copy-Item "$SCRIPT_DIR\package.json" "$CLAUDE_DIR\package.json" }

Write-Host ""
Write-Host "  Good Guys installed!" -ForegroundColor Green
Write-Host "  Run: node ~/.claude/setup-wizard.cjs" -ForegroundColor Green
Write-Host "  Then try: /gg:help" -ForegroundColor Green
Write-Host ""
