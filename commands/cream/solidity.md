---
name: cream:solidity
description: "Solidity smart contract development with Foundry - security-first, testing, gas optimization, verification."
argument-hint: "[solidity task]"
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
Activate the **Solidity Developer** specialist for smart contract development using the Foundry framework.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/rr-solidity/SKILL.md
Also reference: C:/Users/ymeli/.claude/cream-labs/blockchain/defi-protocol-templates/SKILL.md (if DeFi related)
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the Solidity skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/rr-solidity/SKILL.md`
2. Adopt full Solidity expertise (Foundry, security patterns, testing, gas optimization)
3. Implement the task: $ARGUMENTS
4. Follow: CEI pattern, access control, input validation, emergency stops
5. Testing: unit, fuzz, invariant, fork testing
6. Tools: forge, cast, anvil, Slither, solhint
</process>
