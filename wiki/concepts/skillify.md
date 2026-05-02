---
title: Skillify
created: 2026-04-22
updated: 2026-04-22
type: concept
tags: [ai-agents, reliability, testing, skills]
sources:
  - ../../sources/articles/2046876981711769720.md
related:
  - ../people/garry-tan.md
  - thin-harness-fat-skills.md
  - resolver.md
  - ../projects/gbrain.md
---

## Summary

A practice introduced by Garry Tan where every AI agent failure is transformed into a permanent, tested skill. The core idea: "Every failure becomes a skill. Every skill has tests. Every eval runs daily." This creates structural prevention of recurring errors.

## Key Points

- **Definition**: Turning ad-hoc fixes into durable, tested infrastructure
- **Trigger**: When an agent makes a mistake that shouldn't happen again
- **Process**: 10-step checklist from failure to permanent skill
- **Outcome**: Bugs become structurally impossible to repeat
- **Philosophy**: Agent's judgment improves permanently, not just for current session
- **Verb usage**: "Skillify it" - one command to make a prototype permanent
- **Contrast with typical AI**: Normal AI apologizes, promises to do better, then repeats the error weeks later

## The 10-Step Checklist

1. **SKILL.md** — The contract (name, triggers, rules)
2. **Deterministic code** — scripts/*.mjs (no LLM for what code can do)
3. **Unit tests** — vitest for deterministic functions
4. **Integration tests** — Live endpoints and real data
5. **LLM evals** — Quality + correctness with LLM-as-judge
6. **Resolver trigger** — Entry in AGENTS.md routing table
7. **Resolver eval** — Verify the trigger actually routes correctly
8. **Check-resolvable + DRY audit** — Find unreachable skills and duplicates
9. **E2E smoke test** — Full pipeline verification
10. **Brain filing rules** — Knowledge base organization standards

## Examples from Garry's Practice

### Example 1: Calendar Recall
- **Failure**: Agent searched live APIs for 10-year-old trip instead of local knowledge base
- **Skill**: calendar-recall with rule: "Historical events go through local knowledge base first"
- **Script**: calendar-recall.mjs (sub-millisecond grep vs minutes of API calls)
- **Result**: Old failure path becomes structurally unreachable

### Example 2: Timezone Math
- **Failure**: Agent miscalculated UTC→PT conversion by 1 hour
- **Skill**: context-now with rule: "ALWAYS run context-now.mjs before time-sensitive claims"
- **Script**: context-now.mjs (50ms precise calculation vs mental math)
- **Result**: Deterministic tool constrains latent space

## Impact

- **Before**: Agent apologizes, error recurs weeks later
- **After**: Error becomes structurally impossible
- **Scale**: Garry has 179 unit tests across 5 suites, 35+ daily LLM evals
- **Adoption**: "Skillify it" became a verb in daily workflow

## Open Questions

- How to balance skill creation overhead vs error prevention value?
- When does skill proliferation become maintenance burden?
- Can skills become too rigid for novel situations?

---
## Evidence Timeline

- **2026-04-22**: Introduced in "How to really stop your agents from making the same mistakes" article with 10-step checklist and examples