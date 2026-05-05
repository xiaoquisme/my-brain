---
title: Ashby's Law (Law of Requisite Variety)
created: 2026-04-07
updated: 2026-04-07
type: concept
tags: [cybernetics, systems-thinking, control-theory]
sources:
  - ../../sources/articles/martin-fowler-harness-engineering.md
confidence: medium
related:
  - harness-engineering.md
  - coding-agents.md
---

## Summary

A control system must have at least as much variety (number of possible states) as the system it controls. Otherwise, some states will be ungovernable. Formulated by W. Ross Ashby in 1956.

> "Only variety can absorb variety."

## Key Points

- **The law**: Variety of the regulator >= Variety of the system being regulated
- **Implication 1**: You can increase the regulator's variety (more controls, more checks)
- **Implication 2**: You can decrease the system's variety (constrain the solution space) — often more practical
- **Origin**: Cybernetics / control theory (W. Ross Ashby, *An Introduction to Cybernetics*, 1956)

## Applications

### Harness Engineering
- AI agents can generate unbounded code variations (high variety)
- Constraining the solution space (fixed service topology, strong types, framework conventions) reduces agent output variety
- This makes comprehensive harnesses feasible — you can actually cover the space

### Knowledge Management (this wiki)
- Fixed directory structure + page templates = constrained variety
- Makes maintain/lint workflows reliable — they know what to check
- Without schema constraints, a knowledge base drifts into chaos

### Software Architecture
- Microservices with standardized templates vs. freeform services
- Convention over configuration (Rails philosophy)
- Platform engineering: reduce choices developers need to make

## Open Questions

- Where's the sweet spot between constraining variety (productivity) and allowing it (innovation)?
- Does over-constraining a coding agent reduce its ability to find novel solutions?

---
## Evidence Timeline

- **2026-04-07**: Created from query; referenced in Böckeler's harness engineering article as applied principle

## 相关页面

[[harness]], [[harness-engineering]]
