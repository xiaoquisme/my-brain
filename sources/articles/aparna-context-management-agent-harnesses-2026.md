---
source_url: https://x.com/aparnadhinak/status/2048492731929149929
ingested: 2026-04-28
author: Aparna Dhinakaran (@aparnadhinak, founder @arizeai)
title: Context Management in Agent Harnesses
published: 2026-04-26
sha256: 7aad89b11dfcc34ed965c924c16de21e67929b355f8a7db70a75dda0eb819d95
---

# Context Management in Agent Harnesses

Every agent harness runs into the same limit: the context window is too small for everything the model might want to remember. As sessions grow, file reads expand, subagent calls multiply, and tool outputs pile up, the harness has to decide what stays in the working set, what gets compressed, and what gets retrieved later.

We've spent the last two years building Alyx, Arize's in-product agent, and we have hit every version of this problem. We saw sessions grow until the model lost track of the task, file reads consume half the context window with boilerplate, and tool results crowd out the actual conversation.

The important question is no longer just what goes into the prompt. It is how the harness manages context over time. The best systems do not treat the context window like a passive transcript buffer. They manage it actively: keeping high-value state close, paging through data on demand, building indexes to find what's needed (grep does this), and truncating content in a way that hints at what else can be accessed.

Pi, OpenClaw, Claude Code, and Letta all make different choices here, but they are converging on a similar underlying pattern. Context is no longer just whatever fits in the transcript. It is something the system has to manage actively. The real design question is how much of that management happens inside the harness, and how much the model is expected to do for itself.

## The bet: trust the model to manage its own context

Every context management decision encodes an assumption about model behavior. The key question is whether the harness should proactively constrain context usage or rely on the model to manage that budget correctly on its own.

File reads make this concrete. When a model needs to read a file larger than what fits in context, someone has to decide what to keep. All four harnesses support offset and limit parameters for pagination.

### Pi (pi-mono)

Pi reads files with a hard cap of 2,000 lines or 50KB, whichever hits first, even if the model doesn't ask for a slice. Content is head-truncated, and the tool output appends an explicit continuation nudge: [Showing lines 1-2000 of 50000. Use offset=2001 to continue.] The tool description reinforces this: "output is truncated to 2000 lines or 50KB. Use offset/limit for large files."

Pi's approach is harness-first: the harness protects you, then teaches the model to paginate.

### OpenClaw

OpenClaw inherits Pi's read tool and its 2K line / 50KB truncation. It acts the same on normal file reads. On top of that, it layers additional caps for bootstrap files, one-time context files loaded at session start: 12,000 chars per file and 60,000 chars total. When a bootstrap file exceeds its budget, it uses a 75% head / 25% tail split: you see the beginning and end, with the middle cut.

Tool results get a separate budget: 16,000 chars or 30% of the context window, whichever is smaller. When the tail looks "important" (errors, JSON close braces, summary keywords), it switches to head+tail mode; otherwise it just keeps the beginning.

OpenClaw's approach is defense in depth: Pi's truncation as the first layer, then additional caps on bootstrap injection, then tool result budgets on top.

### Claude Code

Claude Code applies a two-layer defense on file reads. The first gate is a 256KB byte cap checked via a stat call before the file is even opened - if the file exceeds that, the read is rejected immediately with an error that points the model to use offset/limit or grep instead. The second gate runs after the read: the output is token-counted against a 25,000 token budget, catching files that slip under the byte cap but are token-dense. Both limits are remotely tunable by Anthropic via GrowthBook feature flags without shipping a new release.

Even when a file is under the cap, the tool defaults to returning 2,000 lines from the beginning, and any line longer than 2,000 characters gets truncated. The model has to explicitly request more with offset and limit parameters.

The tool description is a full multi-paragraph prompt that explains pagination, mentions the size cap, covers image/PDF/notebook support, and encourages parallel reads across multiple files. The offset and limit parameters have their own descriptions telling the model they're for files too large to read at once. There's also a conditional instruction that surfaces the 256KB cap directly in the prompt depending on a feature flag.

