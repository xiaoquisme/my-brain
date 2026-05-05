## 2026-05-05 — Maintenance (follow-up)

**Action**: maintain (continued)

**Fixes applied**:
- **Cross-links: +31 wikilinks** across 25 remaining pages (all pages now have ≥2 outbound links)
- **Confidence field: added `confidence: medium`** to all 52 single-source pages
- **Source drift: fixed 4 remaining hashes** (snarktank ralph x3, swe-atlas) + 1 placeholder (aparna)
- **Broken source refs: 0** (14 fixed in previous pass)

**Final state**:
- Broken wikilinks: 0 ✅
- Broken source refs: 0 ✅
- Orphan pages: 0 ✅
- Pages with <2 links: 0 ✅
- Single-source no confidence: 0 ✅
- Source drift: 0 ✅
- Tags not in taxonomy: 0 ✅
- Unused taxonomy tags: 7 (comparison, controversy, fine-tuning, lab, prediction, timeline, training — kept for future use)
---

## 2026-05-05 — Maintenance

**Action**: maintain

**Scope**: Full wiki maintenance pass (68 pages, 39 sources)

**Fixes applied**:
- **Broken source refs: 14 → 0** — Fixed incorrect relative paths across 14 pages:
  - 6 pages in wiki/concepts/ used `../sources/` instead of `../../sources/`
  - 2 people pages with wrong `raw/` or `../` prefixes
  - 1 filename typo (karpathy-llms-wiki.md → karpathy-llm-wiki.md)
  - 5 more with missing `../../` prefix
- **Cross-links: added 74 wikilinks** across 34 pages (37 pages with <2 links → 25 remaining)
- **Source drift: 1 fixed** (kv-cache-hidden-engine-jayanth.md sha256 corrected)

**Remaining items** (non-critical):
- 25 pages with <2 outbound links (niche topics, low overlap with other pages)
- 52 single-source pages without `confidence` field (informational, no action needed now)
- 5 pre-existing source drift issues (placeholder hashes from early ingests)
- 1 large page: harness-engineering.md (281 lines) — content-dense, acceptable
- 7 unused taxonomy tags (comparison, controversy, fine-tuning, lab, prediction, timeline, training)
---

## 2026-05-05 — Lint

**Action**: lint

**Results** (68 pages, 445 log lines):
- Broken wikilinks: 0 ✅
- Malformed frontmatter: 0 ✅
- Orphan pages: 0 ✅
- Missing fields: 0 ✅
- Index completeness: 0 missing, 0 stale ✅
- Tags in taxonomy: 0 missing ✅
- Large pages (>200 lines): 1 (harness-engineering.md: 281 lines)
- Source drift: 5 pre-existing (snarktank ralph x3, aparna, swe-atlas) + 1 fixed (kv-cache-hidden-engine-jayanth.md)
- Contested/low-confidence: 0 ✅

**Fixes applied**: Corrected sha256 for kv-cache-hidden-engine-jayanth.md
**Remaining**: 5 pre-existing source drift (placeholder hashes from earlier ingests), 1 large page (acceptable)
---

## 2026-05-05 — Ingest: Jayanth Sanku - KV Cache Hidden Engine
**Action**: ingest
**Scope**: sources/articles/ + wiki/concepts/ (update)
**Source**: Twitter Notes (x.com/JayanthSanku01/status/2050963464915743150)
**Changes**:
- Saved source: sources/articles/kv-cache-hidden-engine-jayanth.md
- Updated wiki/concepts/kv-cache-and-prompt-caching.md: added Trade-offs, Optimizations, Real-World Use Cases sections
- Key additions: Paged KV Cache, Quantized KV Cache, Eviction Strategies, Flash Attention
---

## 2026-04-23 — Ingest: He et al. - Harness Engineering (CAR & HarnessCard)

**Action**: ingest

**Scope**: sources/articles/ + wiki/concepts/ + wiki/people/

**Source**: Preprints.org paper doi:10.20944/preprints202603.1756.v2

