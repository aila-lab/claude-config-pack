# Claude Code Config Pack

**68 Skills + 22 AI Agents + 12 Cream Labs Blockchain Skills + 31 GSD Commands + 13 Skill Swarms** — A complete, production-ready configuration for Claude Code that transforms it into a full AI development team with autonomous execution capabilities.

## What's Inside

### Layer 1: GSD (Get Shit Done) — Project Lifecycle Engine
31 commands for managing the full project lifecycle: planning, execution, verification, and state tracking.

| Command | What it does |
|---------|-------------|
| `/gsd:new-project` | Initialize project with deep context gathering |
| `/gsd:plan-phase` | Create detailed implementation plans |
| `/gsd:execute-phase` | Execute plans with wave-based parallelization |
| `/gsd:verify-work` | Validate features through conversational UAT |
| `/gsd:debug` | Systematic debugging with persistent state |
| `/gsd:progress` | Check project status and route to next action |
| ... | 25 more commands for full lifecycle management |

### Layer 2: AI Development Team — 22 Specialist Agents
Domain-specific agents that provide expert knowledge during implementation.

| Category | Agents |
|----------|--------|
| **Core** | Team Lead, Delegation Coordinator, Prompt Engineer |
| **Development** | Frontend, Backend, Mobile, Designer, API Architect, Database Architect |
| **Quality** | QA, Cybersecurity, Performance Engineer |
| **AI/ML** | AI/ML Engineer |
| **Ops** | DevOps |
| **Research** | Research, Innovation Scout |
| **Meta** | Skill Hunter, Skill Activator |
| **Creative** | Website Builder, Social Media, Video Producer, Motion Designer |

### Layer 3: Skills Library — 68 Skills
Specialized capabilities from multiple sources.

| Source | Count | Key Skills |
|--------|-------|------------|
| **Anthropic Official** | 9 | docx, pdf, pptx, xlsx, frontend-design, canvas-design, brand-guidelines, mcp-builder, webapp-testing |
| **Superpowers (obra)** | 16 | TDD, systematic-debugging, brainstorming, code-review, subagent-dev, git-worktrees |
| **Superpowers Lab** | 4 | finding-duplicate-functions, mcp-cli, slack-messaging, tmux |
| **Trail of Bits Security** | 11 | static-analysis, variant-analysis, semgrep-rules, audit-context, entry-point-analyzer |
| **Vercel** | 4 | React best-practices (57 rules), composition-patterns, React Native, web-design |
| **Remotion** | 1 | React video creation (37 rule files: animations, 3D, captions, charts, audio) |
| **Ralph (snarktank)** | 2 | PRD generator, autonomous agent loop (prd.json) |
| **Obsidian (kepano)** | 5 | Obsidian markdown, bases, canvas, CLI, defuddle |
| **UI/UX Pro Max** | 1 | 67 styles, 96 color palettes, 57 font pairings, BM25 search |
| **Public APIs** | 1 | 1500+ free API catalog across 51 categories |
| **Others** | 14 | design-lab, skill-creator, d3js, file-organizer, changelog, content-writer, resume, twitter, etc. |

