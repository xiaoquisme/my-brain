---
title: Agent Context Management
created: 2026-04-28
updated: 2026-04-28
type: concept
tags: [agent, inference, architecture]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md]
related:
  - ../projects/letta-code.md
  - ../projects/claude-code-harness.md
---

# Agent Context Management

Agent harnesses share a fundamental constraint: the context window is finite. As sessions grow, file reads expand, subagent calls multiply, and tool outputs pile up. The harness must decide what stays in the working set, what gets compressed, and what gets retrieved on demand.

The core design question is **how much management happens inside the harness vs. how much the model is expected to do for itself**.

## Three Layers of Management

### 1. File Read Caps

All major harnesses hard-cap file reads and provide offset/limit pagination. Common patterns:

| Harness | Hard cap | Default lines | Truncation style | Continuation nudge |
|---|---|---|---|---|
| ../projects/pi-mono.md | 2,000 lines / 50KB | 2,000 | Head | Yes — appended to output |
| ../projects/openclaw.md | Inherits Pi + bootstrap caps | 2,000 | 75% head / 25% tail | Yes |
| ../projects/claude-code-harness.md | 256KB pre-read, 25K tokens post-read | 2,000 | Head + line-length cap | Yes + rich tool description |
| ../projects/letta-code.md | 10MB pre-read, 2,000 lines | 2,000 | Head | Yes + overflow to disk |

Claude Code and Letta both do a stat call *before* opening the file — rejecting oversized files immediately instead of reading and truncating.

### 2. Session Compaction

All harnesses use LLM-powered compaction triggered by a token threshold. Key variants:

- **Pi**: Keeps most recent ~20K tokens, summarizes older history as a synthetic user message. Never cuts tool-call/result pairs.
- **OpenClaw**: Chunks history by equal token mass, drops oldest chunk, multi-pass summarization. Adds pre-compaction flush (silent agentic turn to persist state) and a second layer of non-destructive tool-result pruning on a 5-minute TTL.
- **Claude Code**: Structured 9-section summarization prompt; post-compact restoration of up to 5 recently-read files; pre-query optimization offloads oversized tool results to disk (50K char/tool, 200K char/message aggregate) before every API call regardless of context pressure.
- **Letta**: Server-side compaction + reflection subagents that write important state into a git-backed MemFS, so information survives compaction as durable files.

### 3. Tool Result Budgets

| Harness | Tool result cap |
|---|---|
| OpenClaw | 16,000 chars or 30% of context window |
| Claude Code | 50K chars/tool, 200K chars/message (pre-query) |
| Letta | 30K bash/subagent, 10K grep |
| Alyx (Arize) | 10,000 tokens |

## Subagent Context Isolation

All four harnesses isolate subagent sessions from the parent by default. Fork modes exist in OpenClaw, Claude Code, and Letta that copy parent history into the child — but only on explicit opt-in. This is a convergent pattern.

See comparisons/agent-harness-subagent-patterns.md for side-by-side detail.

## Convergence

Despite independent development, all four harnesses (Pi, OpenClaw, Claude Code, Letta) converge on:
- Hard file read caps with offset/limit pagination
- LLM-powered compaction triggered by a token threshold
- Tool result size budgets
- Subagent session isolation
- Tool-call/result boundary safety during compaction

Arize's ../people/arize-alyx.md product, built for data exploration (not coding), independently converged on the same patterns: 10K token tool result cap, idempotent call deduplication, JSON payload splitting, head+tail truncation, char/4 token estimation, 50K token checkpoint.

The parallel with OS memory management is apt: registers → cache → RAM → swap. Each layer managed by the system, invisible to the layer above. Agent harnesses are building the same stack for LLMs.

## Open Questions

- At what session length does compaction quality degrade enough to matter?
- How do harnesses handle compaction of tool-heavy sessions (many parallel tool calls)?
- What's the right balance between harness-enforced limits and model self-regulation?

## 相关页面

- [[ralph]] — 每轮清空 context 的 Agent Loop 实现，代表迭代隔离策略
- [[agent-loop-pattern]] — 迭代隔离模式的抽象概念
- [[arize-alyx]]
