# Wiki Schema

## Domain
软件工程工具与 AI 研究 — 涵盖 AI/ML 研究成果、软件工程自动化工具、代码生成、基准测试、开源项目情报，以及将 AI 应用于软件工程的交叉领域（如 AI 代码助手、自动化测试、程序合成等）。

## Conventions
- File names: `kebab-case.md` (e.g., `swe-bench.md`, `openai-codex.md`)
- Every wiki page starts with YAML frontmatter (see below)
- Use relative paths to link between pages (e.g., `../concepts/harness.md`), minimum 2 outbound links per page
- When updating a page, always bump the `updated` date
- Every new page must be added to `index.md` under the correct section
- Every action must be appended to `log.md`
- **Provenance markers:** On pages that synthesize 3+ sources, append `^[../../sources/articles/source-file.md]`
  at the end of paragraphs whose claims come from a specific source.
- Language: Content in whatever language the source uses; Chinese and English both fine
- One concept per wiki page — split if a page grows beyond ~500 lines

## Structure

```
sources/           # Raw materials (immutable once added)
  articles/        # Web articles, blog posts, papers
  books/           # Book notes and highlights
  meetings/        # Meeting notes, conversations
wiki/              # Compiled knowledge (LLM-maintained)
  concepts/        # Ideas, frameworks, mental models
  people/          # People, companies, organizations
  projects/        # Project knowledge and decisions
  synthesis/       # Cross-cutting analysis and insights
index.md           # Content catalog with one-line summaries
log.md             # Append-only operation log
SCHEMA.md          # This file — conventions and structure rules
```

## Frontmatter

```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [from taxonomy below]
sources: [relative paths to source files]
related: [relative paths to related wiki pages]
confidence: high | medium | low        # optional: how well-supported the claims are
contested: true                        # optional: set when page has unresolved contradictions
contradictions: [other-page-slug]      # optional: pages this one conflicts with
---
```

### Source Frontmatter

Raw sources also get a small frontmatter block so re-ingests can detect drift:

```yaml
---
title: <title>
url: <original url if applicable>
date_added: YYYY-MM-DD
type: article | book | meeting | paper
tags: [tag1, tag2]
sha256: <hex digest of the raw content below the frontmatter>
---
```

## Page Format

```markdown
---
<frontmatter>
---

## Summary

<Current best understanding - 2-3 sentences>

## Key Points

<Compiled knowledge - update as new sources arrives>

## Open Questions

<What's still unclear or contradictory>

---
## Evidence Timeline

- **YYYY-MM-DD**: <what was learned and from where>
```

The section above `---` is **compiled truth** (actively maintained).
The section below `---` is **evidence timeline** (append-only).

## Tag Taxonomy

### Models & Architecture
- `model` — 具体的 AI 模型（GPT-4、Claude、Llama 等）
- `architecture` — 模型架构（Transformer、MoE、SSM 等）
- `benchmark` — 评测基准（SWE-bench、HumanEval、MMLU 等）
- `training` — 训练方法、数据、流程

### Software Engineering
- `swe-tool` — 软件工程工具（IDE、linter、测试框架等）
- `code-gen` — 代码生成、程序合成
- `agent` / `ai-agents` / `coding-agents` — AI 编程 Agent、自主编程系统
- `testing` — 自动化测试、模糊测试、验证
- `devops` — CI/CD、基础设施、部署工具
- `harness-engineering` — Agent harness 设计与工程

### People & Organizations
- `person` — 研究者、工程师、创始人
- `company` — 公司、初创企业
- `lab` — 研究机构（OpenAI、DeepMind、CMU 等）
- `open-source` — 开源项目

### Research
- `paper` — 学术论文
- `dataset` — 数据集
- `alignment` — AI 对齐、安全
- `inference` — 推理、部署优化
- `fine-tuning` — 微调方法

### Meta
- `comparison` — 横向对比分析
- `timeline` — 时间线、历史
- `controversy` — 争议、未解决问题
- `prediction` — 预测、展望

Rule: every tag on a page must appear in this taxonomy. If a new tag is needed,
add it here first, then use it.

## Workflows

### Ingest
1. Save raw material to appropriate `sources/` subdirectory
2. Extract key concepts, people, projects mentioned
3. For each entity: create new wiki page or update existing one
4. Update cross-references (`related` field) in affected pages
5. Update `index.md` with new/changed pages
6. Append operation to `log.md`

### Query
1. Search wiki pages for relevant content
2. Synthesize answer from wiki knowledge
3. File valuable answers to `wiki/synthesis/`

### Maintain
1. Check for orphan pages (no incoming links)
2. Check for stale pages (not updated in 90+ days)
3. Check for contradictions across pages
4. Verify all source references still valid
5. Check tag consistency
6. Update `index.md` to reflect current state
7. Log maintenance pass in `log.md`

## Page Thresholds
- **Create a page** when an entity/concept appears in 2+ sources OR is central to one source
- **Add to existing page** when a source mentions something already covered
- **DON'T create a page** for passing mentions, minor details, or things outside the domain
- **Split a page** when it exceeds ~500 lines

## Update Policy
When new information conflicts with existing content:
1. Check the dates — newer sources generally supersede older ones
2. If genuinely contradictory, note both positions with dates and sources
3. Mark the contradiction in frontmatter: `contradictions: [page-name]`
4. Flag for user review
