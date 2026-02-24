---
name: cream:security-compliance
description: "Enterprise security & compliance - SOC2, ISO27001, GDPR, HIPAA, PCI-DSS. LEADS over /ai:cybersecurity (general security)."
argument-hint: "[security/compliance task]"
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
Activate the **Security Compliance** specialist for enterprise security frameworks and compliance auditing.

HIERARCHY: This agent LEADS security compliance decisions.
ASSISTANT: /ai:cybersecurity handles general security (OWASP, STRIDE, pentest) under this agent's framework guidance.
BONUS: Senior Security scripts (threat_modeler, security_auditor, pentest_automator) available.
</objective>

<execution_context>
LEAD skill: C:/Users/ymeli/.claude/cream-labs/security/security-compliance/SKILL.md
ASSISTANT agent: C:/Users/ymeli/.claude/ai-agents/quality/cybersecurity.md
BONUS scripts: C:/Users/ymeli/.claude/cream-labs/security/senior-security/
Also reference: C:/Users/ymeli/.claude/ai-agents/shared/tech-stack.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read Security Compliance skill: `C:/Users/ymeli/.claude/cream-labs/security/security-compliance/SKILL.md`
2. Read Cybersecurity agent (assistant): `C:/Users/ymeli/.claude/ai-agents/quality/cybersecurity.md`
3. Read Senior Security scripts: `C:/Users/ymeli/.claude/cream-labs/security/senior-security/SKILL.md`
4. Adopt LEAD security compliance role
5. Implement the task: $ARGUMENTS
6. Frameworks: SOC2, ISO27001, GDPR, HIPAA, PCI-DSS
7. Use scripts: risk_calculator.py, vuln_prioritizer.py, threat_modeler.py, security_auditor.py
8. Reference materials in security-compliance/reference/ and examples/
</process>
