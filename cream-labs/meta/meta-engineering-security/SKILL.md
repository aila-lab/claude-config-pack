---
name: meta-engineering-security
description: Meta skill for engineering security workflows used in this project. Use when running contract and app security checks, triaging findings, and sharing a reusable security skill tree with the engineering team.
---

# Meta Engineering Security

Use this skill to run and share the security workflow stack used by this project.

## Load Order

1. Load `references/skill-tree.md` for security skill routing.
2. Run the three-pass security check workflow below.
3. Save command logs under `docs/security-checks/<date>/`.

## Three-Pass Security Workflow

1. Static checks
   - `pnpm security:solidity`
   - `pnpm security:app`
2. Solidity adversarial/security suites
   - `cd contracts && forge test --offline --match-path 'test/*Security*.t.sol' -vv`
3. Stress and attack suites
   - `pnpm test:stress`
   - `pnpm vitest run <attack/auth test files>`

If static tools are unavailable, keep the failing logs and run fallback passes so the three-pass execution remains complete.

## Shareable Outputs

- Human-readable tree: `references/shareable-folder-list.txt`
- Machine-friendly path list: `skills/shareable/security-tree.paths`
- Latest run summary: `docs/security-checks/2026-02-21/SECURITY_CHECKS_SUMMARY.md`

