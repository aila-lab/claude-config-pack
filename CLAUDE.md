# Unified Agent System — GSD + AI Development Team

You operate TWO integrated agent systems that work together seamlessly. Detect user intent automatically and invoke the correct system WITHOUT requiring slash commands.

---

## SYSTEM 1: GSD (Get Shit Done) — Project Lifecycle Engine

Manages the project lifecycle: planning, execution, verification, state tracking.

### GSD Paths
- Workflows: `C:/Users/ymeli/.claude/get-shit-done/workflows/`
- Templates: `C:/Users/ymeli/.claude/get-shit-done/templates/`
- References: `C:/Users/ymeli/.claude/get-shit-done/references/`
- GSD Agents: `C:/Users/ymeli/.claude/agents/`
- Tools CLI: `C:/Users/ymeli/.claude/get-shit-done/bin/gsd-tools.cjs`

### GSD Intent Routing

When user input matches triggers, **immediately** read the workflow file and execute it.

#### 1. NEW PROJECT
**Triggers:** "yeni proje", "new project", "projeyi baslat", "initialize project", "proje kur"
**Workflow:** `workflows/new-project.md` | **Also:** `references/questioning.md`, `references/ui-brand.md`, `templates/project.md`, `templates/requirements.md`
**INTEGRATION:** After PROJECT.md created, offer `prd` skill for feature PRDs → `ralph` skill for autonomous execution

#### 2. NEW MILESTONE
**Triggers:** "yeni milestone", "new milestone", "sonraki versiyon", "next version", "v2"
**Workflow:** `workflows/new-milestone.md`

#### 3. PLAN PHASE
**Triggers:** "faz planla", "plan phase", "planla", "plan yap", "plan olustur"
**Workflow:** `workflows/plan-phase.md` | **Agent:** gsd-planner

#### 4. EXECUTE PHASE
**Triggers:** "calistir", "execute", "fazı calistir", "implement", "kodla", "uygula"
**Workflow:** `workflows/execute-phase.md` | **Agent:** gsd-executor
**INTEGRATION:** Before execution, load relevant AI Team agent expertise (see System 2 routing below)

#### 5. DISCUSS PHASE
**Triggers:** "fazi tartis", "discuss phase", "tartisalim", "faz hakkinda konusalim"
**Workflow:** `workflows/discuss-phase.md`

#### 6. RESEARCH PHASE
**Triggers:** "arastir", "research", "fazi arastir", "inceleme yap"
**Workflow:** `workflows/research-phase.md` | **Agent:** gsd-phase-researcher

#### 7. VERIFY WORK
**Triggers:** "dogrula", "verify", "kontrol et", "test et", "calisiyor mu", "UAT"
**Workflow:** `workflows/verify-work.md` | **Agent:** gsd-verifier
**INTEGRATION:** Load QA + Cybersecurity + Performance agent expertise for comprehensive verification

#### 8. QUICK TASK
**Triggers:** "hizli gorev", "quick task", "hizlica yap", "quick"
**Workflow:** `workflows/quick.md`

#### 9. PROGRESS CHECK
**Triggers:** "durum", "progress", "neredeyiz", "ilerleme", "ne durumda", "status", "ozet"
**Workflow:** `workflows/progress.md`

#### 10. MAP CODEBASE
**Triggers:** "kodu analiz et", "map codebase", "codebase analiz", "kod yapisi"
**Workflow:** `workflows/map-codebase.md` | **Agent:** gsd-codebase-mapper

#### 11. ADD PHASE
**Triggers:** "faz ekle", "add phase", "yeni faz"
**Workflow:** `workflows/add-phase.md`

#### 12. INSERT PHASE
**Triggers:** "acil faz ekle", "insert phase", "araya faz ekle"
**Workflow:** `workflows/insert-phase.md`

#### 13. REMOVE PHASE
**Triggers:** "faz sil", "remove phase", "fazi kaldir"
**Workflow:** `workflows/remove-phase.md`

#### 14. ADD TODO
**Triggers:** "todo ekle", "not al", "bunu kaydet", "add todo", "sonra yap"
**Workflow:** `workflows/add-todo.md`

#### 15. CHECK TODOS
**Triggers:** "todolara bak", "check todos", "yapilacaklar", "todo list", "bekleyen isler"
**Workflow:** `workflows/check-todos.md`

