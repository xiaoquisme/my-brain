---
title: Thin Harness, Fat Skills
created: 2026-04-22
updated: 2026-04-22
tags: [ai-agents, architecture-pattern, skills]
sources:
  - ../../sources/articles/2046876981711769720.md
related:
  - skillify.md
  - harness-engineering.md
  - ../people/garry-tan.md
  - ../projects/gbrain.md
---

## Summary

An architectural pattern for AI agents where the harness (core runtime) is minimal and skills (markdown procedures) contain the domain logic. The harness provides the connection to the browser/tools, while skills teach the model how to approach tasks.

## Key Points

- **Thin Harness**: Minimal core runtime, just enough to connect to tools (CDP for browser)
- **Fat Skills**: Domain logic lives in markdown skill files, not in code
- **Skill as Method Call**: Same procedure (skill), radically different outputs depending on input
- **Latent vs Deterministic**: 
  - **Latent space**: Judgment, reasoning, API calls (LLM)
  - **Deterministic space**: Precise, repeatable operations (scripts)
- **Key Insight**: The model's intelligence creates constraints that prevent the model from being stupid
- **Pattern**: Latent space builds deterministic tool → deterministic tool constrains latent space

## Core Distinction

Work that requires **judgment** (latent) vs work that requires **precision** (deterministic):

- **Latent**: "Find my Singapore trip" → requires reasoning about what "Singapore trip" means
- **Deterministic**: "Search calendar files for 'Singapore'" → same input, same output every time

## Implementation

1. **Skill (markdown)**: Teaches the model the process/approach
2. **Script (code)**: Implements the deterministic operations
3. **Harness**: Minimal runtime that connects skills to tools

## Example: Calendar Recall

- **Skill**: calendar-recall.md with rule: "Historical events go through local knowledge base first"
- **Script**: calendar-recall.mjs that greps local calendar files
- **Harness**: Provides file system access via CDP
- **Result**: Agent uses judgment to create script, then skill forces use of script

## Contrast with Frameworks

- **LangChain**: Provides testing tools but no workflow/opinion on what to test
- **Thin Harness/Fat Skills**: Provides both the minimal runtime AND the workflow for turning failures into skills

## Open Questions

- How thin is too thin? What belongs in harness vs skills?
- How to prevent skill sprawl (too many similar skills)?
- Can skills be composed/reused across different harnesses?

---
## Evidence Timeline

- **2026-04-22**: Introduced in "How to really stop your agents from making the same mistakes" as the framework underlying skillify practice