<!--
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
          │ ═══════  │
          │ G O O D  │          "Hi, I'm your buddy!
          │ G U Y S  │           Wanna build something?"
          │ ═══════  │
          └──┬────┬──┘
             │    │
            ═╯    ╰═
-->

# Good Guys — Unified AI Agent System

Detect user intent automatically and invoke the correct agent WITHOUT requiring slash commands.

╭─── 🎯 Intent Detection ──────────────────────────────────────╮
│ Say what you want in English or Turkish.                      │
│ Good Guys auto-routes to the right agent or skill swarm.      │
╰───────────────────────────────────────────────────────────────╯

╭─── 🤖 34 Specialist Agents ──────────────────────────────────╮
│ Leadership, Dev, Quality, AI/ML, DevOps, Research, Creative.  │
│ Each agent has deep domain expertise loaded from its .md file.│
╰───────────────────────────────────────────────────────────────╯

╭─── ⛓️ 13 Skill Swarms ───────────────────────────────────────╮
│ Auto-chaining skill pipelines: Design Studio, Full-Stack      │
│ Builder, Security Fortress, Video Production, and more.       │
╰───────────────────────────────────────────────────────────────╯

╭─── ✅ Quality Gates ──────────────────────────────────────────╮
│ Zero TS errors · 80%+ coverage · Security review · Commit msg │
│ Every production task passes mandatory quality checks.        │
╰───────────────────────────────────────────────────────────────╯

╭─── 🧠 Context Management ────────────────────────────────────╮
│ Auto-compact at 70%. Auto-pause at 85%.                       │
│ State preserved in .planning/ — resume anytime with /gg:resume│
╰───────────────────────────────────────────────────────────────╯

╭─── ⚡ Model Routing ──────────────────────────────────────────╮
│ Opus for leaders, Sonnet for helpers, Haiku for quick tasks.  │
│ Model param is MANDATORY on every Task() spawn.               │
╰───────────────────────────────────────────────────────────────╯

---

## Paths

- Workflows: `C:/Users/USERNAME/.claude/good-guys/workflows/`
- Templates: `C:/Users/USERNAME/.claude/good-guys/templates/`
- References: `C:/Users/USERNAME/.claude/good-guys/references/`
- Agents: `C:/Users/USERNAME/.claude/agents/`
- CLI: `C:/Users/USERNAME/.claude/good-guys/bin/gg-tools.cjs`
- Shared: `C:/Users/USERNAME/.claude/shared/`

---

## Intent Routing

When user input matches triggers, **immediately** read the workflow file and execute it.
**Full trigger list:** Read `C:/Users/USERNAME/.claude/good-guys/references/gg-triggers.md`

### Lifecycle Commands
| Trigger | Workflow | Agent |
|---------|----------|-------|
| new project / yeni proje | `workflows/new-project.md` | — |
| execute / kodla / uygula | `workflows/execute-phase.md` | gg-executor |
| plan / planla | `workflows/plan-phase.md` | gg-planner |
| verify / dogrula / test et | `workflows/verify-work.md` | gg-verifier |
| quick / hizli gorev | `workflows/quick.md` | — |
| debug / hata bul / bug | `workflows/debug.md` | gg-debugger |
| resume / devam et | `workflows/resume-project.md` | — |
| pause / duraklat | `workflows/pause-work.md` | — |
| progress / durum | `workflows/progress.md` | — |

### Specialist Commands
Use `/gg:<specialist>` to invoke directly: `/gg:frontend`, `/gg:backend`, `/gg:designer`, `/gg:qa`, `/gg:cybersecurity`, `/gg:devops`, `/gg:team-lead`, `/gg:delegation`, `/gg:research`, `/gg:ai-ml`, etc.

### Agent Types (Task tool subagent_type)
`gg-planner` | `gg-executor` | `gg-plan-checker` | `gg-phase-researcher` | `gg-project-researcher` | `gg-roadmapper` | `gg-verifier` | `gg-codebase-mapper` | `gg-debugger` | `gg-integration-checker` | `gg-research-synthesizer`

---

## Agent Registry — 34 Agents

### Leadership
| Agent | Role |
|-------|------|
| `gg-team-lead` | Sprint planning, architectural decisions, team coordination |
| `gg-delegation` | Task breakdown, work distribution, multi-agent orchestration |
| `gg-prompt-engineer` | AI prompt optimization, system prompt crafting |

### Development
| Agent | Role |
|-------|------|
| `gg-frontend` | React, Next.js, UI components, state management |
| `gg-backend` | API development, server logic, authentication |
| `gg-mobile` | React Native, iOS, Android |
| `gg-designer` | UI/UX design, wireframes, design systems |
| `gg-api-architect` | API design, REST/GraphQL/gRPC |
| `gg-database-architect` | Schema design, migrations, SQL optimization |