#### 16. DEBUG
**Triggers:** "debug", "hata bul", "bug var", "sorun var", "calismıyor", "hata ayikla"
**Workflow:** `workflows/debug.md` | **Agent:** gsd-debugger

#### 17. PAUSE WORK
**Triggers:** "duraklat", "pause", "ara ver", "sonra devam"
**Workflow:** `workflows/pause-work.md`

#### 18. RESUME WORK
**Triggers:** "devam et", "resume", "kaldigim yerden", "nerede kalmistik"
**Workflow:** `workflows/resume-project.md`

#### 19. HEALTH CHECK
**Triggers:** "saglik kontrolu", "health", "health check"
**Workflow:** `workflows/health.md`

#### 20. SETTINGS
**Triggers:** "ayarlar", "settings", "gsd ayar", "konfigurasyon"
**Workflow:** `workflows/settings.md`

#### 21. SET PROFILE
**Triggers:** "profil degistir", "set profile", "model profili"
**Workflow:** `workflows/set-profile.md`

#### 22. COMPLETE MILESTONE
**Triggers:** "milestone tamamla", "complete milestone", "versiyon kapat"
**Workflow:** `workflows/complete-milestone.md`

#### 23. AUDIT MILESTONE
**Triggers:** "milestone denetle", "audit milestone"
**Workflow:** `workflows/audit-milestone.md` | **Agent:** gsd-integration-checker

#### 24. PLAN MILESTONE GAPS
**Triggers:** "eksikleri planla", "plan gaps", "eksik fazlari olustur"
**Workflow:** `workflows/plan-milestone-gaps.md`

#### 25. LIST PHASE ASSUMPTIONS
**Triggers:** "varsayimlar", "assumptions", "ne varsayiyorsun"
**Workflow:** `workflows/list-phase-assumptions.md`

#### 26. CLEANUP
**Triggers:** "temizle", "cleanup", "arsivle"
**Workflow:** `workflows/cleanup.md`

### GSD Agent Types (Task tool subagent_type)
`gsd-planner` | `gsd-executor` | `gsd-plan-checker` | `gsd-phase-researcher` | `gsd-project-researcher` | `gsd-roadmapper` | `gsd-verifier` | `gsd-codebase-mapper` | `gsd-debugger` | `gsd-integration-checker` | `gsd-research-synthesizer`

---

## SYSTEM 2: AI Development Team — 22 Specialist Agents

Expert agents that provide domain-specific knowledge and implementation guidance. Each agent's full skill set is defined in its markdown file.

### AI Team Base Path
`C:/Users/ymeli/.claude/ai-agents/`

### Shared Resources (ALWAYS reference these)
- **Tech Stack:** `C:/Users/ymeli/.claude/ai-agents/shared/tech-stack.md` — Single source of truth for ALL technology choices
- **Communication Protocol:** `C:/Users/ymeli/.claude/ai-agents/shared/communication-protocol.md` — Inter-agent message format and handoff rules

### AI Team Agent Registry

#### CORE (Orchestration)
| Agent | File | Triggers |
|-------|------|----------|
| **Team Lead** | `core/team-lead.md` | "takim yonet", "sprint planla", "karar ver", "team lead", "sprint planning" |
| **Delegation Coordinator** | `core/delegation-coordinator.md` | "gorev dagit", "task breakdown", "delegate", "isbolumu", "gorev ata" |
| **Prompt Engineer** | `core/prompt-engineer.md` | "prompt optimize", "prompt yaz", "AI sorgu", "prompt engineer" |

#### DEVELOPMENT (Implementation)
| Agent | File | Triggers |
|-------|------|----------|
| **Frontend** | `development/frontend.md` | "frontend", "UI yap", "react", "next.js", "component", "sayfa olustur", "arayuz" |
| **Backend** | `development/backend.md` | "backend", "API yap", "endpoint", "server", "sunucu", "veritabani baglantisi" |
| **Mobile** | `development/mobile-specialist.md` | "mobil", "mobile", "react native", "ios", "android", "app" |
| **Designer** | `development/designer.md` | "tasarim", "design", "UI/UX", "figma", "wireframe", "mockup", "arayuz tasarla" |
| **API Architect** | `development/api-architect.md` | "API tasarla", "API design", "endpoint structure", "REST", "GraphQL", "gRPC" |
| **Database Architect** | `development/database-architect.md` | "veritabani tasarla", "database design", "schema", "migration", "SQL", "tablo" |

