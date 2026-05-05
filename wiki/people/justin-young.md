---
title: Justin Young
created: 2026-04-07
updated: 2026-04-17
type: entity
tags: [anthropic, ai-agents, software-engineering]
sources:
  - ../../sources/articles/anthropic-effective-harnesses-long-running.md
confidence: medium
related:
  - ../concepts/harness-engineering.md
  - ../concepts/coding-agents.md
  - ../concepts/kv-cache-and-prompt-caching.md
  - ../concepts/claude-code-session-management.md
---

## Summary

Engineer at Anthropic. Authored "Effective Harnesses for Long-Running Agents" (2025-11-26), addressing how coding agents maintain progress across multiple context windows.

## Key Points

- Identified two failure modes for long-running agents: **over-ambition** (context exhaustion mid-task) and **premature completion** (sees progress, declares done)
- Proposed **Initializer + Coding Agent** two-phase pattern with file-based handoff
- Key insight: use feature list JSON as a **contract** — agent only modifies `passes` field, can't delete requirements
- Advocates one-feature-at-a-time + git commit for incremental, recoverable progress
- Framing: agent session handoff mirrors human team handoff mechanisms

## Open Questions

*None currently*

---
## Evidence Timeline

- **2026-04-07**: Created from "Effective Harnesses for Long-Running Agents" article (published 2025-11-26)

## 相关页面

[[prithvi-rajasekaran]], [[thariq-shihipar]]
- [[barry-zhang]], [[birgitta-bockeler]]
