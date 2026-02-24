---
name: meta-engineering-frontend-backend
description: Meta skill for engineering delivery across frontend and backend in this project. Use when planning or implementing UI, API, or full-stack work, and when handing a reusable engineering skill tree to teammates or other agent workflows.
---

# Meta Engineering Frontend Backend

Use this skill to load only the engineering skills used for building this codebase.

## Load Order

1. Load `references/skill-tree.md`.
2. For UI work, use frontend skills first.
3. For API/server work, use backend skills.
4. Apply shared quality gates before completion.

## Shared Quality Gates

- Use TDD and verification discipline from `docs/SKILLS.md`.
- Use code review workflow from `.claude/skills/requesting-code-review/SKILL.md`.
- Use web app testing from `.claude/skills/webapp-testing/SKILL.md` for UI verification.

## Shareable Outputs

- Human-readable tree: `references/shareable-folder-list.txt`
- Machine-friendly path list: `skills/shareable/frontend-backend-tree.paths`