The file dedup system is worth noting too. If the model re-reads the same file at the same range and the time hasn't changed, Claude Code returns a stub instead of the full content, avoiding duplicate tokens in context.

Claude Code's approach is harness-first with remote tunability: a pre-read byte gate, a post-read token gate, line-count and line-length defaults, an actionable error message, a rich tool prompt, read deduplication, and feature flags that let Anthropic adjust all of it server-side.

### Letta

Letta Code reads files from the local filesystem with a pattern that has a lot of similarities to Claude Code but open in the model you can use. The source comments say as much: "Limits based on Claude Code's proven production values." The Read tool does a stat call first, rejecting anything over 10MB. It then returns a contiguous window of up to 2,000 lines starting from an optional offset, with each line capped at 2,000 characters. When a file is truncated by line count, the tool appends a continuation nudge telling the model to use offset and limit to read other sections.

When truncation happens, the full content is written to an overflow file on disk, and the path is appended to the output. Tool outputs get per-tool character caps: 30,000 for bash and subagent results, 10,000 for grep. Middle truncation (keep beginning and end, drop middle) is the default for tool outputs and is configurable via environment variables.

What makes Letta Code distinct is MemFS: a git-backed memory filesystem where the agent's persistent memory lives as markdown files. Files in the system/ subdirectory are pinned to the system prompt and always in context. Files outside system/ are visible in a tree listing by name and description but not loaded until the agent reads them. The agent manages its own progressive disclosure by moving files in and out of system/, reorganizing the hierarchy, and updating file descriptions. Memory edits are committed and synced to a git remote automatically.

Letta Code's approach is convergent on reads (stat-before-read, line cap, offset/limit, continuation nudge, overflow to disk) while adding a persistent memory layer that none of the other three have. It is also the only harness in this group that is fully open source under Apache 2.0, so every design decision is visible and auditable.

## Where the real engineering is: session pruning

As conversations grow, every harness has to decide what to keep and what to throw away. This is where the design differences become most meaningful, because compaction policy determines whether long-running agents stay coherent or slowly degrade.

### Pi (pi-mono)

Pi uses compaction: LLM-powered summarization triggered by a token threshold.

- Trigger: Estimated context tokens exceed contextWindow - reserveTokens (default reserve: 16,384 tokens)
- What's kept: Walks backward through conversation, keeping the most recent ~20,000 tokens of messages (keepRecentTokens)
- What's summarized: Everything older gets passed to the LLM for summarization
- Where the summary goes: Becomes a synthetic user message prepended to the kept tail
- Tool-call safety: Never cuts at an orphaned tool result. Walks boundaries to keep tool-call/tool-result pairs intact

### OpenClaw

OpenClaw runs two distinct context management mechanisms on top of Pi's compaction:

- Trigger: History exceeds 50% of the context window (maxHistoryShare, default 0.5)
- What's kept: History is split into equal-mass token chunks; the oldest chunk is dropped, the rest is kept with tool-call/result pairs repaired
- What's summarized: Dropped content goes through staged multi-pass LLM summarization with a merge step
- Where the summary goes: Same as Pi - synthetic message prepended to the kept tail
- Tool-call safety: repairToolUseResultPairing fixes any orphaned tool results after chunk dropping; splitMessagesByTokenShare avoids cutting inside a tool-call/result pair
- Pre-compaction flush: A silent agentic turn lets the agent persist state to memory files before history disappears
- Second layer: Non-destructive in-memory pruning of tool results (soft-trim, then hard-clear) on a 5-minute cache TTL, protecting the persistent conversation while reclaiming context for the current request

### Claude Code

Claude Code manages context through pre-query optimization and LLM-powered compaction.

