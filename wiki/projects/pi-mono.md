---
title: Pi (pi-mono) Agent Harness
created: 2026-04-28
updated: 2026-04-28
type: project
tags: [agent, open-source]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md]
related:
  - agent-context-management
  - claude-code-harness
  - letta-code
---

# Pi (pi-mono)

Pi is an open-source AI agent harness. OpenClaw is derived from Pi and inherits its core file read and compaction machinery.

## File Read Management

- Hard cap: **2,000 lines or 50KB**, whichever hits first — even without the model requesting a slice
- Style: **head-truncated**, with an explicit continuation nudge appended to the output: `[Showing lines 1-2000 of 50000. Use offset=2001 to continue.]`
- Tool description reinforces pagination: "output is truncated to 2000 lines or 50KB. Use offset/limit for large files."
- Philosophy: **harness-first** — the harness protects the context window, then teaches the model to paginate

## Session Compaction

- Trigger: estimated context tokens exceed `contextWindow - reserveTokens` (default reserve: 16,384 tokens)
- Kept: most recent ~20,000 tokens of messages (`keepRecentTokens`)
- Summarized: everything older → passed to LLM for summarization
- Summary placement: synthetic user message prepended to the kept tail
- Safety: never cuts at an orphaned tool result — walks boundaries to keep tool-call/result pairs intact

## Relationship to OpenClaw

openclaw.md inherits Pi's read tool (2K line / 50KB cap) and compaction architecture, then adds:
- Bootstrap file caps (12K chars/file, 60K total)
- Tool result budgets (16K chars or 30% of context)
- Multi-pass summarization
- Pre-compaction flush via silent agentic turn
- Non-destructive tool-result pruning on 5-min TTL

## 相关页面

[[harbor]], [[openclaw]]