### Layer 5: Cream Labs — Blockchain/Web3 + Senior Specialists
12 specialized skills from [hexcantcode/cream-labs](https://github.com/hexcantcode/cream-labs) for blockchain development, smart contract security, and DeFi protocols. Includes lead/assistant hierarchy for overlapping domains.

| Category | Commands | What it does |
|----------|----------|-------------|
| **Blockchain** | `/cream:wagmi` | Wagmi/Viem React hooks, TanStack Query for Web3 |
| | `/cream:solidity` | Smart contract development with Foundry framework |
| | `/cream:defi` | DeFi protocol templates (staking, AMM, governance, flash loans) |
| | `/cream:solidity-audit` | Contract security auditing (OWASP SC Top 10) |
| | `/cream:token-analyzer` | ERC20/721 conformity, Trail of Bits checklist |
| | `/cream:dex-router` | DEX trade routing (1inch, Paraswap, 0x) |
| | `/cream:wallet` | Coinbase CDP wallet on Base L2 |
| | `/cream:trading` | CREAM social trading fund management |
| **Senior Specialists** | `/cream:architect` | System architecture (LEADS over `/ai:api-architect`) |
| | `/cream:fullstack` | End-to-end dev (orchestrates frontend + backend) |
| | `/cream:api-integrator` | 3rd-party API integration (OAuth, webhooks) |
| | `/cream:security-compliance` | Enterprise compliance (LEADS: SOC2, ISO27001, GDPR, HIPAA) |

**Conflict Resolution:** When domains overlap, the stronger agent leads and the other assists. See CLAUDE.md SYSTEM 5 for the full hierarchy matrix.

### Layer 4: Skill Swarms — 13 Auto-Chains
Predefined skill combinations that auto-activate based on task patterns.

| Swarm | Triggers | Chain |
|-------|----------|-------|
| **Document Factory** | belge, document, rapor | doc-coauthoring → docx/pdf/pptx/xlsx → theme → brand |
| **Security Fortress** | guvenlik, security audit | 7-step Trail of Bits security pipeline |
| **Design Studio** | tasarla, design, UI | brainstorming → design-lab → ui-ux-pro-max → frontend-design |
| **Full-Stack Builder** | full-stack, sayfa yap | plan → TDD → frontend → React best-practices → verify |
| **Data Visualization** | grafik, chart, dashboard | d3js → xlsx → ui-ux-pro-max → canvas-design |
| **Code Quality Gate** | code review, kod incele | review → duplicate-check → security-diff → verify |
| **Content Machine** | icerik yaz, blog | research → co-authoring → internal-comms → export |
| **Creative Lab** | sanat, art, generative | brainstorming → algorithmic-art → canvas → gif |
| **Testing Fortress** | test suite, coverage | TDD → property-testing → E2E → debug → verify |
| **Communication Hub** | slack, mesaj | slack-messaging → internal-comms → skill-share |
| **Autonomous Builder** | PRD yaz, ralph | prd → ralph → writing-plans → TDD → verify |
| **API Discovery** | API bul, hangi API | public-apis-reference → mcp-builder → plans |
| **Video Production** | video yap, remotion | brainstorming → remotion (37 rules) → d3js → canvas |

## Installation

### Quick Install (Linux/macOS)
```bash
git clone https://github.com/aila-lab/claude-config-pack.git
cd claude-config-pack
chmod +x install.sh
./install.sh
```

### Quick Install (Windows PowerShell)
```powershell
git clone https://github.com/aila-lab/claude-config-pack.git
cd claude-config-pack
.\install.ps1
```

### Manual Install
Copy the directories to `~/.claude/`:
```bash
cp CLAUDE.md ~/.claude/
cp -r skills/ ~/.claude/skills/
cp -r ai-agents/ ~/.claude/ai-agents/
cp -r cream-labs/ ~/.claude/cream-labs/
cp -r agents/ ~/.claude/agents/
cp -r get-shit-done/ ~/.claude/get-shit-done/
cp -r commands/ ~/.claude/commands/
cp -r hooks/ ~/.claude/hooks/
```

### Post-Install: Update Paths
The `CLAUDE.md` file uses `C:/Users/ymeli/` as the home directory. Update all paths to match your system:

```bash
# Linux/macOS
sed -i "s|C:/Users/ymeli|$HOME|g" ~/.claude/CLAUDE.md

# macOS (BSD sed)
sed -i '' "s|C:/Users/ymeli|$HOME|g" ~/.claude/CLAUDE.md
```

## How It Works

### Auto-Intent Detection
Just describe what you need in natural language (Turkish or English). The system automatically routes to the correct agents and skills:

```
"Login sayfasi yap" → Full-Stack Builder swarm + Frontend + Backend + Security agents
"Guvenlik taramasi yap" → Security Fortress swarm + Trail of Bits skills + Cybersecurity agent
"PRD yaz" → Autonomous Builder swarm + Team Lead + prd skill
"API bul" → API Discovery swarm + API Architect + public-apis catalog
"Smart contract yaz" → Cream solidity + defi templates + security audit
"Token analiz et" → Cream token-analyzer + solidity-audit + Trail of Bits
"DEX swap route" → Cream dex-router + wallet + trading
```

### Quality Gates (Automatic)
Every implementation task enforces:
- Zero TypeScript errors
- Unit tests >= 80% coverage
- Security review for auth/payment/data
- Performance within budget for critical paths
- Conventional commit messages

### Slash Commands Still Work
All GSD commands (`/gsd:plan-phase`, `/gsd:execute-phase`, etc.), AI agent commands (`/ai:frontend`, `/ai:backend`, etc.), and Cream Labs commands (`/cream:solidity`, `/cream:defi`, etc.) are available as slash commands.

## Architecture

```
~/.claude/
├── CLAUDE.md                  # Unified Router (5 systems + intent detection)
├── skills/                    # 68 skills
│   ├── docx/                  # Word documents
│   ├── remotion/              # React video (37 rules)
│   ├── tob-static-analysis/   # Trail of Bits security
│   ├── ui-ux-pro-max/         # Design intelligence
│   └── ...
├── ai-agents/                 # 22 specialist agents
│   ├── core/                  # Team Lead, Delegation, Prompt Engineer
│   ├── development/           # Frontend, Backend, Mobile, Designer, API, DB
│   ├── quality/               # QA, Cybersecurity, Performance
│   ├── creative/              # Website, Social, Video, Motion
│   └── shared/                # Tech stack, communication protocol
├── cream-labs/                # 12 blockchain/Web3 + senior specialist skills
│   ├── blockchain/            # Wagmi, Solidity, DeFi, DEX, Wallet, Trading
│   ├── development/           # Senior Architect, Backend, Frontend, Fullstack
│   ├── security/              # Security Compliance, Senior Security
│   ├── quality/               # UI Design System
│   └── meta/                  # Meta engineering orchestrators
├── get-shit-done/             # GSD system
│   ├── workflows/             # 31 workflow definitions
│   ├── templates/             # Project templates
│   ├── references/            # Questioning, UI brand guides
│   └── bin/                   # gsd-tools.cjs CLI
├── agents/                    # GSD agent definitions
├── commands/                  # Slash command definitions (ai/, gsd/, cream/)
└── hooks/                     # Git hooks
```

## Skill Sources & Credits

| Source | Repository | License |
|--------|-----------|---------|
| Anthropic Skills | [anthropics/skills](https://github.com/anthropics/skills) | MIT |
| Superpowers | [obra/superpowers](https://github.com/obra/superpowers) | MIT |
| Superpowers Lab | [obra/superpowers-lab](https://github.com/obra/superpowers-lab) | MIT |
| Trail of Bits | [trailofbits/skills](https://github.com/trailofbits/skills) | - |
| Vercel | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT |
| Remotion | [remotion-dev/skills](https://github.com/remotion-dev/skills) | - |
| Ralph | [snarktank/ralph](https://github.com/snarktank/ralph) | MIT |
| Obsidian | [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills) | MIT |
| UI/UX Pro Max | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nicholasxuu/ui-ux-pro-max-skill) | MIT |
| Public APIs | [public-apis/public-apis](https://github.com/public-apis/public-apis) | MIT |
| Awesome Claude Skills | [ComposioHQ/awesome-claude-skills](https://github.com/anthropics/skills) | MIT |
| Design Lab | [0xdesign/design-lab](https://github.com/0xdesign/design-lab) | MIT |
| D3.js Viz | [chrisvoncsefalvay/claude-d3js-skill](https://github.com/chrisvoncsefalvay/claude-d3js-skill) | MIT |
| GSD | [obra/gsd](https://github.com/obra/gsd) | MIT |
| Cream Labs | [hexcantcode/cream-labs](https://github.com/hexcantcode/cream-labs) | - |

## License

This configuration pack is a curated collection. Individual skills and agents retain their original licenses. The integration layer (CLAUDE.md, swarm rules, agent orchestration) is MIT licensed.
