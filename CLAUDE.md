# My Brain - Personal Knowledge Base

A personal knowledge base using the LLM Wiki pattern. Claude Code acts as the knowledge assistant, handling ingestion, querying, and maintenance.

## Structure

```
sources/       # Raw materials (immutable once added)
  articles/    # Web articles, blog posts, papers
  books/       # Book notes and highlights
  meetings/    # Meeting notes, conversations
wiki/          # Compiled knowledge (LLM-maintained)
  concepts/    # Ideas, frameworks, mental models
  people/      # People profiles and context
  projects/    # Project knowledge and decisions
  synthesis/   # Cross-cutting analysis and insights
index.md       # Content catalog with one-line summaries
log.md         # Append-only operation log
```

## Page Format

### Source Pages (`sources/**/*.md`)

```markdown
---
title: <title>
url: <original url if applicable>
date_added: <YYYY-MM-DD>
type: article | book | meeting | paper
tags: [tag1, tag2]
---

<original content or notes>
```

Sources are **immutable** after creation. Never edit source content.

### Wiki Pages (`wiki/**/*.md`)

```markdown
---
title: <topic>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: [tag1, tag2]
sources: [relative paths to source files]
related: [relative paths to related wiki pages]
---

## Summary

<Current best understanding - 2-3 sentences>

## Key Points

<Compiled knowledge - update as new sources arrive>

## Open Questions

<What's still unclear or contradictory>

---
## Evidence Timeline

- **YYYY-MM-DD**: <what was learned and from where>
```

The section above `---` is **compiled truth** (actively maintained).
The section below `---` is **evidence timeline** (append-only).

## Workflows

### Ingest (`ingest`)

When adding new knowledge:

1. Save raw material to appropriate `sources/` subdirectory
2. Extract key concepts, people, projects mentioned
3. For each entity:
   - If wiki page exists: update compiled truth + append to timeline
   - If new: create wiki page with initial content
4. Update cross-references (`related` field) in affected pages
5. Update `index.md` with new/changed pages
6. Append operation to `log.md`

### Query (`query`)

When answering questions:

1. Search wiki pages for relevant content (grep/read)
2. If wiki has good coverage: synthesize answer from wiki
3. If gaps found: note them as open questions on relevant pages
4. If the query produces valuable new synthesis: save to `wiki/synthesis/`

### Maintain (`maintain`)

Periodic maintenance (run when things feel stale):

1. Check for orphan pages (no incoming links)
2. Check for stale pages (not updated in 90+ days, still relevant?)
3. Check for contradictions across pages
4. Verify all source references still valid
5. **Entity coverage**: Check all source `author` fields and key entities mentioned in sources — ensure each has a corresponding wiki page
6. Check tag consistency (casing, singular/plural)
7. Update `index.md` to reflect current state:
   - Check for duplicate section headings (e.g., two `## Projects`) — merge or remove
   - Ensure every section heading has at least one entry; remove empty sections
   - Verify every file in wiki/ and sources/ has a corresponding entry in index.md
8. Log maintenance pass in `log.md`

## Conventions

- File names: `kebab-case.md` (e.g., `distributed-systems.md`)
- Tags: lowercase, hyphenated (e.g., `machine-learning`)
- Dates: ISO 8601 (`YYYY-MM-DD`)
- Links between pages: relative paths (e.g., `../concepts/llm-wiki.md`)
- Language: Content in whatever language the source uses; Chinese and English both fine
- One concept per wiki page - split if a page grows beyond ~500 lines