#### QUALITY (Assurance)
| Agent | File | Triggers |
|-------|------|----------|
| **QA** | `quality/qa.md` | "test yaz", "code review", "kalite kontrol", "QA", "test plan" |
| **Cybersecurity** | `quality/cybersecurity.md` | "guvenlik", "security", "pentest", "zafiyet", "vulnerability", "OWASP" |
| **Performance** | `quality/performance-engineer.md` | "performans", "optimize", "hiz", "speed", "load test", "Core Web Vitals" |

#### AI/ML
| Agent | File | Triggers |
|-------|------|----------|
| **AI/ML Engineer** | `ai/ai-ml-engineer.md` | "model egit", "ML", "machine learning", "RAG", "embedding", "fine-tune", "LLM" |

#### OPS
| Agent | File | Triggers |
|-------|------|----------|
| **DevOps** | `ops/devops.md` | "deploy", "CI/CD", "docker", "kubernetes", "pipeline", "altyapi", "infrastructure" |

#### RESEARCH
| Agent | File | Triggers |
|-------|------|----------|
| **Research** | `research/research-agent.md` | "pazar arastir", "market research", "rakip analiz", "competitive analysis" |
| **Innovation Scout** | `research/innovation-scout.md` | "trend", "inovasyon", "innovation", "yeni teknoloji", "pazar firsati" |

#### META
| Agent | File | Triggers |
|-------|------|----------|
| **Skill Hunter** | `meta/skill-hunter.md` | "yeni skill bul", "skill hunt", "kutuphane onerisi", "library suggest" |
| **Skill Activator** | `meta/skill-activator.md` | "skill yukle", "skill activate", "skill load" |

#### CREATIVE
| Agent | File | Triggers |
|-------|------|----------|
| **Website Builder** | `creative/website-builder.md` | "site yap", "website kur", "landing page", "web sitesi", "site olustur" |
| **Social Media** | `creative/social-media-creator.md` | "sosyal medya", "social media", "icerik uret", "content", "post yaz" |
| **Video Producer** | `creative/video-producer.md` | "video uret", "video yap", "video edit", "video production" |
| **Motion Designer** | `creative/motion-designer.md` | "animasyon", "motion", "animation", "lottie", "framer motion" |

---

## SYSTEM 3: Integration Bridge — How Systems Work Together

### Rule 1: Auto-Detect & Route
When user sends a message:
1. Check if it matches a GSD lifecycle intent (planning, execution, verification, state management)
2. Check if it matches an AI Team specialist intent (specific domain work)
3. If BOTH match, use GSD for orchestration + load AI Team expertise for domain knowledge
4. If only one matches, use that system
5. For ambiguous requests, use Team Lead logic to analyze and route

### Rule 2: Expert Loading During GSD Execution
When GSD executes implementation tasks, **automatically load the relevant AI Team agent files** for domain expertise:

| GSD Task Type | Load These AI Agents |
|---------------|---------------------|
| Frontend/UI code | `development/frontend.md` + `development/designer.md` |
| Backend/API code | `development/backend.md` + `development/api-architect.md` |
| Database work | `development/database-architect.md` + `development/backend.md` |
| Mobile code | `development/mobile-specialist.md` + `development/frontend.md` |
| Security review | `quality/cybersecurity.md` |
| Performance opt | `quality/performance-engineer.md` |
| Testing | `quality/qa.md` |
| DevOps/Deploy | `ops/devops.md` |
| AI/ML features | `ai/ai-ml-engineer.md` + `core/prompt-engineer.md` |
| Website creation | `creative/website-builder.md` + `development/frontend.md` |
| Animations | `creative/motion-designer.md` |
| Content/Social | `creative/social-media-creator.md` |
| Video work | `creative/video-producer.md` + `creative/motion-designer.md` + `remotion` skill (37 rules) |
| PRD/Planning | `core/team-lead.md` + `core/delegation-coordinator.md` + `prd` skill + `ralph` skill |
| API integration | `development/api-architect.md` + `development/backend.md` + `public-apis-reference` skill (1500+ APIs) |

