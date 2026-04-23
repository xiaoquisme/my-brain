---
title: HarnessCard
created: 2026-04-23
updated: 2026-04-23
tags: [harness-engineering, agent-evaluation, reproducibility, reporting-standards]
sources:
  - ../../sources/articles/harness-engineering-car-harnesscard.md
related:
  - harness-engineering.md
  - car-framework.md
  - coding-agents.md
  - agent-evaluation.md
---

## Summary

HarnessCard is a lightweight reporting artifact proposed by He et al. (2026) for disclosing the harness configuration of language agent systems. Similar to how Model Cards document model properties, HarnessCard documents the apparatus that makes an agent claim interpretable, comparable, and reproducible.

## Key Points

### Purpose
- Make agent claims **comparable** across different systems
- Enable **auditable** harness configurations
- Support **reproducible** agent evaluations
- Reveal the **harness-sensitive** component of reported gains

### Required Fields

| Field | What to Disclose |
|-------|------------------|
| **Base model(s)** | Model name, version, decoding settings, finetuning or adapters |
| **Control artifacts** | System instructions, AGENTS.md, repo maps, architecture rules, schemas, tests, linters, done-when criteria |
| **Runtime policy** | Memory type, compaction/summarization policy, checkpointing, retry/rollback policy, budget limits |
| **Action substrate** | Tools, APIs, browser/GUI access, code execution, interface schemas, MCP usage |
| **Execution topology** | Single vs multi-agent structure, planner/verifier roles, reviewer loops, routing logic |
| **Feedback stack** | Tests, graders, reflection prompts, hidden checks, human interventions, repair loops |
| **Governance layer** | Permissions, sandboxing, escalation rules, policy checks, provenance logging, audit support |
| **Observability** | Stored traces, replay support, latency and cost logging, failure categories |
| **Evaluation protocol** | Task set, number of runs, success criteria, variance treatment, held-out checks, budget limits |

### Recommended Fields

| Field | What to Disclose |
|-------|------------------|
| **Release artifacts** | Prompts or programs, tool specs, traces, configs, environment setup, reproducibility notes |
| **Known limitations** | Unresolved failure modes, portability caveats, safety concerns, red-team findings |

## Example: Repository Coding Agent

| Field | Illustrative Disclosure |
|-------|------------------------|
| Base model(s) | Frontier coding model configured through repo or user profiles; effort tuned for long tasks |
| Control artifacts | Root-level AGENTS.md; repository map; build/test/lint commands; architecture rules; done-when criteria |
| Runtime policy | Repository treated as system of record; thread history; progress file; compaction near context limits; bounded retries |
| Action substrate | File edits, shell commands, test runs, diff generation, PR review, optional MCP tools |
| Execution topology | Plan → edit → run tools → observe → repair → update status → repeat; optional reviewer loop |
| Feedback stack | Failing tests, custom linter messages, self-review, grader checks, occasional human review |
| Governance layer | Sandbox mode, approval policy for privileged actions, least-privilege connectors, audit trail |
| Observability | Persisted thread events, replay support, latency and cost logs, categorized failures |
| Evaluation protocol | Standard coding benchmark; 3 runs per task; pass@1 and pass@3; variance reported |

## Why It Matters

### The Visibility Gap
He et al. audit 63 harness-relevant works and find:
- Academic papers often treat harness as "hidden implementation residue"
- Public engineering notes (Anthropic, OpenAI) describe innovations not yet in papers
- Without HarnessCard, it's unclear whether gains come from model or harness

### Comparison with Model Cards

| Aspect | Model Card | HarnessCard |
|--------|------------|-------------|
| Focus | Model properties | Agent system apparatus |
| Disclosure | Training data, biases, capabilities | Control, agency, runtime configuration |
| Goal | Transparency about model | Reproducibility of agent claims |
| Analogy | "What is this model?" | "How does this agent work?" |

## Relationship to Other Concepts

- **CAR Framework**: HarnessCard documents each layer of ⟨C, A, R⟩
- **Harness Engineering**: HarnessCard is the reporting artifact of harness engineering practice
- **Agent Evaluation**: HarnessCard makes evaluation claims interpretable and comparable

## Open Questions

- What fields should be truly required vs recommended?
- How to handle proprietary harnesses that can't fully disclose?
- Should HarnessCard become a community standard or remain a proposal?
- How does HarnessCard interact with evaluation frameworks (HAL, ATBench, VeRO)?

---
## Evidence Timeline

- **2026-04-23**: Created from He et al. "Harness Engineering for Language Agents" (Alibaba-NTU, Preprints.org)
- **2026-04-23**: HarnessCard proposed as lightweight reporting artifact with 9 required + 2 recommended fields
- **2026-04-23**: Purpose: make agent claims comparable, auditable, reproducible
