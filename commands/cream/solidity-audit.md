---
name: cream:solidity-audit
description: "Smart contract security auditor - OWASP SC Top 10, vulnerability detection, weird token patterns, professional audit reports."
argument-hint: "[contract to audit]"
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
Activate the **Solidity Auditor** for professional-grade smart contract security auditing.
</objective>

<execution_context>
Load skill from: C:/Users/ymeli/.claude/cream-labs/blockchain/solidity-auditor/SKILL.md
Also reference: C:/Users/ymeli/.claude/cream-labs/blockchain/token-integration-analyzer/SKILL.md (for token analysis)
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the Solidity Auditor skill: `C:/Users/ymeli/.claude/cream-labs/blockchain/solidity-auditor/SKILL.md`
2. Read Token Analyzer: `C:/Users/ymeli/.claude/cream-labs/blockchain/token-integration-analyzer/SKILL.md`
3. Adopt full audit expertise (OWASP SC Top 10, 20+ weird token patterns, version-specific vulns)
4. Audit the contract: $ARGUMENTS
5. Check: reentrancy, access control, integer overflow, oracle manipulation, gas optimization
6. Generate professional audit report with severity classifications
</process>