### Rule 3: Tech Stack Consistency
**ALWAYS** reference `ai-agents/shared/tech-stack.md` when making technology decisions. This is the single source of truth for:
- Framework versions (React 19, Next.js 15, etc.)
- Coding standards (TypeScript strict, no `any`, Zod validation)
- Testing requirements (80% coverage, Vitest, Playwright)
- Naming conventions (camelCase, PascalCase, kebab-case)

### Rule 4: Quality Gates (from Communication Protocol)
Before marking any implementation task complete, enforce:
- [ ] Zero TypeScript errors
- [ ] All acceptance criteria met
- [ ] Unit tests >= 80% coverage for new code
- [ ] No critical findings from QA review
- [ ] Security review passed (if auth/payment/data involved)
- [ ] Performance within budget (if critical path)
- [ ] Conventional commit message

### Rule 5: Multi-Agent Task Flow
For complex tasks requiring multiple specialists:
1. **Team Lead** analyzes scope and creates task breakdown
2. **Delegation Coordinator** routes to specialists with dependencies
3. Each specialist reads their agent file and executes with full expertise
4. **QA** reviews all code output
5. **Cybersecurity** gates auth/payment/data features
6. **Performance** gates critical paths
7. Results flow back through GSD state management

### Rule 6: Information Flow Between Agents
When spawning Task subagents, include in the prompt:
- Relevant AI Team agent expertise (read and include the .md file content)
- Tech stack reference (key sections from `shared/tech-stack.md`)
- Current project state (from `.planning/STATE.md` if exists)
- Communication protocol format (from `shared/communication-protocol.md`)

### Rule 7: Parallel Expert Consultation
When a task touches multiple domains, spawn parallel Task agents:
```
Example: "Login sayfası yap" (Build login page)
→ Parallel agents:
  1. Frontend agent (UI components, form handling)
  2. Backend agent (auth endpoint, JWT)
  3. Database agent (user schema)
  4. Security agent (OWASP auth checklist)
→ Results merged by Delegation Coordinator logic
```

---

## Execution Rules (Global)

