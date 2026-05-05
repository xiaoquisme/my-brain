---
title: OpenClaw Agent Harness
created: 2026-04-28
updated: 2026-04-28
type: project
tags: [agent]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md]
confidence: medium
related:
  - agent-context-management
  - claude-code-harness
  - letta-code
---

# OpenClaw

OpenClaw is an AI agent harness built on top of pi-mono.md, extending its file read and compaction machinery with defense-in-depth context management.

## File Read Management

- Inherits Pi's 2,000 lines / 50KB hard cap
- Additional caps for **bootstrap files** (one-time context loaded at session start):
  - 12,000 chars per file
  - 60,000 chars total budget
  - Exceeding budget: **75% head / 25% tail** split (you see the beginning and end, middle is cut)
- Tool results: **16,000 chars or 30% of context window**, whichever is smaller
  - If the tail looks "important" (errors, JSON close braces, summary keywords): head+tail mode
  - Otherwise: head only
- Philosophy: **defense in depth** — Pi's truncation first, then bootstrap caps, then tool result budgets

## Session Compaction

- Trigger: history exceeds **50% of the context window** (`maxHistoryShare`, default 0.5)
- History split into equal-mass token chunks; oldest chunk dropped
- Dropped content: staged **multi-pass LLM summarization** with a merge step
- Summary placement: synthetic message prepended to kept tail
- Tool-call safety: `repairToolUseResultPairing` fixes orphaned tool results after chunk dropping; `splitMessagesByTokenShare` avoids cutting inside a tool-call/result pair
- **Pre-compaction flush**: silent agentic turn lets the agent persist state to memory files before history disappears
- **Second layer**: non-destructive in-memory pruning of tool results (soft-trim, then hard-clear) on a **5-minute cache TTL** — protects the persistent conversation while reclaiming context for the current request

## Subagent Handling

- Fresh isolated sessions by default — no parent transcript
- **Fork mode**: copies parent's transcript into child, but only for same-agent spawns
- Workspace context filtered to a minimal allowlist: `AGENTS.md`, `TOOLS.md`, `SOUL.md`

## 相关页面

[[harbor]], [[letta-code]]

