---
title: Claude Code Workflow & Features
created: 2026-04-07
updated: 2026-04-10
type: entity
tags: [claude-code, coding-agents, tool-use, workflow]
sources:
  - ../../sources/articles/claude-howto-guide.md
confidence: medium
related:
  - ../concepts/harness-engineering.md
  - ../concepts/coding-agents.md
  - ../concepts/claude-code-session-management.md
  - ../people/luongnv89.md
  - ../concepts/agile.md
---

## Summary

Claude Code is Anthropic's coding agent CLI. Its power comes from combining features into workflows, not using them individually. The feature set maps directly to harness engineering concepts: Memory/CLAUDE.md = feedforward guides, Hooks/Tests = feedback sensors.

## Key Points

- **10 core features**: Slash Commands, Memory, Skills, Subagents, MCP, Hooks, Plugins, Checkpoints, Advanced Features (planning/thinking), CLI
- **The real leverage is composition**: e.g., code review = Slash Commands + Subagents + Memory + MCP
- **Harness engineering mapping**:
  - CLAUDE.md / Memory = **feedforward** (guides agent before acting)
  - Hooks / Tests = **feedback** (sensors after action)
  - Skills = **reusable harness components**
  - Checkpoints = **rollback capability** (safe experimentation)
- **Feature persistence spectrum**: Session-only (slash commands) → Cross-session (memory) → Real-time (MCP)
- **Learning path**: 11-13 hours total, but 15 min for immediate value

## Feature Quick Reference

| Feature | Invocation | Persistence | Harness Role |
|---------|-----------|-------------|--------------|
| Memory/CLAUDE.md | Auto-loaded | Cross-session | Feedforward guide |
| Skills | Auto-invoked | Filesystem | Reusable harness |
| Hooks | Event-triggered | Configured | Feedback sensor |
| Subagents | Auto-delegated | Isolated | Task decomposition |
| MCP | Auto-queried | Real-time | External data access |
| Checkpoints | Manual/Auto | Session | Rollback safety net |

## Open Questions

- What's the optimal CLAUDE.md structure for different project types?
- How to version-control and share Claude Code configurations across teams?
- Best practices for hook complexity vs. maintainability?

---
## Evidence Timeline

- **2026-04-07**: Compiled from claude-howto guide (5,900+ stars, luongnv89)

## 相关页面

[[luongnv89]], [[claude-code-architecture]]