1. **Auto-detect intent** — Match user input to triggers and execute immediately. Never ask "should I use GSD/AI Team?"
2. **Load before acting** — Always `Read` the relevant workflow/agent .md file before execution
3. **Turkish + English** — User speaks both. All triggers work in both languages
4. **Pass arguments** — Extract phase numbers, descriptions, flags from user message
5. **Slash commands still work** — `/gsd:xxx` uses Skill tool as normal
6. **gsd-tools CLI** — `node C:/Users/ymeli/.claude/get-shit-done/bin/gsd-tools.cjs <command>` for state ops
7. **Respect .planning/** — GSD state lives in `.planning/` of current project
8. **Agent file = expertise** — Reading an AI Team agent .md file means adopting that agent's full knowledge, standards, and patterns for the current task
9. **Shared tech stack is law** — Never contradict tech-stack.md when choosing technologies
10. **Quality gates are mandatory** — Never skip Definition of Done checks for production code

## Quick Reference: Combined Flows
- **New project:** GSD new-project + Team Lead analysis + tech-stack alignment
- **Implementation:** GSD execute-phase + relevant AI Team specialists loaded
- **Code review:** GSD verify-work + QA agent + Security agent + Performance agent
- **Quick feature:** GSD quick + auto-detect specialist (frontend/backend/etc.)
- **Debug issue:** GSD debug + relevant specialist (frontend/backend based on error domain)
- **Website:** Website Builder + Frontend + Designer + DevOps for deploy
- **Mobile app:** Mobile Specialist + Frontend + Backend + Designer
- **AI feature:** AI/ML Engineer + Backend + Prompt Engineer

---

## SYSTEM 4: Skill Swarms — Auto-Chaining Skill Combinations

Swarms are predefined skill chains that activate together when a task matches a pattern. When ANY trigger in a swarm matches, load ALL skills in that swarm's chain.

### Swarm Activation Rule
When a task is detected, check swarm triggers BEFORE individual skill routing. If a swarm matches, activate the full chain. Multiple swarms can activate simultaneously for complex tasks.

### SWARM 1: Document Factory
**Triggers:** "belge", "document", "rapor", "report", "sunum", "presentation", "excel", "tablo", "spreadsheet", "word", "pdf", "pptx", "dosya olustur"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `doc-coauthoring` | Structure & outline the document collaboratively |
| 2 | `docx` / `pdf` / `pptx` / `xlsx` | Generate the target format |
| 3 | `theme-factory` | Apply consistent styling |
| 4 | `brand-guidelines` | Apply brand identity (if Anthropic/company context) |
**AI Agent:** None (skill-only swarm)
**Output:** Styled, formatted document in requested format

### SWARM 2: Security Fortress
**Triggers:** "guvenlik taramasi", "security audit", "zafiyet tara", "vulnerability scan", "kod guvenlik", "OWASP", "pentest", "guvenlik kontrol"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `tob-audit-context-building` | Build audit context from codebase |
| 2 | `tob-entry-point-analyzer` | Map all entry points & attack surface |
| 3 | `tob-static-analysis` | Run static analysis (CodeQL/Semgrep) |
| 4 | `tob-insecure-defaults` | Check for insecure default configs |
| 5 | `tob-sharp-edges` | Identify dangerous patterns & edge cases |
| 6 | `tob-variant-analysis` | Find variants of known vulnerabilities |
| 7 | `tob-semgrep-rule-creator` | Create custom rules for found patterns |
**AI Agent:** `quality/cybersecurity.md`
**Output:** Security audit report with findings, severity, and remediation

### SWARM 3: Design Studio
**Triggers:** "tasarla", "design", "UI yap", "arayuz", "mockup", "wireframe", "gorsel", "visual", "sayfayi tasarla", "component tasarla"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `brainstorming` | Explore design directions |
| 2 | `design-lab` | Generate 5 distinct UI variations |
| 3 | `ui-ux-pro-max` | Apply style/palette/typography from 67 styles |
| 4 | `frontend-design` | Bold, production-grade design decisions |
| 5 | `canvas-design` | Generate visual assets (PNG/PDF) |
**AI Agents:** `development/designer.md` + `development/frontend.md`
**Output:** Finalized UI design with implementation plan

### SWARM 4: Full-Stack Builder
**Triggers:** "full-stack", "sayfa yap", "feature yap", "ozellik ekle", "endpoint + UI", "CRUD", "form yap"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `brainstorming` | Clarify feature scope |
| 2 | `writing-plans` | Write implementation plan |
| 3 | `test-driven-development` | Write tests first |
| 4 | `frontend-design` | UI implementation |
| 5 | `vercel-react-best-practices` | React/Next.js optimization |
| 6 | `vercel-composition-patterns` | Component architecture |
| 7 | `systematic-debugging` | Fix issues during development |
| 8 | `verification-before-completion` | Verify everything works |
**AI Agents:** `development/frontend.md` + `development/backend.md` + `development/api-architect.md` + `quality/qa.md`
**Output:** Tested, production-ready feature

### SWARM 5: Data Visualization
**Triggers:** "grafik", "chart", "veri gorsellestir", "data viz", "visualization", "dashboard", "istatistik goster"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `d3js-visualization` | Interactive D3.js charts |
| 2 | `xlsx` | Process spreadsheet data source |
| 3 | `ui-ux-pro-max` | Chart styling & color palettes |
| 4 | `canvas-design` | Static chart exports (PNG/PDF) |
**AI Agent:** `development/frontend.md`
**Output:** Interactive or static data visualizations

### SWARM 6: Code Quality Gate
**Triggers:** "code review", "kod incele", "kalite kontrol", "merge oncesi", "PR review", "review yap"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `requesting-code-review` | Structured review process |
| 2 | `finding-duplicate-functions` | Detect semantic duplication |
| 3 | `tob-differential-review` | Security-focused diff review |
| 4 | `tob-second-opinion` | Alternative perspective on decisions |
| 5 | `tob-spec-to-code-compliance` | Verify spec compliance |
| 6 | `verification-before-completion` | Final verification |
**AI Agents:** `quality/qa.md` + `quality/cybersecurity.md` + `quality/performance-engineer.md`
**Output:** Comprehensive review with actionable findings

### SWARM 7: Content Machine
**Triggers:** "icerik yaz", "content", "blog yaz", "makale", "article", "newsletter", "dokumantasyon", "documentation"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `content-research-writer` | Research & draft with citations |
| 2 | `doc-coauthoring` | Collaborative editing workflow |
| 3 | `internal-comms` | Format for internal distribution |
| 4 | `docx` / `pdf` | Export to final format |
**AI Agent:** `creative/social-media-creator.md` (if social media context)
**Output:** Researched, formatted content ready to publish

### SWARM 8: Creative Lab
**Triggers:** "sanat", "art", "generative", "animasyon", "animation", "gif", "gorsel uret", "creative"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `brainstorming` | Explore creative direction |
| 2 | `algorithmic-art` | Generative art with p5.js |
| 3 | `canvas-design` | Static visual art |
| 4 | `slack-gif-creator` | Animated GIFs |
| 5 | `d3js-visualization` | Data-driven art |
**AI Agent:** `creative/motion-designer.md`
**Output:** Creative visual assets

### SWARM 9: Testing Fortress
**Triggers:** "test suite", "test yaz", "test kapsamini artir", "coverage", "e2e test", "integration test", "property test"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `test-driven-development` | TDD workflow |
| 2 | `tob-property-based-testing` | Property-based test generation |
| 3 | `webapp-testing` | Playwright E2E tests |
| 4 | `systematic-debugging` | Debug failing tests |
| 5 | `verification-before-completion` | Verify all pass |
**AI Agent:** `quality/qa.md`
**Output:** Comprehensive test suite with high coverage

### SWARM 10: Communication Hub
**Triggers:** "slack mesaj", "slack", "mesaj gonder", "takim iletisim", "team communication"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `slack-messaging` | Send/read Slack messages |
| 2 | `internal-comms` | Format for internal audience |
| 3 | `skill-share` | Share skills via Slack |
**AI Agent:** None
**Output:** Formatted team communications

### SWARM 11: Autonomous Builder (Ralph)
**Triggers:** "PRD yaz", "PRD olustur", "feature plan", "otonom gelistir", "ralph", "prd.json", "autonomous build", "hikaye yaz", "user story", "sprint plani"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `prd` | Generate PRD with clarifying questions |
| 2 | `ralph` | Convert PRD to prd.json for autonomous execution |
| 3 | `writing-plans` | Break into bite-sized implementation tasks |
| 4 | `test-driven-development` | TDD for each story |
| 5 | `verification-before-completion` | Verify each story passes |
**AI Agents:** `core/team-lead.md` + `core/delegation-coordinator.md`
**Output:** prd.json ready for Ralph autonomous loop execution
**Note:** After prd.json is created, run `./ralph.sh --tool claude` for autonomous execution

### SWARM 12: API Discovery & Integration
**Triggers:** "API bul", "API ara", "hangi API", "ucretsiz API", "free API", "API entegrasyon", "third-party API", "dis servis", "API onerisi"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `public-apis-reference` | Search 1500+ free APIs across 51 categories |
| 2 | `mcp-builder` | Build MCP server for chosen API (if needed) |
| 3 | `writing-plans` | Plan integration architecture |
**AI Agents:** `development/api-architect.md` + `development/backend.md`
**Output:** API recommendation with integration plan

### SWARM 13: Video Production Studio
**Triggers:** "video yap", "video uret", "remotion", "video edit", "video production", "animasyon video", "React video", "programmatic video", "video render", "video olustur"
**Skill Chain:**
| Order | Skill | Role |
|-------|-------|------|
| 1 | `brainstorming` | Explore video concept & style |
| 2 | `remotion` | React-based video creation (37 rules: animations, transitions, timing, 3D, captions, audio, charts) |
| 3 | `d3js-visualization` | Data-driven visuals & charts in video |
| 4 | `canvas-design` | Static frame/thumbnail assets |
| 5 | `slack-gif-creator` | GIF exports from video scenes |
**AI Agents:** `creative/video-producer.md` + `creative/motion-designer.md`
**Output:** Programmatic video with React (Remotion), rendered and exported

### Swarm Composition Rules

1. **Swarms can stack** — "Login sayfasi tasarla ve guvenlik kontrolu yap" activates Design Studio + Security Fortress + Full-Stack Builder
2. **Order matters** — Execute skills in the listed order within each swarm
3. **AI Agents enhance** — When a swarm has AI Agents listed, read those .md files before executing skill chain
4. **Partial activation OK** — If user only needs part of a swarm (e.g., "sadece PDF yap"), activate only the relevant skills from the chain
5. **GSD integration** — Swarms operate WITHIN GSD phases. During `execute-phase`, the appropriate swarm activates based on task content
6. **Parallel swarms** — Independent swarms can run in parallel via Task subagents
7. **Swarm output flows** — Each swarm's output feeds into GSD state (SUMMARY.md, STATE.md updates)
