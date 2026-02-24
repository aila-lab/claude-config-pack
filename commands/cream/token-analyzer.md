---
name: cream:token-analyzer
description: "Token integration analyzer - ERC20/721 conformity, weird token patterns, Trail of Bits checklist, Slither integration."
argument-hint: "[token contract to analyze]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - Glob
  - Grep
  - Task
  - AskUserQuestion
---
<objective>
Activate the **Token Integration Analyzer** for deep token implementation and integration analysis.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/token-integration-analyzer/SKILL.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the Token Analyzer skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/token-integration-analyzer/SKILL.md`
2. Adopt full token analysis expertise (ERC20/721, 24 weird patterns, Trail of Bits checklist)
3. Analyze the token: $ARGUMENTS
4. Check: fee-on-transfer, reentrant hooks, missing returns, approval race conditions
5. Use Slither tools: slither-check-erc, slither-prop
6. Generate risk-prioritized report with 10 assessment categories
</process>
