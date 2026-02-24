# 📡 Inter-Agent Communication Protocol

> **Version**: 2.0 | **Updated**: 2026-02 | **All agents MUST follow this protocol**

## Message Format

### Task Delegation
```json
{
  "type": "task_delegation",
  "from": "team-lead | delegation-coordinator",
  "to": "target-agent-id",
  "task_id": "TASK-001",
  "priority": "critical | high | medium | low",
  "title": "Brief task title",
  "description": "Detailed requirements",
  "acceptance_criteria": ["criterion 1", "criterion 2"],
  "dependencies": ["TASK-000"],
  "deadline": "2026-02-25T18:00:00Z",
  "context": {
    "sprint": "Sprint 5",
    "epic": "User Authentication",
    "related_files": ["src/auth/login.ts"],
    "tech_stack_ref": "shared/tech-stack.md"
  }
}
```

### Task Completion Report
```json
{
  "type": "task_completion",
  "from": "completing-agent-id",
  "task_id": "TASK-001",
  "status": "completed | blocked | needs_review",
  "deliverables": ["file paths or descriptions"],
  "tests_passed": true,
  "notes": "Implementation notes",
  "time_spent": "2h",
  "review_requested_from": ["qa", "cybersecurity"]
}
```

### Blocker Report
```json
{
  "type": "blocker",
  "from": "blocked-agent-id",
  "task_id": "TASK-001",
  "severity": "critical | high | medium",
  "blocker_description": "What is blocking progress",
  "attempted_solutions": ["What was tried"],
  "needs_from": "agent-id or external",
  "estimated_delay": "4h"
}
```

### Review Request/Response
```json
{
  "type": "review_request",
  "from": "requesting-agent",
  "to": "reviewing-agent",
  "task_id": "TASK-001",
  "review_type": "code | security | design | performance | accessibility",
  "files": ["paths to review"],
  "focus_areas": ["specific concerns"]
}
```

```json
{
  "type": "review_response",
  "from": "reviewing-agent",
  "task_id": "TASK-001",
  "verdict": "approved | changes_requested | rejected",
  "findings": [
    {
      "severity": "critical | warning | info",
      "location": "file:line",
      "description": "Issue found",
      "suggestion": "How to fix"
    }
  ]
}
```

## Priority Levels

| Level | Response Time | Description | Example |
|-------|--------------|-------------|---------|
| 🔴 Critical | < 15 min | Production down, security breach | Server crash, data leak |
| 🟠 High | < 1 hour | Feature blocker, major bug | Auth broken, payment fails |
| 🟡 Medium | < 4 hours | Standard task, minor bug | UI glitch, perf issue |
| 🟢 Low | < 24 hours | Enhancement, docs, refactor | Code cleanup, docs update |

## Severity Levels (For Findings)

| Level | Action Required | Description |
|-------|----------------|-------------|
| 🔴 Critical | Must fix before merge | Security vuln, data loss, crash |
| 🟠 Warning | Should fix before release | Performance, UX, maintainability |
| 🟡 Info | Consider fixing | Style, optimization, nice-to-have |

## Handoff Rules

1. **Always include context** — never assume the receiving agent knows the background
2. **One owner per task** — clear ownership, no ambiguity
3. **Explicit dependencies** — list what must be done first
4. **Status updates** — at 25%, 50%, 75%, 100% completion
5. **Blocker escalation** — report within 1 hour of discovery
6. **QA reviews** — all code changes get reviewed before handoff
7. **Security gate** — cybersecurity reviews auth, payments, data handling
8. **Performance gate** — performance-engineer reviews for critical paths
9. **Design approval** — designer reviews all UI changes before dev starts

## Agent Directory

| Agent | Domain | Delegates To | Reviewed By |
|-------|--------|-------------|-------------|
| Team Lead | Project management | All agents | — |
| Delegation Coordinator | Task routing | Specific agents | Team Lead |
| Frontend | UI/UX code | — | QA, Designer, Performance |
| Backend | API/Logic | — | QA, Cybersecurity, Performance |
| Mobile Specialist | Native/RN | — | QA, Designer, Performance |
| Designer | Visual/UX | Frontend, Mobile | Team Lead |
| API Architect | API design | Backend, Frontend | Cybersecurity |
| Database Architect | Data layer | Backend | Performance, Cybersecurity |
| QA | Testing | All (review) | Team Lead |
| Cybersecurity | Security | All (review) | Team Lead |
| Performance Engineer | Optimization | All (review) | Team Lead |
| AI/ML Engineer | ML/AI features | Backend | QA, Performance |
| DevOps | Infrastructure | — | Cybersecurity |
| Prompt Engineer | AI prompts | AI/ML Engineer | QA |
| Research Agent | Market research | Team Lead | — |
| Innovation Scout | Tech trends | Team Lead | — |
| Skill Hunter | Skill discovery | Skill Activator | Team Lead |
| Skill Activator | Skill loading | — | Team Lead |
| Website Builder | Web projects | Frontend, Designer | QA, Performance |
| Social Media Creator | Content | Designer, Video Producer | Team Lead |
| Video Producer | Video content | Motion Designer | Team Lead |
| Motion Designer | Animations | — | Designer, Video Producer |

## Escalation Path

```
Individual Agent → Delegation Coordinator → Team Lead → Human (Project Owner)
```

## Conflict Resolution

When two agents disagree:
1. Both present their case with data/evidence
2. Delegation Coordinator mediates
3. If unresolved → Team Lead decides
4. Decision is logged in ADR (Architecture Decision Record)
5. All agents commit to the decision

## Definition of Done (Global)

A task is "done" when ALL of these are true:
- [ ] Code compiles with zero TypeScript errors
- [ ] All acceptance criteria met
- [ ] Unit tests written and passing (≥80% coverage for new code)
- [ ] Integration tests for critical paths
- [ ] No critical/warning findings from reviewers
- [ ] Security review passed (if applicable)
- [ ] Performance within budget (if applicable)
- [ ] Documentation updated
- [ ] Committed with conventional commit message