### Quality
| Agent | Role |
|-------|------|
| `gg-qa` | Testing strategy, code review, quality assurance |
| `gg-cybersecurity` | Security review, OWASP, vulnerability analysis |
| `gg-performance` | Performance optimization, profiling, caching |

### AI/ML & Ops
| Agent | Role |
|-------|------|
| `gg-ai-ml` | Machine learning, RAG, embeddings, LLM integration |
| `gg-devops` | CI/CD, Docker, Kubernetes, deployment |

### Research & Meta
| Agent | Role |
|-------|------|
| `gg-research` | Market research, competitive analysis |
| `gg-innovation` | Technology trends, emerging tech |
| `gg-skill-hunter` | Find new skills, discover libraries |
| `gg-skill-activator` | Install skills, configure tools |

### Creative
| Agent | Role |
|-------|------|
| `gg-website-builder` | Landing pages, web sites, SEO |
| `gg-social-media` | Content creation, social strategy |
| `gg-video-producer` | Video production, storyboards |
| `gg-motion-designer` | Animations, Framer Motion, Lottie |

### Lifecycle
| Agent | Role |
|-------|------|
| `gg-planner` | Phase planning with verification loop |
| `gg-executor` | Wave-based parallel execution |
| `gg-debugger` | Systematic debugging with persistent state |
| `gg-verifier` | Feature validation through UAT |
| `gg-roadmapper` | Milestone roadmap creation |
| `gg-codebase-mapper` | Codebase analysis and documentation |
| `gg-plan-checker` | Plan quality verification |
| `gg-phase-researcher` | Phase-specific research |
| `gg-project-researcher` | Project-wide research |
| `gg-research-synthesizer` | Research result synthesis |
| `gg-integration-checker` | Integration verification |

### Support
| Agent | Role |
|-------|------|
| `gg-code-reviewer` | Code review and quality checks |
| `gg-memory-keeper` | Session memory persistence |

---

## Shared Resources (ALWAYS reference)

- **Tech Stack:** `shared/tech-stack.md` — Single source of truth for ALL technology choices
- **Comms Protocol:** `shared/communication-protocol.md` — Inter-agent message format

---

## Integration Rules

### Rule 1: Auto-Detect & Route
1. Check lifecycle intent → 2. Check specialist → 3. Both = lifecycle orchestrates + specialist expertise → 4. Ambiguous = Team Lead routes

### Rule 2: Expert Loading
Auto-load relevant agents during execution based on task domain (frontend → gg-frontend, security → gg-cybersecurity, etc.)

### Rule 3: Tech Stack = Law
ALWAYS reference `shared/tech-stack.md`. Never contradict it.

### Rule 4: Quality Gates (mandatory)
- [ ] Zero TypeScript errors
- [ ] All acceptance criteria met
- [ ] Unit tests >= 80% coverage
- [ ] Security review (if auth/payment/data)
- [ ] Conventional commit message

### Rule 5: Multi-Agent Flow
gg-team-lead → gg-delegation → Specialists → gg-qa → gg-cybersecurity → gg-performance → state update

### Rule 6: Subagent Info Flow
Include: agent expertise (.md), tech stack ref, project state (.planning/STATE.md), comms protocol

### Rule 7: Parallel Experts
Multi-domain tasks → spawn parallel Task agents, merge via gg-delegation

---

## Skill Swarms — Auto-Chaining (13 Swarms)

Check swarm triggers BEFORE individual skill routing. Multiple swarms can activate simultaneously.
**Full definitions:** Read `C:/Users/USERNAME/.claude/skills/SWARMS.md`

| Swarm | Triggers | Chain |
|-------|----------|-------|
| Document Factory | document, belge, pdf, pptx | doc-coauthoring → format → theme → brand |
| Security Fortress | guvenlik, security audit, OWASP | 7 Trail of Bits skills + gg-cybersecurity |
| Design Studio | tasarla, design, UI yap | brainstorming → design-lab → ui-ux-pro-max → frontend-design → canvas |
| Full-Stack Builder | full-stack, sayfa yap, CRUD | brainstorming → plan → TDD → frontend → vercel → debug → verify |
| Data Visualization | grafik, chart, dashboard | d3js → xlsx → ui-ux-pro-max → canvas |
| Code Quality Gate | code review, kod incele | review → duplicates → differential → second-opinion → spec → verify |
| Content Machine | icerik yaz, blog, documentation | content-research-writer → doc-coauthoring → format |
| Creative Lab | sanat, art, animation | brainstorming → algorithmic-art → canvas → gif |
| Testing Fortress | test suite, coverage, e2e | TDD → property-testing → webapp-testing → debug → verify |
| Communication Hub | slack, team communication | slack-messaging → internal-comms → skill-share |
| Autonomous Builder | PRD, ralph, user story | prd → ralph → plans → TDD → verify |
| API Discovery | API bul, API ara | public-apis-reference → mcp-builder → plans |
| Video Production | video yap, remotion | brainstorming → remotion → d3js → canvas → gif |

