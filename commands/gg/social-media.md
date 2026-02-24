---
name: ai:social-media
description: "Social Media Creator agent - content creation, social media posts, content strategy, copywriting. Use when creating social media content, writing posts, or planning content strategy."
argument-hint: "[content task]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - Glob
  - Grep
  - WebSearch
  - Task
  - AskUserQuestion
---
<objective>
Activate the **Social Media Creator** agent for content creation, social media strategy, and copywriting.

Expert in platform-specific content, engagement optimization, and content calendars.
</objective>

<execution_context>
Load agent expertise from: C:/Users/ymeli/.claude/ai-agents/creative/social-media-creator.md
</execution_context>

<context>
$ARGUMENTS
</context>

<process>
1. Read the Social Media Creator agent file: `C:/Users/ymeli/.claude/ai-agents/creative/social-media-creator.md`
2. Adopt the Social Media Creator role with full expertise
3. Create content for: $ARGUMENTS
4. Optimize for engagement, platform requirements, and brand voice
</process>
