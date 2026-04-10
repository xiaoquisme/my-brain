---
title: Agentic Patterns
created: 2026-04-07
updated: 2026-04-07
tags: [ai-agents, software-engineering, architecture-pattern]
sources:
  - ../../sources/articles/anthropic-building-effective-agents.md
related:
  - ../projects/claude-code-architecture.md
  - coding-agents.md
  - harness-engineering.md
  - tool-use-as-meta-ability.md
  - agentic-rag.md
  - ../people/erik-schluntz.md
  - ../people/barry-zhang.md
---

## Summary

Six composable design patterns for building LLM-powered agentic systems, from simple augmentation to autonomous agents. Anthropic's key insight: the most successful implementations use simple, composable patterns rather than complex frameworks.

## Key Points

- **Workflows vs Agents**: Workflows use predefined code paths; agents let the LLM dynamically direct processes. Start with workflows, escalate to agents only when needed.
- **Simplicity first**: Agentic systems trade latency and cost for performance — don't add complexity unless the task demands it

### The Six Patterns (increasing complexity)

1. **Augmented LLM** — LLM + retrieval + tools + memory. The building block for everything else.
2. **Prompt Chaining** — Sequential steps with programmatic gates between them. Good for decomposable, fixed-structure tasks.
3. **Routing** — Classify input, dispatch to specialized handler. One decision point, multiple paths.
4. **Parallelization** — Run subtasks simultaneously. Two flavors: sectioning (split task) and voting (redundant runs for consensus).
5. **Orchestrator-Workers** — Central LLM dynamically delegates to workers. Unlike chaining, subtasks are determined at runtime.
6. **Evaluator-Optimizer** — Generator + evaluator in a loop. GAN-inspired: iterate until quality threshold met.

### Three Principles for Agent Design

1. **Simplicity** — resist adding layers; simple patterns compose well
2. **Transparency** — expose planning steps to users
3. **Agent-Computer Interface (ACI)** — tool documentation is as important as prompts; tool design deserves equal prompt engineering effort

### Tool Design

- Tool definitions deserve as much engineering as system prompts
- Mirror natural language; eliminate unnecessary formatting
- Include examples and clear boundaries
- Anthropic spent more time on tool design than prompts for SWE-bench

## Relationship to Harness Engineering

These patterns describe the **internal architecture** of agents, while [harness engineering](harness-engineering.md) describes the **external controls** around agents. They're complementary:
- Patterns = how the agent is structured internally
- Harness = how the environment constrains and validates the agent

The evaluator-optimizer pattern is directly related to Anthropic's GAN-inspired multi-agent harness for long-running tasks.

## Open Questions

- When to compose multiple patterns vs. keeping it simple?
- How do these patterns interact with Meta-Harness automated optimization?
- What metrics determine when to escalate from workflow to agent?

---
## Evidence Timeline

- **2026-04-10**: "Claude Code from Source" book — Claude Code implements all 6 agentic patterns plus recursive sub-agent architecture, fork agents for cache sharing, and swarm teams with mailbox messaging.

- **2026-04-07**: Initial compilation from Anthropic's "Building Effective Agents" (Schluntz & Zhang, 2024-12-19)
- **2026-04-07**: Added cross-ref to tool-use-as-meta-ability — tool use is the foundation of the Augmented LLM pattern
