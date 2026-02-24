#!/usr/bin/env node
// Good Guys — Setup Wizard
// Interactive configuration for first-time install
// Zero external dependencies — uses only Node.js built-ins

const readline = require('readline');
const os = require('os');
const fs = require('fs');
const path = require('path');

const GREEN = '\x1b[32m';
const YELLOW = '\x1b[33m';
const CYAN = '\x1b[36m';
const BOLD = '\x1b[1m';
const DIM = '\x1b[2m';
const RESET = '\x1b[0m';

const USERNAME = os.userInfo().username;
const CLAUDE_DIR = path.join(os.homedir(), '.claude');

const BANNER = `
${CYAN}        ╭─~─~─~─~─~─╮
       ╱ ~#~#~#~#~#~  ╲          ___                _    ___
      ╱  ~#~#~#~#~#~#~ ╲        / __|___ ___  _  __| |  / __|_  _ _  _ ___
     {  ~#~#~#~#~#~#~#~  }     | (_ / _ \\ _ \\| |/ _\` | | (_ | || | || (_-<
      ╰┬────────────────┬╯      \\___\\___\\___/ \\__\\__,_|  \\___|\\_, _|\\_, /__/
       │  ◉    ‿    ◉   │                                      |__/
       │  · ·    · ·    │       ${BOLD}Setup Wizard${RESET}${CYAN}
       │    ╰──────╯    │       ━━━━━━━━━━━━━━━━━━━━━━━
       ╰───────┬┬───────╯       34 agents · 67 skills
          ┌────┘└────┐          13 swarms · 52 commands
          │ G O O D  │
          │ G U Y S  │
          └──┬────┬──┘
             │    │
            ═╯    ╰═${RESET}
`;

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on('close', () => {
  console.log(`\n${YELLOW}Setup cancelled.${RESET}`);
  process.exit(0);
});

function ask(question) {
  return new Promise((resolve) => {
    rl.question(question, (answer) => resolve(answer.trim()));
  });
}

async function menu(title, options, defaultIdx = 0) {
  console.log(`\n${BOLD}${title}${RESET}`);
  options.forEach((opt, i) => {
    const marker = i === defaultIdx ? `${GREEN}> ${RESET}` : '  ';
    const def = i === defaultIdx ? ` ${DIM}(default)${RESET}` : '';
    console.log(`${marker}${i + 1}. ${opt}${def}`);
  });
  const answer = await ask(`\n${CYAN}Select [1-${options.length}]: ${RESET}`);
  const idx = parseInt(answer, 10) - 1;
  if (isNaN(idx) || idx < 0 || idx >= options.length) return defaultIdx;
  return idx;
}