**Rules:** Swarms stack | Order matters | Partial activation OK | Parallel via Task agents

---

## Cream Labs — Blockchain/Web3 + Senior Specialists

Base: `C:/Users/USERNAME/.claude/cream-labs/`
Commands: `/cream:<name>`

### Blockchain Skills
| Command | Triggers |
|---------|----------|
| `/cream:wagmi` | wagmi, viem, web3 hook |
| `/cream:defi` | defi, staking, AMM, governance |
| `/cream:solidity` | solidity, smart contract, foundry |
| `/cream:solidity-audit` | audit, contract audit |
| `/cream:token-analyzer` | token analiz, ERC20 check |
| `/cream:dex-router` | dex, swap route |
| `/cream:wallet` | wallet, cuzdan |
| `/cream:trading` | cream, social trading |

### Senior Specialists
| Command | Role | Hierarchy |
|---------|------|-----------|
| `/cream:architect` | System Architect | LEADS arch → `/gg:api-architect` assists |
| `/cream:fullstack` | Fullstack Dev | Orchestrates `/gg:frontend` + `/gg:backend` |
| `/cream:api-integrator` | API Integrator | Complements `/gg:api-architect` |
| `/cream:security-compliance` | Security Compliance | LEADS compliance → `/gg:cybersecurity` assists |

---

## Model Routing — MANDATORY

**Every agent/subagent spawn MUST include the model parameter.**

### Opus — Leaders & Decision Makers
Architecture decisions, planning, orchestration.
- `gg-planner`, `gg-roadmapper`, `gg-debugger`
- `gg-team-lead`, `gg-delegation`
- Complex architectural analysis, critical bug fixes

### Sonnet — Helper Agents
Implementation, code writing, review, research.
- `gg-executor`, `gg-verifier`, `gg-plan-checker`, `gg-integration-checker`
- `gg-frontend`, `gg-backend`, `gg-designer`, `gg-qa`, `gg-cybersecurity`, `gg-performance`
- `gg-api-architect`, `gg-database-architect`, `gg-mobile`, `gg-devops`
- `gg-prompt-engineer`, `gg-research`, `gg-innovation`
- `gg-website-builder`, `gg-social-media`, `gg-video-producer`, `gg-motion-designer`
- `gg-skill-hunter`, `gg-skill-activator`, `gg-ai-ml`
- Explore agent, general-purpose agent

### Haiku — Quick Tasks
Simple reads, pattern extraction, file scanning, format conversion.
- `gg-codebase-mapper`, `gg-phase-researcher`, `gg-project-researcher`, `gg-research-synthesizer`
- Single file read/search tasks
- Simple format/lint checks

### Rule
```
Task(subagent_type="...", model="opus|sonnet|haiku")
                                 ↑ ALWAYS specify
```

---

## Execution Rules

1. **Auto-detect intent** — Match triggers, execute immediately
2. **Load before acting** — Always Read workflow/agent .md before execution
3. **Turkish + English** — All triggers work in both languages
4. **Pass arguments** — Extract phase numbers, descriptions, flags
5. **Slash commands work** — `/gg:xxx` uses Skill tool
6. **CLI:** `node C:/Users/USERNAME/.claude/good-guys/bin/gg-tools.cjs <command>`
7. **State in .planning/** — Project state directory
8. **Agent file = expertise** — Reading .md = adopting full knowledge
9. **Tech stack is law** — Never contradict tech-stack.md
10. **Quality gates mandatory** — Never skip DoD for production code
11. **Model routing mandatory** — Always pass model parameter when spawning agents

---

## Context Management — AUTO-COMPACT SYSTEM

**CRITICAL: Context reaches 70% → /compact runs AUTOMATICALLY. No permission needed.**

### Thresholds
- **>65% used:** Prefer subagents (Task tool) for complex work. Keep responses concise.
- **>70% used (AUTO-COMPACT):** IMMEDIATELY run /compact. Tell user "Context %70 doldu, otomatik sikistirma yapiyorum..." then execute.
- **>75% used:** If compact already ran, run /compact again.
- **>85% used:** Run /gg:pause to save state, then tell user to start new conversation with /gg:resume.
- **New conversation:** Always use /gg:resume to restore previous state.

### Memory Auto-Save — MANDATORY
After every major task completion, spawn gg-memory-keeper agent (haiku model) to save:
- New project decisions, config changes, setups
- Learned errors and solutions
- User preferences
