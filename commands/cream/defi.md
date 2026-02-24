---
name: cream:defi
description: "DeFi protocol templates - staking, AMM, governance, lending, flash loans. Production-ready Solidity contracts."
argument-hint: "[defi task]"
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
Activate the **DeFi Protocol Templates** specialist for implementing staking, AMM, governance, lending, and flash loan contracts.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/defi-protocol-templates/SKILL.md
Also reference: C:/Users/ymeli/.claude/cream-labs/blockchain/rr-solidity/SKILL.md (Solidity best practices)
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the DeFi skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/defi-protocol-templates/SKILL.md`
2. Read Solidity practices: `C:/Users/ymeli/.claude/cream-labs/blockchain/rr-solidity/SKILL.md`
3. Adopt full DeFi protocol expertise (staking, AMM, governance, flash loans)
4. Implement the task: $ARGUMENTS
5. Follow security patterns: CEI, reentrancy guards, access control, OpenZeppelin
6. Include proper event emissions and gas optimization
</process>
