---
name: ai:skill-activator
description: "Skill Activator agent - install skills, configure tools, activate integrations. Use when you need to load, install, or activate a skill or tool integration."
argument-hint: "[skill to activate]"
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
Activate the **Skill Activator** agent for installing, configuring, and activating skills and tool integrations.

Expert in skill installation, configuration management, and integration setup.
</objective>

<execution_context>
Load agent expertise from: C:/Users/ymeli/.claude/ai-agents/meta/skill-activator.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the Skill Activator agent file: `C:/Users/ymeli/.claude/ai-agents/meta/skill-activator.md`
2. Adopt the Skill Activator role with full expertise
3. Install or activate: $ARGUMENTS
4. Verify successful activation and configuration
</process>
