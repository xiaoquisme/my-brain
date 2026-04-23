---
title: "Harness Engineering for Language Agents: The Harness Layer as Control, Agency, and Runtime"
url: https://doi.org/10.20944/preprints202603.1756.v2
date_added: 2026-04-23
type: paper
tags: [harness-engineering, language-agents, car-framework, harnesscard, agent-evaluation, context-engineering]
authors:
  - Chaoyue He (Alibaba-NTU ANGEL Lab)
  - Xin Zhou (Alibaba-NTU ANGEL Lab)
  - Di Wang (Alibaba-NTU ANGEL Lab)
  - Hong Xu (Alibaba-NTU ANGEL Lab)
  - Wei Liu (Alibaba Group)
  - Chunyan Miao (Alibaba-NTU ANGEL Lab)
doi: 10.20944/preprints202603.1756.v2
---

# Harness Engineering for Language Agents

## Abstract

Language agents that act through tools, files, browsers, APIs, and persistent sessions are shaped by more than the base model or a single prompt. Their reliability depends on a harness layer that determines which instructions remain authoritative, what actions are available, how state is carried forward, and how failures are handled over time.

This paper argues that this layer warrants explicit treatment in NLP. Key contributions:

1. **CAR Framework**: Proposes Control, Agency, Runtime (CAR) decomposition of the harness layer
2. **Harness Engineering Positioning**: Situates harness engineering in the arc from software engineering → prompt engineering → context engineering → harness engineering
3. **Visibility Gap**: Audits 63 harness-relevant works, finding a meaningful gap between academic papers and public engineering notes
4. **HarnessCard**: Proposes a lightweight reporting artifact for disclosing harness configurations

## Key Arguments

### The Harness Layer is Real and Reportable

- Many reported agent gains may be partly **harness-sensitive** rather than purely model-driven
- Two systems with the same frontier model can behave very differently based on their harness
- Progress in language agents should report not only the model, but also the harness layer

### CAR Decomposition

The harness layer H = ⟨C, A, R⟩:

**Control (C)**: Durable artifacts that shape behavior before action
- Repository maps, AGENTS.md, tool descriptions
- System instructions, architecture rules
- Tests, linters, permission policies, success criteria
- "Reliable agents are rarely bounded by prompt wording; they are often bounded by specifications"

**Agency (A)**: How the model is allowed to act
- Action substrates (code execution, browser interaction)
- Planner-verifier or orchestrator-worker structures
- Reviewer roles and action space interfaces
- "The mediated action surface and delegation structure that the harness permits"

**Runtime (R)**: What happens as work unfolds over time
- Context assembly, memory and compaction
- Checkpointing, retries, backtracking
- Approval flows, budgets, trace collection, replay support
- "Many agent failures are runtime failures: stale state, brittle retry loops, overgrown context"

### HarnessCard Template

A lightweight reporting artifact with Required and Recommended fields:

| Field | Priority |
|-------|----------|
| Base model(s) | Required |
| Control artifacts | Required |
| Runtime policy | Required |
| Action substrate | Required |
| Execution topology | Required |
| Feedback stack | Required |
| Governance layer | Required |
| Observability | Required |
| Evaluation protocol | Required |
| Release artifacts | Recommended |
| Known limitations and risks | Recommended |

### Engineering Evolution

```
Software Engineering → Prompt Engineering → Context Engineering → Harness Engineering
```

- **Prompt Engineering**: Wording of instructions
- **Context Engineering**: What information is provided
- **Harness Engineering**: The full extra-model layer governing behavior

## Mini-Cases

### Repository Coding Agent
Two systems share the same frontier model and task prompt but differ because one harness adds:
- Repository map, root-level AGENTS.md (Control)
- Required tests, linter, bounded shell access (Agency)
- Progress file, retries, escalation logic (Runtime)

### Browser/Research Agent
Two systems share the same browsing-capable model but differ because one harness defines:
- Source hierarchy, citation rules, note-taking format (Control)
- Search, browser, and delegation surface (Agency)
- Scratchpads, branching traces, recovery (Runtime)

## Key References

- Anthropic evals note (2026): Defines agent harness, evaluation harness
- OpenAI harness note (2026): Names harness engineering practice
- Anthropic long-running application harness note (2026): Generator-evaluator structure
- OpenAI Agents SDK (2026): Reusable harness primitives
- Meta-Harness (2026): Automated harness search

---
## Evidence Timeline

- **2026-04-23**: Paper published on Preprints.org, 25 pages, 63 works audited
- **2026-04-23**: Key concepts: CAR framework, HarnessCard, visibility gap
- **2026-04-23**: Authors: Chaoyue He et al., Alibaba-NTU ANGEL Lab
