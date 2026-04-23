---
title: CAR Framework (Control, Agency, Runtime)
created: 2026-04-23
updated: 2026-04-23
tags: [harness-engineering, agent-architecture, control-theory, language-agents]
sources:
  - ../../sources/articles/harness-engineering-car-harnesscard.md
related:
  - harness-engineering.md
  - coding-agents.md
  - sandbox.md
  - agentic-patterns.md
  - ../people/chaoyue-he.md
---

## Summary

CAR (Control, Agency, Runtime) is a formal decomposition of the harness layer in language agent systems, proposed by He et al. (2026). It frames the harness as H = ⟨C, A, R⟩, where each layer handles a distinct function that papers routinely bundle together while leaving under-described.

## Key Points

### The Formula
**H = ⟨C, A, R⟩**

The acronym CAR keeps the ordering explicit and highlights that the harness is not just runtime plumbing. The notation is explanatory rather than a rigid ontology.

### Control Layer (C)
Durable artifacts that shape behavior **before** a step is taken:

| Artifact | Example |
|----------|---------|
| Repository maps | File structure overview for coding agents |
| AGENTS.md | Project-specific instructions and constraints |
| Tool descriptions | What each tool does, when to use it |
| System instructions | High-level behavior guidelines |
| Architecture rules | Design patterns, module boundaries |
| Tests/Linters | Automated quality gates |
| Permission policies | What actions require approval |
| Success criteria | "Done when" definitions |

**Key insight**: "Reliable agents are rarely bounded by prompt wording; they are often bounded by specifications"

### Agency Layer (A)
How the model is **allowed to act** — the mediated action surface:

| Component | Purpose |
|-----------|---------|
| Action substrates | Code execution, browser interaction, file editing |
| Delegation structures | Planner-verifier, orchestrator-worker patterns |
| Reviewer roles | Human-in-the-loop, automated review |
| Interface schemas | What the model can actually do in the environment |

**Definition**: "The mediated action surface and delegation structure that the harness permits"

**Note**: Agency here is a narrow systems sense — not about unrestricted autonomy.

### Runtime Layer (R)
What happens as work **unfolds over time**:

| Function | Implementation |
|----------|----------------|
| Context assembly | What goes into the context window |
| Memory & compaction | Keeping history manageable |
| Checkpointing | Saving progress for resumption |
| Retries & backtracking | Recovery from failures |
| Approval flows | Human escalation when needed |
| Budgets | Token limits, time limits, cost caps |
| Trace collection | Recording what happened |
| Replay support | Re-executing or debugging |

**Key insight**: "Many agent failures are runtime failures: stale state, brittle retry loops, overgrown context, or poor recovery from intermediate mistakes"

## Practical Application

### Repository Coding Agent Example
Two systems with the same frontier model behave differently:

| Layer | System A (Basic) | System B (Enhanced) |
|-------|------------------|---------------------|
| Control | Task prompt only | + Repo map, AGENTS.md, tests, linter |
| Agency | File edit, shell | + Bounded shell, approval for privileged |
| Runtime | No state tracking | + Progress file, retries, escalation |

The performance difference is **harness-driven**, not model-driven.

### Browser/Research Agent Example

| Layer | Basic | Enhanced |
|-------|-------|----------|
| Control | Task prompt | + Source hierarchy, citation rules, note format |
| Agency | Browser access | + Search, delegation surface |
| Runtime | Scratchpad | + Branching traces, conflict recovery |

## CAR vs Other Frameworks

| Framework | Focus | CAR Mapping |
|-----------|-------|-------------|
| Prompt Engineering | Instruction wording | Control (subset) |
| Context Engineering | What's in the context | Control + Runtime (subset) |
| Ashby's Law | Requisite variety | Control (constraints) |
| Meta-Harness | Automated optimization | All layers (optimization target) |

## Open Questions

- How to formally verify Control artifacts are sufficient?
- When should Agency be expanded vs constrained?
- What metrics best capture Runtime effectiveness?
- Can CAR be applied to multi-agent swarms?

---
## Evidence Timeline

- **2026-04-23**: Created from He et al. "Harness Engineering for Language Agents" (Alibaba-NTU, Preprints.org)
- **2026-04-23**: CAR decomposition: H = ⟨C, A, R⟩ formalizes what was previously bundled and under-described
- **2026-04-23**: Key insight: many "agent gains" are harness-sensitive, not purely model-driven
