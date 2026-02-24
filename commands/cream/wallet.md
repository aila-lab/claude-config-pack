---
name: cream:wallet
description: "Coinbase CDP agent wallet - create/manage wallets on Base L2, TEE key management, EIP-712 signing, x402 payments."
argument-hint: "[wallet task]"
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
Activate the **Coinbase CDP Wallet** specialist for blockchain wallet management on Base L2.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/coinbase-cdp-wallet/SKILL.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the CDP Wallet skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/coinbase-cdp-wallet/SKILL.md`
2. Adopt full wallet management expertise (Base L2, TEE, EIP-712, x402)
3. Implement the task: $ARGUMENTS
4. Use @coinbase/agentkit package
5. Ensure security: no private key exposure, TEE key management
6. Handle: wallet creation, message signing, typed data signing, transactions
</process>
