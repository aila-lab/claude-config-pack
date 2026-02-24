---
name: agents
description: "List all available AI agents and GSD commands"
allowed-tools:
  - Read
---

Display the following comprehensive agent list to the user in a clean, formatted table:

---

# Available Agents & Commands

## AI Development Team (22 Agents)
Use with `/ai:<name>` or describe your task in natural language.

### Core (Orchestration)
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:team-lead` | Team Lead | Sprint planning, architectural decisions, team coordination |
| `/ai:delegation` | Delegation Coordinator | Task breakdown, work distribution, multi-agent orchestration |
| `/ai:prompt-engineer` | Prompt Engineer | AI prompt optimization, system prompt crafting |

### Development (Implementation)
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:frontend` | Frontend | React 19, Next.js 15, UI components, state management |
| `/ai:backend` | Backend | API development, server logic, authentication, middleware |
| `/ai:mobile` | Mobile Specialist | React Native, iOS, Android, mobile UI |
| `/ai:designer` | Designer | UI/UX design, wireframes, design systems, accessibility |
| `/ai:api-architect` | API Architect | API design, REST/GraphQL/gRPC, versioning |
| `/ai:database-architect` | Database Architect | Schema design, migrations, SQL optimization |

### Quality (Assurance)
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:qa` | QA | Testing strategy, code review, test writing |
| `/ai:cybersecurity` | Cybersecurity | Security review, vulnerability analysis, OWASP |
| `/ai:performance` | Performance Engineer | Performance optimization, load testing, Core Web Vitals |

### AI/ML
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:ai-ml` | AI/ML Engineer | Machine learning, RAG, embeddings, fine-tuning, LLM |

### Operations
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:devops` | DevOps | CI/CD, Docker, Kubernetes, deployment, infrastructure |

### Research
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:research` | Research | Market research, competitive analysis, user research |
| `/ai:innovation` | Innovation Scout | Technology trends, emerging tech, market opportunities |

### Meta
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:skill-hunter` | Skill Hunter | Find new skills, discover libraries, evaluate packages |
| `/ai:skill-activator` | Skill Activator | Install skills, configure tools, activate integrations |

### Creative
| Command | Agent | Description |
|---------|-------|-------------|
| `/ai:website-builder` | Website Builder | Landing pages, web apps, SEO, responsive design |
| `/ai:social-media` | Social Media Creator | Content creation, social media posts, copywriting |
| `/ai:video-producer` | Video Producer | Video production, storyboards, video strategy |
| `/ai:motion-designer` | Motion Designer | Animations, Framer Motion, Lottie, micro-interactions |

---

## GSD Commands (Project Lifecycle)
Use with `/gsd:<name>` or describe your intent in natural language.

| Command | Description |
|---------|-------------|
| `/gsd:new-project` | Initialize new project with deep context gathering |
| `/gsd:new-milestone` | Start a new milestone/version cycle |
| `/gsd:plan-phase` | Create detailed phase plan (PLAN.md) |
| `/gsd:execute-phase` | Execute phase plans with atomic commits |
| `/gsd:discuss-phase` | Gather phase context through questioning |
| `/gsd:research-phase` | Research how to implement a phase |
| `/gsd:verify-work` | Validate built features (UAT) |
| `/gsd:progress` | Check progress, show context, route to next action |
| `/gsd:quick` | Execute a quick task with GSD guarantees |
| `/gsd:debug` | Systematic debugging with persistent state |
| `/gsd:map-codebase` | Analyze codebase structure |
| `/gsd:add-phase` | Add phase to end of current milestone |
| `/gsd:insert-phase` | Insert urgent work between existing phases |
| `/gsd:remove-phase` | Remove a future phase from roadmap |
| `/gsd:add-todo` | Capture idea/task as todo |
| `/gsd:check-todos` | List pending todos |
| `/gsd:pause-work` | Create context handoff when pausing |
| `/gsd:resume-work` | Resume work from previous session |
| `/gsd:health` | Diagnose planning directory health |
| `/gsd:settings` | Configure GSD workflow toggles |
| `/gsd:set-profile` | Switch model profile (quality/balanced/budget) |
| `/gsd:complete-milestone` | Archive completed milestone |
| `/gsd:audit-milestone` | Audit milestone completion |
| `/gsd:plan-milestone-gaps` | Create phases for audit gaps |
| `/gsd:list-phase-assumptions` | Surface assumptions about a phase |
| `/gsd:cleanup` | Archive completed phase directories |
| `/gsd:help` | Show GSD usage guide |

---

**Tip:** You can also just describe what you need in Turkish or English — the system auto-detects your intent and routes to the correct agent.
