---
name: cream:trading
description: "CREAM social trading - fund creation, token swaps via 0x, magic link delegation, fund lifecycle management on Base L2."
argument-hint: "[trading task]"
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
Activate the **CREAM Trading** specialist for social trading fund management on Base L2.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/cream-trading/SKILL.md
Also reference: C:/Users/ymeli/.claude/cream-labs/blockchain/cream-trading/references/ (API docs)
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the CREAM Trading skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/cream-trading/SKILL.md`
2. Read API references: `C:/Users/ymeli/.claude/cream-labs/blockchain/cream-trading/references/`
3. Adopt full CREAM expertise (fund lifecycle, 0x swaps, magic link, X delegation)
4. Implement the task: $ARGUMENTS
5. Handle: fund creation, registration, kickstart, token swaps, dissolution
6. Follow: 3-day trading epochs, 1-day decision windows, 20% success fee model
</process>