async function main() {
  console.clear();
  console.log(BANNER);
  console.log(`${GREEN}Welcome to Good Guys setup!${RESET}`);
  console.log(`${DIM}This will configure your Claude Code environment.${RESET}\n`);
  await ask(`${CYAN}Press Enter to continue...${RESET}`);

  // Step 1: Language
  const langIdx = await menu('Language Preference', ['English', 'Turkish (Turkce)', 'Both (recommended)'], 2);
  const lang = ['en', 'tr', 'both'][langIdx];

  // Step 2: Model Profile
  console.log(`\n${DIM}Model profiles control which AI model each agent uses:${RESET}`);
  console.log(`${DIM}  Quality  = Opus for leaders, Sonnet for helpers${RESET}`);
  console.log(`${DIM}  Balanced = Mix of Opus/Sonnet/Haiku${RESET}`);
  console.log(`${DIM}  Budget   = Sonnet + Haiku only${RESET}`);
  const profileIdx = await menu('Model Profile', ['Quality', 'Balanced (recommended)', 'Budget'], 1);
  const profile = ['quality', 'balanced', 'budget'][profileIdx];

  // Step 3: Auto-compact
  const compactIdx = await menu('Auto-Compact (saves context at 70% usage)', ['Enable (recommended)', 'Disable'], 0);
  const autoCompact = compactIdx === 0;

  // Summary
  console.log(`\n${'━'.repeat(50)}`);
  console.log(`${BOLD}Configuration Summary${RESET}`);
  console.log(`${'━'.repeat(50)}`);
  console.log(`  Language:      ${GREEN}${['English', 'Turkish', 'Both'][langIdx]}${RESET}`);
  console.log(`  Model Profile: ${GREEN}${['Quality', 'Balanced', 'Budget'][profileIdx]}${RESET}`);
  console.log(`  Auto-Compact:  ${GREEN}${autoCompact ? 'Enabled' : 'Disabled'}${RESET}`);
  console.log(`  User:          ${GREEN}${USERNAME}${RESET}`);
  console.log(`  Install Dir:   ${GREEN}${CLAUDE_DIR}${RESET}`);
  console.log(`${'━'.repeat(50)}\n`);

  const confirm = await ask(`${YELLOW}Apply this configuration? (Y/n): ${RESET}`);
  if (confirm.toLowerCase() === 'n') {
    console.log(`${YELLOW}Setup cancelled.${RESET}`);
    rl.close();
    return;
  }

  // Generate settings.json
  const settings = {
    autoUpdatesChannel: 'latest',
    hooks: {
      SessionStart: [{
        hooks: [{
          type: 'command',
          command: `node "C:/Users/${USERNAME}/.claude/hooks/gg-check-update.js"`,
        }],
      }],
      PostToolUse: [{
        hooks: [{
          type: 'command',
          command: `node "C:/Users/${USERNAME}/.claude/hooks/gg-context-monitor.js"`,
        }],
      }],
    },
    statusLine: {
      type: 'command',
      command: `node "C:/Users/${USERNAME}/.claude/hooks/gg-statusline.js"`,
    },
  };

  const settingsPath = path.join(CLAUDE_DIR, 'settings.json');
  fs.writeFileSync(settingsPath, JSON.stringify(settings, null, 2));
  console.log(`${GREEN}✓${RESET} settings.json written`);

  // Update CLAUDE.md with correct username
  const claudeMdPath = path.join(CLAUDE_DIR, 'CLAUDE.md');
  if (fs.existsSync(claudeMdPath)) {
    let content = fs.readFileSync(claudeMdPath, 'utf8');
    content = content.replace(/USERNAME/g, USERNAME);
    fs.writeFileSync(claudeMdPath, content);
    console.log(`${GREEN}✓${RESET} CLAUDE.md updated with username: ${USERNAME}`);
  }

  // Write config
  const configDir = path.join(CLAUDE_DIR, 'good-guys');
  if (fs.existsSync(configDir)) {
    const configPath = path.join(process.cwd(), '.planning', 'config.json');
    try {
      fs.mkdirSync(path.dirname(configPath), { recursive: true });
      fs.writeFileSync(configPath, JSON.stringify({ model_profile: profile }, null, 2));
      console.log(`${GREEN}✓${RESET} Model profile set to: ${profile}`);
    } catch (e) {
      // Not in a project dir, skip
    }
  }

  console.log(`\n${'━'.repeat(50)}`);
  console.log(`${GREEN}${BOLD}Good Guys is ready!${RESET}`);
  console.log(`${'━'.repeat(50)}`);
  console.log(`\nTry these commands in Claude Code:`);
  console.log(`  ${CYAN}/gg:help${RESET}        — Show all commands`);
  console.log(`  ${CYAN}/gg:new-project${RESET} — Start a new project`);
  console.log(`  ${CYAN}/gg:quick${RESET}       — Quick task execution`);
  console.log(`  ${CYAN}/gg:frontend${RESET}    — Frontend specialist`);
  console.log(`\n${DIM}"Hi, I'm your buddy! Wanna build something?" 🔪${RESET}\n`);

  rl.close();
}

main().catch((err) => {
  console.error(`${YELLOW}Error: ${err.message}${RESET}`);
  rl.close();
  process.exit(1);
});
