---
title: Prithvi Rajasekaran
created: 2026-04-07
updated: 2026-04-07
type: entity
tags: [anthropic, ai-agents, frontend-design]
sources:
  - ../../sources/articles/anthropic-harness-design-long-running.md
related:
  - ../concepts/harness-engineering.md
  - ../concepts/coding-agents.md
---

## Summary

Engineer at Anthropic Labs. Authored "Harness Design for Long-Running Application Development" (2026-03-24), demonstrating GAN-inspired generator-evaluator separation for complex frontend tasks.

## Key Points

- Proposed **three-agent architecture**: Planner → Generator → Evaluator with structured file communication
- Identified **self-evaluation bias** as a core problem — agents overpraise their own output
- Demonstrated **GAN-style feedback loop**: evaluator biased toward skepticism via iterative prompt tuning
- Showed **cost-quality tradeoff**: Retro Game Maker — $9/20min (broken) vs $200/6h (polished), 20x cost for qualitative leap
- Key insight: as model capabilities improve (Opus 4.6), **harness scaffolding can be simplified** — removed sprint decomposition

## Open Questions

*None currently*

---
## Evidence Timeline

- **2026-04-07**: Created from "Harness Design for Long-Running Application Development" article (published 2026-03-24)

## 相关页面

[[barry-zhang]], [[erik-schluntz]], [[rosa]]

