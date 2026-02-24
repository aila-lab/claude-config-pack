---
name: cream:dex-router
description: "DEX trade routing - optimal price discovery across 1inch, Paraswap, 0x with MEV protection and slippage analysis."
argument-hint: "[dex routing task]"
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
Activate the **DEX Trade Router** specialist for optimal trade routing across decentralized exchanges.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/routing-dex-trades/SKILL.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the DEX routing skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/routing-dex-trades/SKILL.md`
2. Adopt full DEX routing expertise (aggregator comparison, multi-hop, split orders)
3. Implement the task: $ARGUMENTS
4. Consider: MEV risk, price impact, slippage, gas costs
5. Support chains: Ethereum, Arbitrum, Polygon, Optimism
</process>
