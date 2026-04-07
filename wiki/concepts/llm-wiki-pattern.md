---
title: LLM Wiki Pattern
created: 2026-04-07
updated: 2026-04-07
tags: [knowledge-management, llm, architecture-pattern]
sources:
  - ../../sources/articles/karpathy-llm-wiki.md
  - ../../sources/articles/garry-tan-gbrain.md
related:
  - personal-knowledge-management.md
---

## Summary

A pattern where LLMs incrementally build and maintain a structured, interlinked knowledge base (wiki) instead of relying on RAG for every query. Knowledge is "compiled" once from raw sources, then kept current — the LLM handles the bookkeeping humans tend to abandon.

## Key Points

- **Three layers**: Raw Sources (immutable) → Wiki (LLM-maintained) → Schema (conventions)
- **Three operations**: Ingest (add knowledge), Query (retrieve + synthesize), Lint/Maintain (audit quality)
- **Compiled truth pattern**: Separate current conclusions from evidence timeline
- **LLM's sweet spot**: Cross-referencing, consistency, multi-file updates — tedious work humans skip
- **Schema as leverage**: A well-written config file (CLAUDE.md) can drive the entire system without code

## Implementations

- **Karpathy (2025)**: Conceptual pattern, pure Markdown + CLAUDE.md
- **Garry Tan / GBrain (2025)**: Full product spec — SQLite, FTS5, vectors, MCP server, CLI

## Open Questions

- How to prevent error accumulation over many update cycles?
- At what scale does Markdown + grep stop being sufficient?
- Does LLM-maintained knowledge reduce the human's own understanding?

---
## Evidence Timeline

- **2026-04-07**: Initial compilation from Karpathy's LLM Wiki gist and Garry Tan's GBrain spec