**Changes**:
- Saved source paper: sources/articles/harness-engineering-car-harnesscard.md
- Created/updated wiki pages:
  - wiki/concepts/car-framework.md (新概念 - Control, Agency, Runtime 分解)
  - wiki/concepts/harnesscard.md (新概念 - 轻量级报告规范)
  - wiki/concepts/harness-engineering.md (更新 - 添加 CAR、HarnessCard、Visibility Gap)
  - wiki/people/chaoyue-he.md (新人物)
- Updated index.md with new entries

**Key Concepts Extracted**:
- CAR Framework: H = ⟨C, A, R⟩ — Control, Agency, Runtime 形式化分解 harness 层
- HarnessCard: 9 required + 2 recommended fields for reporting agent configurations
- Visibility Gap: 63 篇工作审计，学术论文与工程笔记之间的可见性鸿沟
- Key argument: 很多 "agent gains" 是 harness-sensitive 而非纯模型驱动
- Engineering evolution: Software → Prompt → Context → Harness Engineering

---

## 2026-04-23 — Ingest: Garry Tan - Thin Harness, Fat Skills

**Action**: ingest

**Scope**: sources/articles/thin-harness-fat-skills.md + wiki/

**Source**: https://github.com/garrytan/gbrain/blob/master/docs/ethos/THIN_HARNESS_FAT_SKILLS.md

**Changes**:
- Saved source article with frontmatter
- Created/updated wiki pages:
  - wiki/concepts/thin-harness-fat-skills.md (核心架构原则)
  - wiki/concepts/skill-file.md (新概念)
  - wiki/concepts/harness.md (新概念)
  - wiki/concepts/resolver.md (更新)
  - wiki/concepts/latent-vs-deterministic.md (新概念)
  - wiki/concepts/diarization.md (新概念)
  - wiki/people/garry-tan.md (更新)
  - wiki/projects/gbrain.md (更新)
- Updated index.md with new entries

**Key Concepts Extracted**:
- 五定义：Skill File, Harness, Resolver, Latent vs Deterministic, Diarization
- 三层架构：Fat Skills → Thin Harness → Your App
- Skill 如方法调用：相同流程，不同参数
- Resolver 路由上下文
- 自学习循环：retrieve → diarize → rewrite skill

---
## 2026-04-23 — Source Redownload & Full Reformat

**Action**: redownload + reformat

**Scope**: sources/articles/2046876981711769720.md

**Changes**:
- Redownloaded from https://x.com/garrytan/status/2046876981711769720
- Full Markdown reformat: proper headings, lists, code blocks, blockquotes
- Removed all Twitter UI elements and engagement metrics
- Added structured sections matching article's logical flow
- Clean References section at end

---
## 2026-04-23 — Source Cleanup

**Action**: format_fix

**Scope**: sources/articles/2046876981711769720.md

**Changes**:
- Removed Twitter engagement metrics (likes, retweets, replies, views)
- Removed Twitter UI elements ("Want to publish your own Article?", timestamp, etc.)
- Consolidated author line to single format: "Garry Tan (@garrytan)"
- Added References section for project links
- Restored accidentally deleted paragraphs during cleanup

---
## 2026-04-20 — Maintenance Pass #2

**Action**: maintain

**Scope**: 40 wiki pages + 62 source files

**Findings & Fixes**:

1. **Orphan fixed (1)**:
- `wiki/people/gleb-rodionov.md` → `reasoning-shift.md` 添加入链

2. **Tag 统一 (5 files)**:
- `llm` -> `llms`（复数规范）: chaofa-yuan, llm-wiki-pattern, kv-cache-and-prompt-caching, reasoning-shift, claude-opus-4-7

3. **Updated 日期同步**: 5个修改页更新为 2026-04-20

**Stats**:
- Orphans: 0（after fix）
- Tag issues: 0（after fix）
- Stale pages: 0
- Broken source refs: 0
- Large pages (>500 lines): 0
- Index: complete (40/40)

---

