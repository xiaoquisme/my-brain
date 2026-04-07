---
title: Meta-Harness
created: 2026-04-07
updated: 2026-04-07
tags: [harness-engineering, optimization, ai-agents, automated-search]
sources:
  - ../../sources/articles/meta-harness-optimization.md
  - ../../sources/articles/meta-harness-library-jagtap.md
related:
  - harness-engineering.md
  - coding-agents.md
  - ../people/chelsea-finn.md
  - ../people/omar-khattab.md
  - ../people/shashikant-jagtap.md
---

## Summary

Meta-Harness is an automated search system that discovers optimal harness configurations for LLM systems. Instead of manually engineering prompts, retrieval strategies, and context management, it uses a coding agent to iteratively propose, evaluate, and refine harness code — achieving results that surpass hand-engineered solutions.

## Key Points

- **Harness design matters enormously**: Same model, same benchmark, different harness → up to 6x performance variation with frozen weights
- **Agent-as-optimizer**: The proposer is itself a coding agent (Claude Code / Opus 4.6) that reads source code, execution traces, and metrics via filesystem access
- **Raw traces > summaries**: Ablation shows full execution trace access (50.0%) dramatically outperforms scores-only (34.6%) or scores+summaries (34.9%)
- **Scale of diagnosis**: Each iteration generates ~10M tokens of diagnostic info — 1000x more than prior text optimization methods
- **Transfer**: Discovered harnesses generalize across unseen models and out-of-distribution datasets
- **Practical**: Search completes in hours, output is human-readable code
- **Recursive improvement**: "As coding agents become more capable, Meta-Harness improves automatically" — the optimizer gets better for free

## Discovered Patterns

Three concrete harness designs were discovered:

1. **Label-primed classification**: Show full label space upfront + contrastive examples (same query, different labels) → 7.7 points over SOTA, 75% fewer tokens
2. **Subject-routed math retrieval**: Four-route lexical router with domain-specific policies → +4.7 points across 5 models on IMO-level problems
3. **Environment bootstrapping**: Inject system snapshot (OS, languages, packages, directory contents) before agent's first step → eliminates 2-4 exploratory turns on coding tasks

## Implications for Harness Engineering

This shifts the question from "how do I write the best harness?" to "how do I define the right search space?" Key implications:

- Manual harness engineering may become the **seed** for automated search rather than the final product
- The value shifts to **evaluation design** — you need good metrics and representative test instances
- **Proposer capability = search quality** — better coding agents directly improve harness discovery
- Future direction: co-evolving harness and model weights together

## Open-Source Implementation

Shashikant Jagtap built `superagentic-metaharness`, an open-source Python library inspired by the research paper:

- **Filesystem-first approach**: All candidate workspaces, proposals, validation results stored on disk for full audit trail
- **Write scope enforcement**: Restricts which paths the agent can edit during optimization
- **Environment bootstrap snapshots**: Captures system state before runs
- **CLI + experiment matrices**: Scriptable experimentation
- **Provider**: Codex (hosted + local Ollama) as primary validated backend; Gemini, Pi, OpenCode experimental
- Install: `uv tool install superagentic-metaharness`
- Status: Alpha release, single validated provider path

## Open Questions

- Does this work for more open-ended tasks where evaluation is harder to automate?
- What's the right granularity of the search space — too narrow limits discovery, too broad is intractable?
- How to prevent overfitting to evaluation instances while still finding meaningful improvements?
- How does the open-source library's filesystem-first approach compare to the research paper's implementation?

---
## Evidence Timeline

- **2026-04-07**: Created from Lee et al. 2026 (arXiv:2603.28052) — automated harness search outperforming manual engineering across classification, math reasoning, and coding benchmarks
- **2026-04-07**: Added open-source implementation by Shashikant Jagtap — `superagentic-metaharness` Python library with filesystem-first design
