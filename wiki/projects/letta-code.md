---
title: Letta Code Agent Harness
created: 2026-04-28
updated: 2026-04-28
tags: [agent, open-source]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md]
related:
  - ../concepts/agent-context-management.md — concept page covering all four harnesses
- pi-mono.md — simpler harness without persistent memory
- openclaw.md — harness with pre-compaction flush
- claude-code-harness.md
---

# Letta Code

Letta Code is a fully open-source (Apache 2.0) AI agent harness. Its defining feature is **MemFS** — a git-backed memory filesystem that gives agents durable, persistent memory across sessions. It is the most ambitious long-term memory architecture of the four harnesses analyzed by Arize (2026).

Source comments in the codebase acknowledge: *"Limits based on Claude Code's proven production values."*

## File Read Management

- Pre-read **stat call**: rejects files > 10MB immediately
- Returns up to **2,000 lines** from an optional offset
- Each line capped at **2,000 characters**
- Continuation nudge appended when truncated by line count
- When truncation occurs: full content written to an **overflow file on disk**, path appended to output
- Tool output caps: 30,000 chars for bash and subagent results, 10,000 chars for grep
- Default truncation for tool outputs: **middle truncation** (keep beginning + end, drop middle) — configurable via environment variables

## MemFS: Git-Backed Memory Filesystem

The key differentiator. The agent's persistent memory lives as markdown files in a git-backed filesystem:

- `system/` subdirectory: **pinned to the system prompt** — always in context
- Files outside `system/`: visible as a tree listing (name + description) but **not loaded until the agent reads them** — progressive disclosure
- The agent manages its own context by:
  - Moving files in and out of `system/`
  - Reorganizing the hierarchy
  - Updating file descriptions
- Memory edits are committed and **synced to a git remote automatically**

This is a fundamentally different memory model: information that would be lost in compaction in other harnesses gets persisted to files the agent can always access.

## Session Compaction

- Trigger: **server-side** — handled by the Letta API. Client receives compaction events via streaming API.
- Client tracks context token history using a **4-bytes-per-token heuristic** for local estimates
- LLM summarization using `letta/auto` as default model; stats streamed back (tokens before/after, message counts)
- **Reflection subagents**: triggered by compaction event or configurable step-count threshold (default: 25 user messages):
  - Receives transcript of recent conversation + snapshot of parent's memory
  - Edits the git-backed memory repository in a worktree
  - On completion, triggers a **system prompt recompile** so parent agent picks up new memories
  - Reflection prompts budget-capped at 16,000 tokens

## Subagent Handling

Seven built-in subagent types:
- **Fork subagent**: calls Letta API's conversation fork endpoint — creates a **server-side copy** of the parent's full message history. Child has complete parent trajectory in context.
- Non-fork subagents (general-purpose, init, memory, recall, reflection): fresh headless instances with task prompt as sole user message
- Tool restrictions: per-subagent `tools` field; parent's allow/deny rules propagated to children
- Subagent results capped at 30,000 characters; full run transcript written to disk
- Skills pre-loaded into subagents as tagged blocks before the user prompt
- Existing Letta API agents can be deployed as subagents by agent ID, bringing their own persistent memories

## Open Source

Fully open source under Apache 2.0 — every design decision is visible and auditable. This makes it unique among the four harnesses reviewed.
