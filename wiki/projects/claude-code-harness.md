---
title: Claude Code Agent Harness
created: 2026-04-28
updated: 2026-04-28
type: project
tags: [agent, model, company]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md, ../../sources/articles/swe-atlas-github-2026.md]
related:
  - agent-context-management
  - pi-mono
  - openclaw
  - letta-code
  - swe-atlas
---

# Claude Code (Agent Harness)

Claude Code is Anthropic's AI coding agent harness. It is notable for its two-layer pre-read file defense, remote tunability via feature flags, and a pre-query tool result optimization pipeline that runs on every API call regardless of context pressure.

(Note: Claude Code also appears in swe-atlas.md benchmark evaluations as a tested agent.)

## File Read Management

Two-layer defense:

1. **Pre-read byte gate**: stat call before opening the file. Files > 256KB are rejected immediately with an actionable error pointing the model to use offset/limit or grep.
2. **Post-read token gate**: output token-counted against a **25,000 token budget**, catching token-dense files that slip under the byte cap.

Both limits are remotely tunable by Anthropic via **GrowthBook feature flags** without shipping a new release.

Additional defaults:
- Returns 2,000 lines from the beginning by default
- Any line longer than 2,000 characters gets truncated
- Rich multi-paragraph tool description explains pagination, size caps, image/PDF/notebook support, and encourages parallel reads
- **File dedup**: if the model re-reads the same file at the same range and the file mtime hasn't changed, Claude Code returns a stub instead of full content — avoids duplicate tokens

Philosophy: **harness-first with remote tunability**

## Pre-Query Optimization

Runs before every API call, regardless of context pressure:
- Oversized tool results persisted to disk, replaced with **2KB previews**
- Per-tool cap: 50,000 characters
- Per-message aggregate cap: 200,000 characters
- Means a 60KB grep result gets offloaded on the very first turn of a new session

## Session Compaction

- Trigger: estimated tokens exceed context window minus **13,000-token buffer** (~167K tokens for a 200K-context model)
- Structured **9-section summarization prompt**: primary request, key technical concepts, files and code, errors and fixes, problem solving, all user messages, pending tasks, current work, optional next step
- Summary placement: user message stating "session continued from a previous conversation that ran out of context"
- **Post-compact restoration**: up to 5 recently-read files re-attached to context within a token budget
- **Summarizer safety**: model produces an analysis scratchpad + final summary in separate tagged blocks; scratchpad is stripped before entering context
- **Fallback on prompt-too-long**: if the compaction call itself hits the context limit, deterministic head-drop removes oldest API-round groups (20% of groups or enough to close the token gap)

## Subagent Handling

Two paths:
- **Default typed-agent path**: blank conversation; delegated prompt is the only user message, no parent history
- **Fork path**: passes entire parent message history into the child for prompt cache sharing, plus a synthetic assistant message and placeholder tool results
- Tools rebuilt for worker with their own permission mode; async agents get an explicit tool allowlist
- Skills referenced in agent definition are **eagerly preloaded** — full skill content injected as user messages into the initial conversation, not loaded on demand

## 相关页面

[[arize-alyx]], [[swe-atlas]]
- [[letta-code]], [[openclaw]]
