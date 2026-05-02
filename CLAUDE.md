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
scripts/       # Maintenance scripts
index.md       # Content catalog with one-line summaries
log.md         # Append-only operation log
```

## Page Format

### Source Pages (`sources/**/*.md`)

```markdown
---
title: <title>
source_url: <original url if applicable>
ingested: <YYYY-MM-DD>
type: article | book | meeting | paper
tags: [tag1, tag2]
sha256: <hex digest of body content>
---

<original content or notes>
```

Sources are **immutable** after creation. Never edit source content.
The `sha256` hash lets re-ingests detect drift from the original.

### Wiki Pages (`wiki/**/*.md`)

```markdown
---
title: <topic>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
type: concept | entity | comparison | query | summary
tags: [from SCHEMA.md taxonomy]
sources: [relative paths to source files]
confidence: high | medium | low
contested: true              # only if unresolved contradictions
contradictions: [page-slug]  # pages this one conflicts with
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

`confidence` and `contested` are optional but recommended for opinion-heavy
or fast-moving topics. Lint surfaces these for review.

## Linking Conventions

- **Body text**: Use `[[wikilinks]]` to link between pages (minimum 2 per page)
- **Frontmatter `related:`**: Use relative paths (e.g., `../concepts/scrum.md`)
- Both styles coexist — wikilinks for readability, relative paths for structured metadata

## Provenance Markers

On pages that synthesize 3+ sources, append `^[sources/articles/source-file.md]`
at the end of paragraphs whose claims come from a specific source. This lets
readers trace each claim back without re-reading the whole raw file.

## Tag Taxonomy

Tags must come from the taxonomy defined in `SCHEMA.md`. Common categories:

- **Models**: model, architecture, benchmark, training, inference, reasoning
- **SWE Tools**: swe-tool, code-gen, agent, coding-agents, testing, devops
- **People/Orgs**: person, company, lab, open-source
- **Meta**: comparison, timeline, synthesis, knowledge-management

Rule: every tag on a page must appear in SCHEMA.md taxonomy. Add new tags
there first, then use them. This prevents tag sprawl.

## Workflows

### Ingest (`ingest`)

When adding new knowledge:

1. Save raw material to appropriate `sources/` subdirectory (with frontmatter + sha256)
2. Extract key concepts, people, projects mentioned
3. For each entity:
   - If wiki page exists: update compiled truth + append to timeline
   - If new: create wiki page with initial content (only if meets page thresholds)
4. Update cross-references (`[[wikilinks]]` in body, `related` in frontmatter) in affected pages
5. Add provenance markers `^[sources/...]` on pages synthesizing 3+ sources
6. Update `index.md` with new/changed pages
7. Append operation to `log.md`

### Query (`query`)

When answering questions:

1. Search wiki pages for relevant content (grep/read)
2. If wiki has good coverage: synthesize answer from wiki
3. If gaps found: note them as open questions on relevant pages
4. If the query produces valuable new synthesis: save to `wiki/synthesis/`

### Maintain (`maintain`)

Periodic maintenance (run when things feel stale):

1. Check for orphan pages (no incoming links)
2. Check for broken wikilinks (`[[links]]` pointing to non-existent pages)
3. Check for stale pages (not updated in 90+ days, still relevant?)
4. Check for contradictions across pages — surface `contested: true` pages
5. Verify all source references still valid
6. **Entity coverage**: Check all source `author` fields and key entities mentioned in sources — ensure each has a corresponding wiki page
7. Check tag consistency — all tags must be in SCHEMA.md taxonomy
8. **Quality signals**: Review `confidence: low` pages and single-source pages without confidence field
9. Update `index.md` to reflect current state:
   - Check for duplicate section headings (e.g., two `## Projects`) — merge or remove
   - Ensure every section heading has at least one entry; remove empty sections
   - Verify every file in wiki/ and sources/ has a corresponding entry in index.md
10. Log maintenance pass in `log.md`

## Page Thresholds

- **Create a page**: entity/concept appears in 2+ sources, or is central to one source
- **Add to existing page**: source mentions something already covered
- **Don't create**: passing mentions, minor details, out-of-domain content
- **Split a page**: exceeds ~200 lines — break into sub-topics with cross-links
- **Archive a page**: content fully superseded — move to `_archive/`, remove from index

## Conventions

- File names: `kebab-case.md` (e.g., `distributed-systems.md`)
- Tags: lowercase, hyphenated, from SCHEMA.md taxonomy only
- Dates: ISO 8601 (`YYYY-MM-DD`)
- Links: `[[wikilinks]]` in body text, relative paths in frontmatter `related:`
- Language: Content in whatever language the source uses; Chinese and English both fine
- One concept per wiki page — split if a page grows beyond ~200 lines
- Every action must be appended to `log.md`
- Every new page must be added to `index.md` under the correct section
