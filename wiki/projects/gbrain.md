---
title: GBrain
created: 2026-04-22
updated: 2026-04-22
tags: [ai-agents, knowledge-management, open-source]
sources:
  - ../../sources/articles/2046876981711769720.md
  - ../../sources/articles/garry-tan-gbrain.md
related:
  - skillify.md
  - ../concepts/llm-wiki-pattern.md
  - ../people/garry-tan.md
---

## Summary

Open-source knowledge engine by Garry Tan that sits underneath AI agent harnesses. Manages brain repos, runs evals, and enforces quality gates for durable skills. Implements the skillify pattern with built-in testing and verification.

## Key Points

- **Purpose**: Knowledge management + skill verification for AI agents
- **Architecture**: SQLite + FTS5 + vectors + MCP, single-file
- **Integration**: Works with OpenClaw, Hermes Agent, or any harness
- **SkillPack**: Portable bundle of skills, triggers, scripts, and tests
- **Doctor Command**: `gbrain doctor --fix` auto-repairs DRY violations, replaces duplicated blocks
- **Quality Gates**: Enforces 10-step skillify checklist
- **Open Source**: github.com/garrytan/gbrain

## Core Components

1. **Brain Repo**: Personal knowledge base (wiki pattern)
2. **Eval Suite**: Daily tests for skill quality
3. **Resolver Management**: Skill routing and deconfliction
4. **Health Checks**: Weekly audits for orphan skills, stale pages, contradictions

## Skillify Integration

GBrain implements the full skillify workflow:
- Skill creation with 10-step checklist
- Automated testing (unit, integration, LLM evals)
- Resolver management and evaluation
- DRY audit and conflict detection
- Knowledge base filing rules

## GBrain SkillPack

Portable bundle that can be installed into any agent setup:
- Pre-built skills with tests
- Resolver triggers
- Deterministic scripts
- Quality gates

## Contrast with Hermes Agent

- **Hermes**: Great at skill creation (skill_manage tool)
- **GBrain**: Great at skill verification (testing, evals, audits)
- **Together**: Complete skill lifecycle (create → test → maintain)

## Open Questions

- How does GBrain handle skill versioning and rollback?
- What's the performance impact of daily eval suites?
- Can GBrain skills be shared across users/teams?

---
## Evidence Timeline

- **2026-04-07**: Initial GBrain build specification published
- **2026-04-22**: Skillify pattern and 10-step checklist introduced in agent reliability article