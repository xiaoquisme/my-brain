---
title: "Claude Code from Source — Architecture, Patterns & Internals"
created: 2026-04-10
updated: 2026-04-17
type: entity
tags: [claude-code, ai-agents, architecture, typescript, agentic-systems, tool-use, multi-agent, prompt-caching, mcp]
sources:
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch01.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch02.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch03.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch04.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch05.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch06.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch07.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch08.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch09.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch10.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch11.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch12.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch13.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch14.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch15.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch16.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch17.md
  - ../../sources/books/claude-code-from-source/claude-code-from-source-ch18.md
related:
  - ../concepts/coding-agents.md
  - ../concepts/agentic-patterns.md
  - ../concepts/kv-cache-and-prompt-caching.md
  - ../concepts/harness-engineering.md
  - ../concepts/tool-use-as-meta-ability.md
  - ../concepts/claude-code-session-management.md
  - ../people/alejandro-balderas.md
  - ../projects/claude-code-workflow.md
  - ../projects/ddia.md
---

## Summary

"Claude Code from Source" is a comprehensive 18-chapter technical book by Alejandro Balderas that reverse-engineers Claude Code's architecture from leaked source maps in npm packages. It reveals that Claude Code is a TypeScript monolith of ~2,000 files built around 6 core abstractions: Query Loop, Tool System, Tasks, State Layer, Hooks, and Memory. The book covers everything from 240ms bootstrap to multi-agent swarm orchestration, with each chapter ending in transferable "Apply This" patterns.

## Key Points

### The Six Core Abstractions (Ch 1)
1. **Query Loop** (`query.ts`, ~1,700 lines) — Async generator as the heartbeat. Streams model responses, executes tools, loops. Returns a discriminated union `Terminal` encoding stop reasons.
2. **Tool System** (`Tool.ts`) — Self-describing tools with identity, schema, permissions, concurrency declarations, UI rendering. Partitioned into concurrent/serial batches.
3. **Tasks** (`Task.ts`) — Background sub-agents following state machine: `pending -> running -> completed | failed | killed`. Recursive agent capability.
4. **State** (two tiers) — Mutable singleton `STATE` (~80 fields) for infrastructure + Zustand-shaped reactive store (34 lines) for UI.
5. **Memory** (`memdir/`) — Three-tier persistent context: project (`CLAUDE.md`), user (`~/.claude/MEMORY.md`), team (symlinks). LLM selects relevant memories at session start.
6. **Hooks** (`hooks/`) — 27 lifecycle events × 4 execution types. Can block tools, modify inputs, short-circuit the loop.

### Bootstrap Pipeline (Ch 2)
- 5-phase initialization achieving 240ms startup
- Module-level I/O parallelism (all network/disk operations start simultaneously)
- Trust boundary establishment before any tool execution

### Two-Tier State (Ch 3)
- Infrastructure state (mutable singleton, set once, read many)
- UI state (reactive store, Zustand-shaped, drives re-renders)
- Sticky latches for irreversible state transitions
- Cost tracking integrated into state

### API Layer (Ch 4)
- Multi-provider architecture: Direct API, AWS Bedrock, Google Vertex AI, Foundry
- `getAnthropicClient()` factory — provider selection at startup, transparent to consumers
- Prompt cache optimization: byte-identical prefixes
- Streaming with error recovery and retries

### The Agent Loop (Ch 5)
- `query.ts` deep dive: async generator with `for await` backpressure
- 4-layer context compression when token budget exhausted
- Error recovery: retry strategies for transient failures
- Token budgets and max turns as safety limits

### Tool Execution Pipeline (Ch 6-7)
- 14-step pipeline from model request to tool result
- Permission resolution chain: 7 modes from bypass to bubble
- `auto` mode: lightweight LLM classifier for semi-autonomous operation
- Concurrent execution: partition algorithm classifies tools as concurrent-safe or serial
- **Streaming executor** starts concurrent tools before model finishes response (speculative execution)

### Multi-Agent Orchestration (Ch 8-10)
- `AgentTool` spawns sub-agents with own message history, tools, permission mode
- **Fork agents** (Ch 9): byte-identical prompt prefix sharing for 95% cache hit rate
- **Coordinator mode**: parent assigns tasks, children report back
- **Swarm teams**: mailbox messaging between peer agents
- Task state machine with clean lifecycle management
- Permission bubbling: sub-agents escalate dangerous actions upward

### Memory System (Ch 11)
- 4-type taxonomy: project, user, team, conversation
- File-based memory with frontmatter metadata
- LLM-powered recall: Sonnet side-query beats embedding search
- Staleness warnings for old memories

### Extensibility (Ch 12)
- Two-phase skill loading: metadata at startup, content on demand
- 27 lifecycle hooks with 4 execution types
- Config snapshots frozen at startup to prevent injection attacks

### Terminal UI (Ch 13-14)
- Custom Ink fork for terminal rendering
- Double-buffer rendering pipeline with object pools
- Key parsing, keybindings, chord support, vim mode emulation

### MCP Integration (Ch 15)
- 8 transport types for MCP servers
- OAuth for MCP authentication
- Tool wrapping: MCP tools integrated into native tool system

### Remote Execution (Ch 16)
- Bridge v1/v2 protocols for remote control
- Claude Code Remote (CCR) for cloud execution
- Upstream proxy for enterprise deployments

### Performance Engineering (Ch 17)
- 240ms startup via parallel I/O
- Slot reservation: saving context in 99% of requests
- Bitmap pre-filters for fuzzy search
- Every millisecond and token accounted for

### Epilogue — Architectural Bets (Ch 18)
- 5 architectural bets that defined the system
- What transfers to other agent systems
- Where agents are heading next

## Transferable Patterns (Apply This)

1. **Generator loop pattern** — Async generator > callbacks/event emitters. Natural backpressure, clean cancellation, typed terminal states.
2. **Self-describing tool interface** — Tools declare their own concurrency, permissions, rendering. No central orchestrator god-object.
3. **Two-tier state** — Infrastructure state (mutable singleton) + UI state (reactive store). Match access patterns to reactivity needs.
4. **Permission modes, not checks** — Named modes (plan/default/auto/bypass) with single resolution chain.
5. **Recursive agent architecture** — Sub-agents = same loop + own message history. Permission bubbling upward.
6. **Fork agents for cache sharing** — Byte-identical prefixes for 95% cost reduction in multi-agent scenarios.
7. **Speculative tool execution** — Start concurrent-safe tools before model finishes response.
8. **File-based memory with LLM recall** — Beats embedding search, simpler infrastructure.

## Open Questions

- How does the `auto` permission classifier perform in adversarial scenarios?
- What are the failure modes of speculative tool execution at scale?
- How does the 4-layer compression affect long-running agent performance?

---
## Evidence Timeline

- **2026-04-10**: Ingested full book (18 chapters) from https://claude-code-from-source.com/. Author: Alejandro Balderas. Source: reverse-engineered from Claude Code npm source maps.

## 相关页面

[[alejandro-balderas]], [[claude-code-workflow]]

