---
title: "LLM Wiki: A Pattern for Building Personal Knowledge Bases"
url: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
date_added: 2026-04-07
type: article
tags: [knowledge-management, llm, wiki, rag]
---

Andrej Karpathy proposes a pattern where LLMs incrementally build and maintain a persistent wiki (structured, interlinked markdown files) rather than relying on RAG.

## Three-Layer Architecture

1. **Raw Sources** - Immutable curated documents as source of truth
2. **The Wiki** - LLM-generated markdown (summaries, entities, concepts, syntheses)
3. **The Schema** - Config document (like CLAUDE.md) defining structure and workflows

## Core Operations

- **Ingest**: Process new sources → update wiki pages → maintain cross-references
- **Query**: Search wiki → synthesize answers → file findings back into wiki
- **Lint**: Audit for contradictions, stale claims, orphan pages, missing connections

## Support Files

- **index.md**: Content catalog organized by category
- **log.md**: Append-only chronological record

## Key Insight

> "The tedious part of maintaining a knowledge base is not the reading...it's the bookkeeping."

LLMs excel at the bookkeeping: updating cross-references, maintaining consistency, touching multiple files simultaneously.

## Community Concerns

- Error accumulation through successive updates
- Context loss from summarization
- Reduced cognitive engagement (passive consumption vs active synthesis)
- Operational complexity overhead
