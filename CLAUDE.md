# Unified Agent System — GSD + AI Development Team

Detect user intent automatically and invoke the correct system WITHOUT requiring slash commands.

---

## SYSTEM 1: GSD (Get Shit Done) — Project Lifecycle

### Paths
- Workflows: `C:/Users/ymeli/.claude/get-shit-done/workflows/`
- Templates: `C:/Users/ymeli/.claude/get-shit-done/templates/`
- References: `C:/Users/ymeli/.claude/get-shit-done/references/`
- GSD Agents: `C:/Users/ymeli/.claude/agents/`
- Tools CLI: `C:/Users/ymeli/.claude/get-shit-done/bin/gsd-tools.cjs`

### Intent Routing
When user input matches triggers, **immediately** read the workflow file and execute it.
**Full 26-command trigger list:** Read `C:/Users/ymeli/.claude/get-shit-done/references/gsd-triggers.md`

**Top commands (inline):**
- new project / yeni proje → `workflows/new-project.md` (+ prd/ralph integration)
- execute / kodla / uygula → `workflows/execute-phase.md` | Agent: gsd-executor (+ AI Team agents)
- plan / planla → `workflows/plan-phase.md` | Agent: gsd-planner
- verify / dogrula / test et → `workflows/verify-work.md` | Agent: gsd-verifier (+ QA/Security/Perf)
- quick / hizli gorev → `workflows/quick.md`
- debug / hata bul / bug → `workflows/debug.md` | Agent: gsd-debugger
- resume / devam et → `workflows/resume-project.md`
- pause / duraklat → `workflows/pause-work.md`
- progress / durum → `workflows/progress.md`

### Agent Types (Task tool subagent_type)
`gsd-planner` | `gsd-executor` | `gsd-plan-checker` | `gsd-phase-researcher` | `gsd-project-researcher` | `gsd-roadmapper` | `gsd-verifier` | `gsd-codebase-mapper` | `gsd-debugger` | `gsd-integration-checker` | `gsd-research-synthesizer`

---

## SYSTEM 2: AI Development Team — 22 Specialists

Base: `C:/Users/ymeli/.claude/ai-agents/`
**Full registry with triggers:** Read `C:/Users/ymeli/.claude/projects/C--Users-ymeli/memory/ai-agents-detail.md`

### Shared Resources (ALWAYS reference)
- **Tech Stack:** `shared/tech-stack.md` — Single source of truth for ALL technology choices
- **Comms Protocol:** `shared/communication-protocol.md` — Inter-agent message format

### Categories
- **Core:** team-lead, delegation-coordinator, prompt-engineer
- **Dev:** frontend, backend, mobile-specialist, designer, api-architect, database-architect
- **Quality:** qa, cybersecurity, performance-engineer
- **AI/ML:** ai-ml-engineer | **Ops:** devops
- **Research:** research-agent, innovation-scout | **Meta:** skill-hunter, skill-activator
- **Creative:** website-builder, social-media-creator, video-producer, motion-designer

---

## SYSTEM 3: Integration Bridge

### Rule 1: Auto-Detect & Route
1. Check GSD lifecycle intent → 2. Check AI Team specialist → 3. Both = GSD orchestrates + AI expertise → 4. Ambiguous = Team Lead routes

### Rule 2: Expert Loading
Auto-load relevant AI agents during GSD execution. **Full routing table:** Read `C:/Users/ymeli/.claude/projects/C--Users-ymeli/memory/integration-rules.md`

### Rule 3: Tech Stack = Law
ALWAYS reference `ai-agents/shared/tech-stack.md`. Never contradict it.

### Rule 4: Quality Gates (mandatory)
- [ ] Zero TypeScript errors
- [ ] All acceptance criteria met
- [ ] Unit tests >= 80% coverage
- [ ] Security review (if auth/payment/data)
- [ ] Conventional commit message

### Rule 5: Multi-Agent Flow
Team Lead → Delegation Coordinator → Specialists → QA → Security → Performance → GSD state

### Rule 6: Subagent Info Flow
Include: agent expertise (.md), tech stack ref, project state (.planning/STATE.md), comms protocol

### Rule 7: Parallel Experts
Multi-domain tasks → spawn parallel Task agents, merge via Delegation Coordinator

---

## SYSTEM 4: Skill Swarms — Auto-Chaining

Check swarm triggers BEFORE individual skill routing. Multiple swarms can activate simultaneously.
**Full 13-swarm definitions:** Read `C:/Users/ymeli/.claude/skills/SWARMS.md`

**Top swarms (inline):**
- document/belge/pdf/pptx → **Document Factory:** doc-coauthoring → format → theme → brand
- design/tasarla/UI yap → **Design Studio:** brainstorming → design-lab → ui-ux-pro-max → frontend-design → canvas
- full-stack/sayfa yap/CRUD → **Full-Stack Builder:** brainstorming → plan → TDD → frontend → vercel → debug → verify
- security/guvenlik → **Security Fortress:** 7 Trail of Bits skills chain + cybersecurity agent
- code review/kod incele → **Code Quality Gate:** review → duplicates → differential → second-opinion → spec → verify
- video/remotion → **Video Production:** brainstorming → remotion (37 rules) → d3js → canvas → gif
- PRD/ralph → **Autonomous Builder:** prd → ralph → plans → TDD → verify

**Rules:** Swarms stack | Order matters | Partial activation OK | GSD integration | Parallel via Task agents

---

## Execution Rules

1. **Auto-detect intent** — Match triggers, execute immediately
2. **Load before acting** — Always Read workflow/agent .md before execution
3. **Turkish + English** — All triggers work in both languages
4. **Pass arguments** — Extract phase numbers, descriptions, flags
5. **Slash commands work** — `/gsd:xxx` uses Skill tool
6. **CLI:** `node C:/Users/ymeli/.claude/get-shit-done/bin/gsd-tools.cjs <command>`
7. **State in .planning/** — GSD project state directory
8. **Agent file = expertise** — Reading .md = adopting full knowledge
9. **Tech stack is law** — Never contradict tech-stack.md
10. **Quality gates mandatory** — Never skip DoD for production code

## Context Management

- **>70% used:** Prefer subagents (Task tool) for complex work to conserve context
- **>80% used:** Stop new work. Run /compact or suggest new conversation
- **>85% used:** Run /gsd:pause-work to save state, then tell user to start new conversation with /gsd:resume-work
- **New conversation:** Always use /gsd:resume-work to restore previous state
