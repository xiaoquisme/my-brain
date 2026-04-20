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
