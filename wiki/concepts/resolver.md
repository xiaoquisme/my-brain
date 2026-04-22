---
title: Resolver
created: 2026-04-22
updated: 2026-04-22
tags: [ai-agents, routing, skills]
sources:
  - ../../sources/articles/2046876981711769720.md
related:
  - skillify.md
  - thin-harness-fat-skills.md
  - ../people/garry-tan.md
  - ../projects/gbrain.md
---

## Summary

A routing table for AI agent skills: when task type X appears, load skill Y. Resolvers map user intents to specific skills, ensuring the right tool is used for each task.

## Key Points

- **Purpose**: Route tasks to appropriate skills based on intent
- **Implementation**: Rows in a markdown table in AGENTS.md
- **Trigger**: Phrases or patterns that should activate a specific skill
- **Evaluation**: Must test that triggers actually route correctly (resolver eval)
- **Failure Modes**:
  - **False negative**: Skill should fire but doesn't (trigger missing/vague)
  - **False positive**: Wrong skill fires (overlapping triggers)

## Resolver Table Example

| Intent Pattern | Skill |
|----------------|-------|
| "check my signatures" | executive-assistant |
| "who is [person]" | brain-ops |
| "save this article" | idea-ingest |
| "what time is my meeting" | context-now |
| "find my [year] trip" | calendar-recall |

## Resolver Evaluation

Garry's resolver eval suite has 50+ test cases checking:
1. **Structural tests**: Does AGENTS.md table contain right mapping?
2. **LLM routing tests**: Given intent, does model pick right skill?

## Common Issues

1. **Orphan skills**: Skills exist but have no resolver entry (15% of Garry's skills were unreachable)
2. **Ambiguous routing**: Multiple skills match same phrase (e.g., "what's on my calendar tomorrow" could match calendar-check, calendar-recall, or google-calendar)
3. **Weak triggers**: Autonomously-created skills with triggers that never match

## Maintenance

- **check-resolvable**: Meta-test that walks AGENTS.md → SKILL.md → script/cron chain
- **DRY audit**: Ensures no overlapping skill responsibilities
- **Weekly runs**: Part of gbrain doctor health checks

## Open Questions

- How to automatically generate resolver entries for new skills?
- When should skills have overlapping triggers vs being merged?
- How to handle skills that work across multiple domains?

---
## Evidence Timeline

- **2026-04-22**: Introduced in "How to really stop your agents from making the same mistakes" as step 6-7 of skillify checklist