- Trigger: Estimated tokens exceed the effective context window minus a 13,000-token buffer (compaction fires around 167K tokens for a 200K-context model)
- What's summarized: The full conversation is sent to the model with a structured 9-section prompt covering primary request, key technical concepts, files and code, errors and fixes, problem solving, all user messages, pending tasks, current work, and optional next step
- Where the summary goes: Becomes a user message telling the model the session is being continued from a previous conversation that ran out of context
- Post-compact restoration: Up to 5 recently-read files are re-attached to context after compaction, within a token budget
- Summarizer safety: The model produces an analysis scratchpad and a final summary in separate tagged blocks. The scratchpad is stripped before the summary enters context, improving quality without bloating the result
- Fallback on prompt-too-long: If the compaction call itself hits the context limit, a deterministic head-drop removes the oldest API-round groups (20% of groups or enough to close the token gap)
- Pre-query optimization (every API call, regardless of context pressure): Before each model call, Claude Code runs a pipeline that manages tool results but leaves conversation text untouched. Oversized tool results are persisted to disk and replaced with 2KB previews, with a per-tool cap of 50,000 characters and a per-message aggregate cap of 200,000 characters.

### Letta

Letta Code manages context through server-side compaction and client-side memory consolidation.

- Trigger: Compaction is handled server-side by the Letta API. The client receives compaction events via the streaming API and tracks context token history using a 4-bytes-per-token heuristic for local estimates
- What's summarized: The server runs LLM-powered summarization using letta/auto as the default model, then streams back a summary message with the condensed text and stats (tokens before/after, message counts)
- Where the summary goes: Managed server-side. The client sees a finished compaction event with summary text and token statistics, then marks subsequent usage data as post-compaction
- Reflection subagents: When a compaction event fires (the default trigger) or a configurable step-count threshold is reached (25 user messages if enabled), Letta Code launches a background reflection subagent. The reflection subagent receives a transcript of recent conversation and a snapshot of the parent's memory, then edits the git-backed memory repository in a worktree. On completion, it triggers a system prompt recompile so the parent agent picks up the new memories. Reflection prompts are budget-capped at 16,000 tokens
- Knowledge persistence: Important state migrates from ephemeral conversation history into durable memory files, reducing how much the server needs to retain through compaction. This is the most ambitious approach to long-term agent memory in any harness reviewed.

## Sub-agent context management

Across the harnesses, sub-agents are generally isolated from the parent session. None copies the full parent conversation history into the child by default.

- Pi spawns a new process per delegated task with an in-memory session. The child receives the task string as its only user message. No parent conversation history is passed.
- OpenClaw gives sub-agents fresh isolated sessions by default, no parent transcript. A fork mode exists that copies the parent's transcript into the child, but only for same-agent spawns. Workspace context is filtered to a minimal allowlist (AGENTS.md, TOOLS.md, SOUL.md).
- Claude Code has two paths. The default typed-agent path creates a blank conversation. A newer fork path passes the entire parent message history into the child for prompt cache sharing, plus a synthetic assistant message and placeholder tool results. Skills referenced in the agent definition are eagerly preloaded — the full skill content is injected as user messages into the initial conversation, not loaded on demand.
- Letta Code has seven built-in subagent types. The fork subagent calls the Letta API's conversation fork endpoint, creating a server-side copy of the parent's full message history. Non-fork subagents launch as fresh headless instances with the task prompt as the sole user message. Existing Letta API agents can also be deployed as subagents by agent ID, bringing their own persistent memories.

## Where the designs converge

All four harnesses hard-cap file reads. All four support offset/limit pagination. All four cap tool result sizes. All four isolate sub-agent sessions. All four run LLM-powered compaction triggered by a token threshold. All four estimate context usage and detect pressure.

The convergence runs deeper: Pi and OpenClaw both head-truncate file reads and append a continuation nudge. Claude Code and OpenClaw both persist oversized tool results to disk. Pi, OpenClaw, and Claude Code all enforce tool-call/result boundary safety during compaction. Three of the four support forking parent transcripts into sub-agents.

Arize's own Alyx assistant independently arrived at the same designs: caps tool results at a 10,000-token budget, deduplicates idempotent tool calls, splits large JSON payloads into LLM-visible preview + full server-side copy, does head+tail truncation with back-references, estimates token pressure with char/4 heuristic, forces checkpoint at 50,000 tokens.

50 years of computing taught us that the best memory management is the kind the program never thinks about. Registers, cache lines, page tables, swap. Each layer managed by the system, each invisible to the layer above. Agent harnesses are moving in the same direction: give the model the right working set at the right time and allow it to dynamically manage its own context.
