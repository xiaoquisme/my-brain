---
title: "GBrain: Complete Build Specification"
url: https://gist.github.com/garrytan/49c88e83cf8d7ae95e087426368809cb
date_added: 2026-04-07
type: article
tags: [knowledge-management, sqlite, mcp, vector-search]
---

Garry Tan's (YC CEO) complete build spec for GBrain — an open-source personal knowledge management system using a single SQLite database.

## Architecture

- **Storage**: Single `brain.db` SQLite file with FTS5 + vector embeddings
- **Knowledge Model**: "Compiled truth + timeline" — current intelligence above the line, append-only evidence below
- **Intelligence Layer**: Fat markdown skill files guide AI agents
- **CLI**: `gbrain get/put/search/query/import/export/serve`
- **MCP Server**: 14 tools for Claude Code / Cursor integration

## 8 Core Tables

pages, page_fts, page_embeddings, links, tags, raw_data, timeline_entries, ingest_log

## "Compiled Truth" Pattern

Each page splits into:
1. **Above the line**: Current best understanding, actively updated
2. **Below the line**: Evidence timeline, append-only

Similar to intelligence analysis — conclusions separated from evidence.

## Tech Stack

- Bun + native SQLite
- FTS5 (Porter stemmer, unicode61 tokenizer)
- OpenAI text-embedding-3-small for vectors
- Official MCP SDK

## Migration

Designed to import Garry's existing 7,471-page wiki. Lossless, round-trippable. ~22,500 embedding API calls needed.

## Key Distinction from Karpathy's LLM Wiki

More engineering-focused: concrete schema, CLI, MCP integration, migration plan. Takes Karpathy's conceptual pattern and turns it into a buildable product spec.
