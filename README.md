# Good Guys — Your AI Development Crew

```
        ╭─~─~─~─~─~─╮
       ╱ ~#~#~#~#~#~  ╲          ___                _    ___
      ╱  ~#~#~#~#~#~#~ ╲        / __|___ ___  _  __| |  / __|_  _ _  _ ___
     {  ~#~#~#~#~#~#~#~  }     | (_ / _ \ _ \| |/ _` | | (_ | || | || (_-<
      ╰┬────────────────┬╯      \___\___\___/ \__\__,_|  \___|\_,_|\_, /__/
       │  ◉    ‿    ◉   │                                           |__/
       │  · ·    · ·    │       Your AI Development Crew — v2.0.0
       │    ╰──────╯    │       ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
       ╰───────┬┬───────╯       34 agents · 67 skills · 13 swarms
          ┌────┘└────┐          52 commands · opus/sonnet/haiku
          │ G O O D  │
          │ G U Y S  │          "Hi, I'm your buddy!
          └──┬────┬──┘           Wanna build something?"
             │    │
            ═╯    ╰═
```

> A unified AI agent system for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that combines **34 specialized agents**, **67 skills**, **13 skill swarms**, and **52 commands** into a single `/gg:*` namespace.

## Quick Install

### Unix / macOS / Git Bash (Windows)
```bash
curl -fsSL https://raw.githubusercontent.com/aila-lab/claude-config-pack/main/install.sh | bash
```

### PowerShell (Windows)
```powershell
irm https://raw.githubusercontent.com/aila-lab/claude-config-pack/main/install.ps1 | iex
```

After install, run the setup wizard:
```bash
node ~/.claude/setup-wizard.cjs
```

## What's Inside

### 34 AI Agents

| Category | Agents |
|----------|--------|
| **Leadership** | gg-team-lead, gg-delegation, gg-prompt-engineer |
| **Development** | gg-frontend, gg-backend, gg-mobile, gg-designer, gg-api-architect, gg-database-architect |
| **Quality** | gg-qa, gg-cybersecurity, gg-performance |
| **AI/ML** | gg-ai-ml |
| **DevOps** | gg-devops |
| **Research** | gg-research, gg-innovation |
| **Creative** | gg-website-builder, gg-social-media, gg-video-producer, gg-motion-designer |
| **Meta** | gg-skill-hunter, gg-skill-activator |
| **Lifecycle** | gg-planner, gg-executor, gg-verifier, gg-debugger, gg-roadmapper, +6 more |
| **Support** | gg-code-reviewer, gg-memory-keeper |

### 67 Skills (Highlights)

`brainstorming` · `test-driven-development` · `systematic-debugging` · `frontend-design` · `ui-ux-pro-max` · `d3js-visualization` · `remotion` · `webapp-testing` · `prd` · `ralph` · `doc-coauthoring` · `pdf` · `pptx` · `xlsx` · `canvas-design` · `content-research-writer` · `algorithmic-art` · and 50+ more

### 13 Skill Swarms

| Swarm | Triggers |
|-------|----------|
| **Document Factory** | document, pdf, pptx, excel |
| **Security Fortress** | security audit, OWASP, pentest |
| **Design Studio** | design, UI, mockup, wireframe |
| **Full-Stack Builder** | full-stack, CRUD, feature |
| **Data Visualization** | chart, dashboard, data viz |
| **Code Quality Gate** | code review, PR review |
| **Content Machine** | blog, article, documentation |
| **Creative Lab** | art, animation, generative |
| **Testing Fortress** | test suite, coverage, e2e |
| **Autonomous Builder** | PRD, ralph, user story |
| **API Discovery** | API bul, free API |
| **Video Production** | video, remotion |
| **Communication Hub** | slack, team communication |

### 52 Commands (`/gg:*`)

**Lifecycle:** plan, execute, discuss, research, verify, pause, resume, progress, quick, debug, new-project, new-milestone, add-phase, insert-phase, remove-phase, map-codebase, health, settings, set-profile, update, cleanup, complete-milestone, audit-milestone, plan-milestone-gaps, add-todo, check-todos, list-phase-assumptions, reapply-patches, help, join-discord

**Specialists:** frontend, backend, designer, qa, cybersecurity, performance, devops, team-lead, delegation, prompt-engineer, research, research-agent, innovation, ai-ml, mobile, motion-designer, skill-hunter, skill-activator, social-media, video-producer, website-builder, database-architect, api-architect

## How It Works

```
User Intent (EN/TR)
       │
       ▼
┌─────────────┐
│ Auto-Detect  │──── Lifecycle? ──→ Workflow + Agent
│  & Route     │──── Specialist? ─→ Agent expertise
│              │──── Both? ───────→ Lifecycle orchestrates + specialist
│              │──── Swarm? ──────→ Skill chain auto-activates
└─────────────┘
       │
       ▼
┌─────────────┐
│ Quality Gate │ Zero TS errors · 80%+ coverage · Security review
└─────────────┘
       │
       ▼
    Output ✓
```

## Model Routing

| Tier | Model | Agents |
|------|-------|--------|
| **Leaders** | Opus | gg-planner, gg-roadmapper, gg-debugger, gg-team-lead, gg-delegation |
| **Helpers** | Sonnet | gg-executor, gg-verifier, gg-frontend, gg-backend, gg-qa, +15 more |
| **Quick** | Haiku | gg-codebase-mapper, gg-phase-researcher, gg-project-researcher, gg-research-synthesizer |

## Context Management

- **Auto-compact** at 70% context usage (no manual action needed)
- **Auto-pause** at 85% with state saved to `.planning/`
- Resume anytime with `/gg:resume` in a new conversation

## Cream Labs — Blockchain/Web3

Includes 8 blockchain skills and 4 senior specialists via `/cream:*` commands for Solidity, DeFi, wagmi, trading, and more.

## Contributing

1. Fork the repo
2. Create a feature branch
3. Make your changes
4. Submit a PR

## License

MIT

---

*Built with Claude Code. Inspired by everyone's favorite buddy.*