## 2026-04-20 — Ingest: Aparna Dhinakaran

**Action**: ingest

**Source**: [Sandboxes Are the Servers of the Harness Era](https://x.com/aparnadhinak/status/2045925288908046570)

**Changes**:

1. **Created source**: `sources/articles/2045925288908046570.md`
2. **Updated wiki**: `wiki/concepts/harness-engineering.md` — added "Sandbox: The Server of the Harness Era" section
3. **Created wiki**: `wiki/people/aparna-dhinakaran.md` — new person page
4. **Created wiki**: `wiki/concepts/sandbox.md` — new concept page
5. **Updated index**: Added new source, person, and concept entries
- Broken source refs: 0
- Large pages (>500 lines): 0
- Index: complete (40/40)

---

## 2026-04-20 — Maintenance Pass

**Action**: maintain

**Scope**: Full audit of 38 wiki pages + 62 source files

**Findings & Fixes**:

1. **Orphans fixed (4)**:
- `wiki/projects/ddia.md` → 添加入链：`claude-code-architecture.md` related 到它
- `wiki/concepts/agile.md` → 添加入链：`claude-code-workflow.md` related 到它
- `wiki/concepts/kanban.md` / `wiki/concepts/scrum.md` → 已通过 agile.md 间接连通（agile related 到它们，现在 agile 有入链）

2. **Missing people pages created (2)**:
- `wiki/people/martin-kleppmann.md` — DDIA 作者
- `wiki/people/gleb-rodionov.md` — Reasoning Shift 论文作者

3. **index.md 更新**: 新增 martin-kleppmann、gleb-rodionov 两个 people 条目

**Stats**:
- Pages audited: 38 wiki + 62 sources
- Orphans fixed: 4
- New people pages: 2
- Stale pages: 0
- Tag issues: 0
- Broken source refs: 0
- Index: complete (40/40 pages listed)

---

## 2026-04-20 — Ingest: DDIA 第二版

**Action**: ingest

**Source**: https://ddia.vonng.com (设计数据密集型应用第二版，中文译本，Martin Kleppmann 著，冯若航译)

**Files created**:
- sources/books/ddia-preface.md (序言)
- sources/books/ddia-ch01.md 到 ddia-ch14.md (14章)
- wiki/projects/ddia.md (综合知识页)

**Script**: scripts/fetch_ddia.py (curl + BeautifulSoup，静态 HTML 直接解析)

**Stats**:
- 15 个源文件，577,730 字符
- 1 个 wiki 综合页（14章精华 + 概念索引表）
- index.md: Books + Projects 各添加1条
- 无新增 people 页（作者 Martin Kleppmann 未在库中）

---

## 2026-04-17 — Maintenance Pass

**Action**: maintain

**Scope**: Full audit of 33 wiki pages

**Findings & Fixes**:

1. **Broken link fixed**: `wiki/people/thariq-shihipar.md` had `../concepts/claude-code-workflow.md` (wrong path). Fixed to `../projects/claude-code-workflow.md`. Also added `../concepts/claude-code-session-management.md` cross-ref.

2. **Cross-references added** (low-connectivity pages):
- `claude-opus-4-7.md` ↔ `openai-codex-2026.md` (mutual competitor reference)
- `claude-code-architecture.md` → `claude-code-session-management.md` (natural extension)
- `harness-engineering.md` → `synthesis/agentic-rag-as-harness.md` (synthesis page now reachable)

3. **Updated `updated:` dates** on 5 modified pages.

**Stats**:
- Pages audited: 33 wiki + 40 sources
- Orphans: 0 (after fixes)
- Stale pages: 0
- Tag issues: 0
- Broken source refs: 0
- Index: complete (33/33 pages listed)

# Log

Append-only record of operations.

---

- **2026-04-07** | init | Created knowledge base structure and schema
- **2026-04-07** | ingest | Added Karpathy LLM Wiki article → created source, wiki/concepts/llm-wiki-pattern, wiki/people/andrej-karpathy
- **2026-04-07** | ingest | Added Garry Tan GBrain article → created source, updated llm-wiki-pattern, created wiki/people/garry-tan
- **2026-04-07** | ingest | Added Böckeler's Harness Engineering article → created source, wiki/concepts/harness-engineering, wiki/concepts/coding-agents, wiki/people/martin-fowler, wiki/people/birgitta-bockeler; updated llm-wiki-pattern cross-refs
- **2026-04-07** | query+create | "What is Ashby's Law" → created wiki/concepts/ashbys-law, updated harness-engineering cross-refs
- **2026-04-07** | ingest | Added OpenAI's Harness Engineering article → created source, updated wiki/concepts/harness-engineering with Codex case study, updated wiki/concepts/coding-agents
- **2026-04-07** | ingest | Added Anthropic's Harness Design article → created source, updated harness-engineering with GAN-inspired multi-agent pattern, updated coding-agents with context anxiety and harness simplification insights
- **2026-04-07** | maintain | Audit pass: fixed 1 broken ref (removed non-existent personal-knowledge-management.md), fixed 1 orphan (linked birgitta-bockeler from harness-engineering), added missing cross-refs (people ↔ concepts)
- **2026-04-07** | ingest | Added Justin Young's Effective Harnesses article → updated harness-engineering with session continuity pattern, updated coding-agents with failure modes and file-based handoff
- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (ai → ai-agents in karpathy), added missing cross-refs (martin-fowler → harness-engineering, ashbys-law)
- **2026-04-07** | maintain | Found gap: maintain workflow missed Justin Young (no entity coverage check). Created wiki/people/justin-young. Updated CLAUDE.md maintain workflow to include entity coverage check
- **2026-04-07** | ingest | Added claude-howto guide → created source, created wiki/projects/claude-code-workflow (first project page!), mapped Claude Code features to harness engineering concepts
- **2026-04-07** | maintain | Audit pass: fixed 2 orphans (linked claude-code-workflow and justin-young from concept pages), created 2 missing author pages (prithvi-rajasekaran, luongnv89), added missing cross-ref (coding-agents → ashbys-law)
- **2026-04-07** | ingest | Added Meta-Harness paper (arXiv:2603.28052) → created source, wiki/concepts/meta-harness, wiki/people/chelsea-finn, wiki/people/omar-khattab; updated harness-engineering and coding-agents with Meta-Harness cross-refs
- **2026-04-07** | ingest | Added Jagtap's Meta-Harness library article → created source, wiki/people/shashikant-jagtap; updated meta-harness with open-source implementation section, updated harness-engineering and coding-agents timelines
- **2026-04-07** | maintain | Audit pass: added shashikant-jagtap to harness-engineering related, added missing source refs to coding-agents (meta-harness-optimization, meta-harness-library-jagtap), linked luongnv89 from claude-code-workflow (was orphan)
- **2026-04-07** | ingest | Added Anthropic's "Building Effective Agents" (Schluntz & Zhang) → created source, wiki/concepts/agentic-patterns (6 composable patterns), wiki/people/erik-schluntz, wiki/people/barry-zhang; updated coding-agents and harness-engineering cross-refs
- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (architecture → architecture-pattern in agentic-patterns). No orphans, no broken refs, all entity coverage OK. 19 wiki pages, 10 sources.
- **2026-04-07** | ingest | Added rosa's "从Bash工具开始理解Agent" → created source, wiki/concepts/tool-use-as-meta-ability, wiki/people/rosa; updated coding-agents and agentic-patterns cross-refs
- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (tools → tool-use in coding-agents, claude-code-workflow), added missing cross-ref (tool-use-as-meta-ability → rosa). No orphans, no broken refs, entity coverage OK. 21 wiki pages, 11 sources.
- **2026-04-07** | ingest | Added Chaofa Yuan's harness engineering article → created source, wiki/people/chaofa-yuan; updated harness-engineering with engineering hierarchy, transient/persistent distinction, co-evolution, LangChain case study; updated coding-agents timeline
- **2026-04-07** | ingest | Added Chaofa Yuan's KV Cache & Prompt Caching article → created source, wiki/concepts/kv-cache-and-prompt-caching (new topic: LLM inference optimization); updated wiki/people/chaofa-yuan with second article
- **2026-04-07** | ingest | Added rosa's "基于Openclaw的官方文档理解其架构设计" → created source, updated wiki/people/rosa (added second article), added openclaw as emerging concept (gateway, agentic-loop, skills, mcp, memory, heartbeat)
- **2026-04-07** | ingest | Added Chaofa Yuan's "Agent 系统中的 Prompt Caching 设计（上）" → created source, updated wiki/people/chaofa-yuan (third article), updated kv-cache-and-prompt-caching with Claude Code 4-layer architecture and tool management patterns
- **2026-04-07** | ingest | Added Chaofa Yuan's "Agent 系统中的 Prompt Caching 设计（下）" → created source, updated wiki/people/chaofa-yuan (fourth article), updated kv-cache-and-prompt-caching with context rot, compaction, sub-agent patterns
- **2026-04-07** | maintain | Audit pass: fixed 8 orphans (linked all people to concept pages), added kv-cache-and-prompt-caching to rosa and chaofa-yuan related, added luongnv89 to coding-agents, fixed tag inconsistency (trailing spaces), updated claude-code-workflow related
- **2026-04-07** | ingest | Added "爱马仕：一家做了 189 年 Harness 的公司" → created source, created wiki/people/jinse-chuanshuo-dacongrming, updated harness-engineering with new metaphor

- **2026-04-08**: Maintenance pass
- Orphan pages: ✅ None found
- Stale pages (90+ days): ✅ None found
- Broken refs: ✅ None found
- Tag consistency: ✅ All lowercase/hyphenated
- Entity coverage: ✅ All source authors have wiki pages (including new entries)
- Index sync: ✅ Fixed missing entry (金色传说大聪明)
- **2026-04-08** | maintain | Audit pass: added hermes-harness-metaphor.md to harness-engineering sources (was missing), updated rosa.md with OpenClaw article content in Key Points and Timeline, added rosa-openclaw-architecture.md to coding-agents sources with timeline entry. 17 sources, 8 concepts, 15 people, 1 project. No orphans, no broken refs.
- **2026-04-08** | ingest | Added Chaofa Yuan's "RAG 进化之路" → created source, created wiki/concepts/agentic-rag (new concept: RAG evolution); updated chaofa-yuan (5th article), added cross-refs to agentic-patterns and coding-agents. 18 sources, 9 concepts.
- **2026-04-08** | maintain | Audit pass: no orphans, no broken refs, no stale pages, entity coverage complete. Fixed 4 tag inconsistencies: `agent` → `ai-agents` (3 files), `prompt-cache` → `prompt-caching` (2 files), `tools` → `tool-use` (1 file). 18 sources, 9 concepts, 15 people, 1 project.
- **2026-04-08** | query+create | "将 Agentic RAG 做成 harness" → created wiki/synthesis/agentic-rag-as-harness (first synthesis page!). Cross-cutting analysis: harness 化的 RAG 检索轨迹可桥接工具驱动与 RL 驱动两条路径.


- **2026-04-08**: Ingested Agency Agents (msitarzewski/agency-agents)
- Created source: sources/articles/agency-agents.md
- Created wiki: wiki/people/msitarzewski.md
- Updated index.md with both entries

- **2026-04-10** | maintain | Audit pass results:
- Orphan pages: Fixed 3 orphans — linked msitarzewski from coding-agents, agentic-rag-as-harness from agentic-rag, crypto-morningstar-integration from claude-code-workflow (mutual link)
- Stale pages: ✅ None (all pages <90 days old)
- Contradictions: ✅ None found
- Tag consistency: Fixed 2 files using `ai-agent` (singular) → `ai-agents` (plural, standard). All tags now lowercase/hyphenated.
- Entity coverage: ✅ All source authors have wiki pages (false positives from multi-author and parenthetical fields in parser)
- Index sync: ✅ All 30 wiki pages appear in index.md
- Updated `updated:` dates on 6 modified pages.

- **2026-04-10** | ingest | Added "Claude Code from Source" full book (18 chapters) by Alejandro Balderas. Source: https://claude-code-from-source.com/. Created 18 source files (sources/books/claude-code-from-source-ch01..ch18.md), wiki/projects/claude-code-architecture.md (main book page), wiki/people/alejandro-balderas.md. Updated 4 concept pages (coding-agents, agentic-patterns, kv-cache-and-prompt-caching, tool-use-as-meta-ability) with cross-refs and timeline entries. Updated index.md with Books section, new project, and new person. Total: 37 sources (18 book chapters + 19 articles), 9 concepts, 17 people, 3 projects, 1 synthesis.


- **2026-04-17** | ingest | Added Anthropic "Introducing Claude Opus 4.7" article
- Created source: sources/articles/claude-opus-4-7.md
- Created wiki: wiki/concepts/claude-opus-4-7.md (new concept)
- Updated index.md with new concept entry
- Related to: coding-agents, agentic-patterns
- Key findings: 13% improvement on coding benchmark, xhigh effort level, higher resolution vision (2,576px), updated tokenizer (1.0-1.35x more tokens)

- **2026-04-17** | ingest | Added OpenAI "Codex for (almost) everything" article (via Wayback)
- Created source: sources/articles/codex-update-2026.md
- Created wiki: wiki/concepts/openai-codex-2026.md (new concept)
- Updated index.md with new concept entry
- Related to: coding-agents, agentic-patterns
- Key findings: Background computer use, multi-agent parallel work, memory preview, 90+ new plugins, in-app browser

- **2026-04-17** | ingest | Added Anthropic "Using Claude Code: session management and 1M context" article
- Created source: sources/articles/claude-code-session-management.md
- Created wiki: wiki/concepts/claude-code-session-management.md (new concept)
- Created wiki: wiki/people/thariq-shihipar.md (new person)
- Updated index.md with new concept and person
- Related to: coding-agents, harness-engineering, claude-code-workflow, justin-young, thariq-shihipar
- Key findings: Context rot, 1M token, 5 tools (continue/rewind/clear/compact/subagent), decision table

- **2026-04-17** | ingest | Added Microsoft Learn "什么是敏捷？" article
- Created source: sources/articles/what-is-agile.md
- Created wiki: wiki/concepts/agile.md (new concept)
- Updated index.md with new source and concept
- Related to: devops, software-development, methodology
- Key findings: 敏捷宣言四个价值观、敏捷框架(Scrum/看板) vs 敏捷实践(规划扑克/持续集成)、常见误解澄清

- **2026-04-17** | ingest | Added Microsoft Learn 敏捷系列文章 (5篇)
- Sources created:
- sources/articles/what-is-agile-development.md
- sources/articles/what-is-scrum.md
- sources/articles/what-is-kanban.md
- sources/articles/adopting-agile.md
- sources/articles/building-productive-teams.md
- Wiki concepts created:
- wiki/concepts/scrum.md
- wiki/concepts/kanban.md
- Updated wiki/concepts/agile.md with new content from all 5 articles
- Updated index.md with all new sources and concepts
- Key findings: 敏捷开发三要素、Scrum 框架、看板四原则、敏捷文化、双机组系统 (F-Crew/C-Crew)

- **2026-04-17** | maintain | Audit pass:
- **Broken source paths fixed**: agile.md, scrum.md, kanban.md had `../sources/` (resolves to wiki/sources/) — fixed to `../../sources/` (correct root-relative path)
- **Index sync**: Added 3 missing source entries (claude-opus-4-7.md, codex-update-2026.md, claude-code-session-management.md) to Sources section
- **Cross-refs added**: coding-agents → claude-opus-4-7, openai-codex-2026, claude-code-session-management; harness-engineering → claude-code-session-management; justin-young → claude-code-session-management
- Orphans: 0 (agile/scrum/kanban form a self-contained cluster)
- Stale pages: 0 (all <90 days)
- Tag consistency: ✅
- Entity coverage: ✅ (Microsoft Learn articles have corporate authorship, no individual author pages needed)
- Stats: 36 wiki pages, 47 sources. Updated `updated:` dates on 4 modified pages.

- **2026-04-20** | ingest | Added arXiv paper "Reasoning Shift: How Context Silently Shortens LLM Reasoning" (Rodionov, 2026)
- Source created: sources/articles/reasoning-shift-rodionov.md
- Wiki concept created: wiki/concepts/reasoning-shift.md
- Updated related pages: wiki/concepts/claude-code-session-management.md, wiki/concepts/harness-engineering.md
- Updated index.md with new source and concept entries
- Key findings: 推理型 LLM 在非隔离上下文条件下推理链最多压缩 50%，自我验证行为（double-checking）显著减少。对简单问题影响小，对复杂任务性能下降。与 context rot、harness engineering 子代理策略高度相关。


- **2026-04-22** | ingest | Added Garry Tan's "How to really stop your agents from making the same mistakes" article
- Created source: sources/articles/2046876981711769720.md
- Created wiki concepts: wiki/concepts/skillify.md, wiki/concepts/thin-harness-fat-skills.md, wiki/concepts/resolver.md
- Created wiki project: wiki/projects/gbrain.md
- Updated wiki people: wiki/people/garry-tan.md
- Updated index.md with new source, concepts, and project entries
- Related to: ai-agents, reliability, testing, skills, langchain, gbrain, harness-engineering
- Key findings: Skillify practice (10-step checklist), thin harness/fat skills architecture, resolver routing, critique of LangChain for tools without workflow


- **2026-04-22** | maintain | Audit pass:
  - **孤儿子检查**: 2个误报页面 (kanban.md, scrum.md 被 agile.md 引用，不是真正的孤儿)
  - **标签一致性**: ✅ 良好
  - **实体覆盖**: ✅ 所有个人作者都有 people 页面
  - **索引同步**: ✅ 所有页面都在 index.md 中
  - **断裂引用**: ✅ 没有断裂引用
  - **统计**: 46 wiki 页面, 64 sources. 无实际问题需要修复。

## [2026-05-02] ingest | snarktank/ralph
- 来源: https://github.com/snarktank/ralph
- 保存原始内容:
  - raw/articles/snarktank-ralph-github-2026.md
  - raw/articles/snarktank-ralph-ralph-sh-2026.md
  - raw/articles/snarktank-ralph-prompt-md-2026.md
- 创建页面:
  - entities/ralph.md — 自主 AI 编码 Agent 循环，bash 脚本驱动，PRD 定义任务
  - concepts/agent-loop-pattern.md — Agent 循环迭代模式综述，对比长 context 策略
- 更新:
  - index.md (+2 pages)
  - concepts/agent-context-management.md (添加 [[ralph]] 交叉引用)

## [2026-05-02] ingest | snarktank/ralph (correction)
- 修正: entities/ralph.md → wiki/people/ralph.md (匹配现有 index 结构)
- 创建附加页面:
  - wiki/people/ryan-carson.md — Ralph 作者
  - wiki/people/geoffrey-huntley.md — Ralph 模式原始提出者


## [2026-05-02] merge | 本地 wiki 与 my-brain GitHub 仓库合并
- 来源: https://github.com/xiaoquisme/my-brain
- 策略: 用 my-brain 仓库替换 ~/wiki，将本地独有页面合并入
- 本地新增页面 (11):
  - people/arize-alyx.md — Arize AI & Alyx Agent
  - people/scale-ai.md — Scale AI
  - concepts/agent-context-management.md — Agent context 管理收敛模式
  - concepts/ai-coding-benchmark.md — AI 编程基准综述
  - concepts/codebase-qna.md — 代码库问答评测形式
  - projects/claude-code-harness.md — Claude Code harness
  - projects/harbor.md — Harbor 任务运行框架
  - projects/letta-code.md — Letta Code harness
  - projects/openclaw.md — OpenClaw harness
  - projects/pi-mono.md — Pi harness
  - projects/swe-atlas.md — SWE-Atlas 评测基准
- 新增来源文件 (2):
  - sources/articles/aparna-context-management-agent-harnesses-2026.md
  - sources/articles/swe-atlas-github-2026.md
- 更新: SCHEMA.md (新建), index.md (68 pages)
- 备份: ~/wiki-backup-20260502
## [2026-05-02] ingest | snarktank/ralph
- 来源: https://github.com/snarktank/ralph
- 保存原始内容:
  - sources/articles/snarktank-ralph-github-2026.md (README)
  - sources/articles/snarktank-ralph-ralph-sh-2026.md (核心 bash 循环脚本)
  - sources/articles/snarktank-ralph-prompt-md-2026.md (Amp agent 指令模板)
- 创建页面:
  - wiki/people/ralph.md — 自主 AI 编码 Agent 循环，113 行 bash 脚本驱动，PRD 定义任务，支持 Amp + Claude Code
  - wiki/people/ryan-carson.md — Ralph 作者，snarktank 仓库维护者
  - wiki/people/geoffrey-huntley.md — Ralph 模式原始提出者，文件系统做 Agent 记忆的理念
  - wiki/concepts/agent-loop-pattern.md — Agent 循环迭代模式综述：每轮新实例 + 文件系统记忆 + PRD 驱动，对比长 context 策略
- 更新:
  - index.md (+4 wiki pages, +3 source entries, page count 68)
  - concepts/agent-context-management.md (添加 [[ralph]] 交叉引用)

## [2026-05-02] restructure | index.md & SCHEMA.md 重建
- 问题: index.md 仅有 11 条旧路径引用（entities/, concepts/），实际文件结构为 wiki/concepts/、wiki/people/、wiki/projects/、wiki/synthesis/
- 操作:
  - 重建 index.md: 68 个页面全部按实际路径列出（30 concepts, 27 people, 10 projects, 1 synthesis）
  - 更新 SCHEMA.md: 反映实际目录结构（sources/ + wiki/ 四个子目录），更新 tag taxonomy（从 20 个扩展到匹配实际使用的 99 个标签，按 6 大类分组）
- 统计: 68 wiki 页面, 63 source 文件（34 articles + 29 book chapters）

## [2026-05-02] lint | Wiki 全面维护

### 发现问题
- 断链: 0
- 孤儿页面: 56 (无入站链接)
- Index 完整性: 完美 (68/68)
- Frontmatter 问题: 61 页面缺少 type 字段, 4 文件 frontmatter 格式错误
- 页面超 200 行: 1 (harness-engineering.md: 275 行)
- Tag 分类外: 62 个 tag 不在 SCHEMA.md 分类中
- 未使用分类 tag: 7 个
- 来源漂移: 0
- 矛盾页面: 0
- 单来源无 confidence: 49 页面

### 修复操作
- 修复 4 个 malformed frontmatter (claude-code-harness, letta-code, openclaw, pi-mono): related 字段 YAML 格式错误 → 修正为标准列表
- 为 60 个页面添加 type 字段 (从目录推断: concept/entity/synthesis)
- SCHEMA.md tag 分类扩展: 从 ~30 个扩展到 105 个, 新增 11 个分类 (Agent 架构, 模型实例, 知识与认知, 系统理论, 数据等)
- methodology → software-development 统一重命名 (3 页面)
- 为 56 个孤儿页面添加 112 条交叉引用, 更新 51 个目标页面
- 所有 68 页面现在均有入站链接

### 待关注
- 1 页面超 200 行 (harness-engineering.md) — 候选拆分
- 49 页面单来源无 confidence 设置 — 建议后续补充或降低 confidence
- log.md 408 行, 接近 500 行轮转阈值
