     1|     1|## 2026-04-23 — Source Redownload & Full Reformat

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
     2|     2|
     3|     3|**Action**: maintain
     4|     4|
     5|     5|**Scope**: 40 wiki pages + 62 source files
     6|     6|
     7|     7|**Findings & Fixes**:
     8|     8|
     9|     9|1. **Orphan fixed (1)**:
    10|    10|   - `wiki/people/gleb-rodionov.md` → `reasoning-shift.md` 添加入链
    11|    11|
    12|    12|2. **Tag 统一 (5 files)**:
    13|    13|   - `llm` -> `llms`（复数规范）: chaofa-yuan, llm-wiki-pattern, kv-cache-and-prompt-caching, reasoning-shift, claude-opus-4-7
    14|    14|
    15|    15|3. **Updated 日期同步**: 5个修改页更新为 2026-04-20
    16|    16|
    17|    17|**Stats**:
    18|    18|- Orphans: 0（after fix）
    19|    19|- Tag issues: 0（after fix）
    20|    20|- Stale pages: 0
    21|    21|- Broken source refs: 0
    22|    22|- Large pages (>500 lines): 0
    23|    23|- Index: complete (40/40)
    24|    24|
    25|    25|---
    26|    26|
    27|    27|## 2026-04-20 — Ingest: Aparna Dhinakaran
    28|    28|
    29|    29|**Action**: ingest
    30|    30|
    31|    31|**Source**: [Sandboxes Are the Servers of the Harness Era](https://x.com/aparnadhinak/status/2045925288908046570)
    32|    32|
    33|    33|**Changes**:
    34|    34|
    35|    35|1. **Created source**: `sources/articles/2045925288908046570.md`
    36|    36|2. **Updated wiki**: `wiki/concepts/harness-engineering.md` — added "Sandbox: The Server of the Harness Era" section
    37|    37|3. **Created wiki**: `wiki/people/aparna-dhinakaran.md` — new person page
    38|    38|4. **Created wiki**: `wiki/concepts/sandbox.md` — new concept page
    39|    39|5. **Updated index**: Added new source, person, and concept entries
    40|    40|- Broken source refs: 0
    41|    41|- Large pages (>500 lines): 0
    42|    42|- Index: complete (40/40)
    43|    43|
    44|    44|---
    45|    45|
    46|    46|## 2026-04-20 — Maintenance Pass
    47|    47|
    48|    48|**Action**: maintain
    49|    49|
    50|    50|**Scope**: Full audit of 38 wiki pages + 62 source files
    51|    51|
    52|    52|**Findings & Fixes**:
    53|    53|
    54|    54|1. **Orphans fixed (4)**:
    55|    55|   - `wiki/projects/ddia.md` → 添加入链：`claude-code-architecture.md` related 到它
    56|    56|   - `wiki/concepts/agile.md` → 添加入链：`claude-code-workflow.md` related 到它
    57|    57|   - `wiki/concepts/kanban.md` / `wiki/concepts/scrum.md` → 已通过 agile.md 间接连通（agile related 到它们，现在 agile 有入链）
    58|    58|
    59|    59|2. **Missing people pages created (2)**:
    60|    60|   - `wiki/people/martin-kleppmann.md` — DDIA 作者
    61|    61|   - `wiki/people/gleb-rodionov.md` — Reasoning Shift 论文作者
    62|    62|
    63|    63|3. **index.md 更新**: 新增 martin-kleppmann、gleb-rodionov 两个 people 条目
    64|    64|
    65|    65|**Stats**:
    66|    66|- Pages audited: 38 wiki + 62 sources
    67|    67|- Orphans fixed: 4
    68|    68|- New people pages: 2
    69|    69|- Stale pages: 0
    70|    70|- Tag issues: 0
    71|    71|- Broken source refs: 0
    72|    72|- Index: complete (40/40 pages listed)
    73|    73|
    74|    74|---
    75|    75|
    76|    76|## 2026-04-20 — Ingest: DDIA 第二版
    77|    77|
    78|    78|**Action**: ingest
    79|    79|
    80|    80|**Source**: https://ddia.vonng.com (设计数据密集型应用第二版，中文译本，Martin Kleppmann 著，冯若航译)
    81|    81|
    82|    82|**Files created**:
    83|    83|- sources/books/ddia-preface.md (序言)
    84|    84|- sources/books/ddia-ch01.md 到 ddia-ch14.md (14章)
    85|    85|- wiki/projects/ddia.md (综合知识页)
    86|    86|
    87|    87|**Script**: scripts/fetch_ddia.py (curl + BeautifulSoup，静态 HTML 直接解析)
    88|    88|
    89|    89|**Stats**:
    90|    90|- 15 个源文件，577,730 字符
    91|    91|- 1 个 wiki 综合页（14章精华 + 概念索引表）
    92|    92|- index.md: Books + Projects 各添加1条
    93|    93|- 无新增 people 页（作者 Martin Kleppmann 未在库中）
    94|    94|
    95|    95|---
    96|    96|
    97|    97|## 2026-04-17 — Maintenance Pass
    98|    98|
    99|    99|**Action**: maintain
   100|   100|
   101|   101|**Scope**: Full audit of 33 wiki pages
   102|   102|
   103|   103|**Findings & Fixes**:
   104|   104|
   105|   105|1. **Broken link fixed**: `wiki/people/thariq-shihipar.md` had `../concepts/claude-code-workflow.md` (wrong path). Fixed to `../projects/claude-code-workflow.md`. Also added `../concepts/claude-code-session-management.md` cross-ref.
   106|   106|
   107|   107|2. **Cross-references added** (low-connectivity pages):
   108|   108|   - `claude-opus-4-7.md` ↔ `openai-codex-2026.md` (mutual competitor reference)
   109|   109|   - `claude-code-architecture.md` → `claude-code-session-management.md` (natural extension)
   110|   110|   - `harness-engineering.md` → `synthesis/agentic-rag-as-harness.md` (synthesis page now reachable)
   111|   111|
   112|   112|3. **Updated `updated:` dates** on 5 modified pages.
   113|   113|
   114|   114|**Stats**:
   115|   115|- Pages audited: 33 wiki + 40 sources
   116|   116|- Orphans: 0 (after fixes)
   117|   117|- Stale pages: 0
   118|   118|- Tag issues: 0
   119|   119|- Broken source refs: 0
   120|   120|- Index: complete (33/33 pages listed)
   121|   121|
   122|   122|# Log
   123|   123|
   124|   124|Append-only record of operations.
   125|   125|
   126|   126|---
   127|   127|
   128|   128|- **2026-04-07** | init | Created knowledge base structure and schema
   129|   129|- **2026-04-07** | ingest | Added Karpathy LLM Wiki article → created source, wiki/concepts/llm-wiki-pattern, wiki/people/andrej-karpathy
   130|   130|- **2026-04-07** | ingest | Added Garry Tan GBrain article → created source, updated llm-wiki-pattern, created wiki/people/garry-tan
   131|   131|- **2026-04-07** | ingest | Added Böckeler's Harness Engineering article → created source, wiki/concepts/harness-engineering, wiki/concepts/coding-agents, wiki/people/martin-fowler, wiki/people/birgitta-bockeler; updated llm-wiki-pattern cross-refs
   132|   132|- **2026-04-07** | query+create | "What is Ashby's Law" → created wiki/concepts/ashbys-law, updated harness-engineering cross-refs
   133|   133|- **2026-04-07** | ingest | Added OpenAI's Harness Engineering article → created source, updated wiki/concepts/harness-engineering with Codex case study, updated wiki/concepts/coding-agents
   134|   134|- **2026-04-07** | ingest | Added Anthropic's Harness Design article → created source, updated harness-engineering with GAN-inspired multi-agent pattern, updated coding-agents with context anxiety and harness simplification insights
   135|   135|- **2026-04-07** | maintain | Audit pass: fixed 1 broken ref (removed non-existent personal-knowledge-management.md), fixed 1 orphan (linked birgitta-bockeler from harness-engineering), added missing cross-refs (people ↔ concepts)
   136|   136|- **2026-04-07** | ingest | Added Justin Young's Effective Harnesses article → updated harness-engineering with session continuity pattern, updated coding-agents with failure modes and file-based handoff
   137|   137|- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (ai → ai-agents in karpathy), added missing cross-refs (martin-fowler → harness-engineering, ashbys-law)
   138|   138|- **2026-04-07** | maintain | Found gap: maintain workflow missed Justin Young (no entity coverage check). Created wiki/people/justin-young. Updated CLAUDE.md maintain workflow to include entity coverage check
   139|   139|- **2026-04-07** | ingest | Added claude-howto guide → created source, created wiki/projects/claude-code-workflow (first project page!), mapped Claude Code features to harness engineering concepts
   140|   140|- **2026-04-07** | maintain | Audit pass: fixed 2 orphans (linked claude-code-workflow and justin-young from concept pages), created 2 missing author pages (prithvi-rajasekaran, luongnv89), added missing cross-ref (coding-agents → ashbys-law)
   141|   141|- **2026-04-07** | ingest | Added Meta-Harness paper (arXiv:2603.28052) → created source, wiki/concepts/meta-harness, wiki/people/chelsea-finn, wiki/people/omar-khattab; updated harness-engineering and coding-agents with Meta-Harness cross-refs
   142|   142|- **2026-04-07** | ingest | Added Jagtap's Meta-Harness library article → created source, wiki/people/shashikant-jagtap; updated meta-harness with open-source implementation section, updated harness-engineering and coding-agents timelines
   143|   143|- **2026-04-07** | maintain | Audit pass: added shashikant-jagtap to harness-engineering related, added missing source refs to coding-agents (meta-harness-optimization, meta-harness-library-jagtap), linked luongnv89 from claude-code-workflow (was orphan)
   144|   144|- **2026-04-07** | ingest | Added Anthropic's "Building Effective Agents" (Schluntz & Zhang) → created source, wiki/concepts/agentic-patterns (6 composable patterns), wiki/people/erik-schluntz, wiki/people/barry-zhang; updated coding-agents and harness-engineering cross-refs
   145|   145|- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (architecture → architecture-pattern in agentic-patterns). No orphans, no broken refs, all entity coverage OK. 19 wiki pages, 10 sources.
   146|   146|- **2026-04-07** | ingest | Added rosa's "从Bash工具开始理解Agent" → created source, wiki/concepts/tool-use-as-meta-ability, wiki/people/rosa; updated coding-agents and agentic-patterns cross-refs
   147|   147|- **2026-04-07** | maintain | Audit pass: fixed tag inconsistency (tools → tool-use in coding-agents, claude-code-workflow), added missing cross-ref (tool-use-as-meta-ability → rosa). No orphans, no broken refs, entity coverage OK. 21 wiki pages, 11 sources.
   148|   148|- **2026-04-07** | ingest | Added Chaofa Yuan's harness engineering article → created source, wiki/people/chaofa-yuan; updated harness-engineering with engineering hierarchy, transient/persistent distinction, co-evolution, LangChain case study; updated coding-agents timeline
   149|   149|- **2026-04-07** | ingest | Added Chaofa Yuan's KV Cache & Prompt Caching article → created source, wiki/concepts/kv-cache-and-prompt-caching (new topic: LLM inference optimization); updated wiki/people/chaofa-yuan with second article
   150|   150|- **2026-04-07** | ingest | Added rosa's "基于Openclaw的官方文档理解其架构设计" → created source, updated wiki/people/rosa (added second article), added openclaw as emerging concept (gateway, agentic-loop, skills, mcp, memory, heartbeat)
   151|   151|- **2026-04-07** | ingest | Added Chaofa Yuan's "Agent 系统中的 Prompt Caching 设计（上）" → created source, updated wiki/people/chaofa-yuan (third article), updated kv-cache-and-prompt-caching with Claude Code 4-layer architecture and tool management patterns
   152|   152|- **2026-04-07** | ingest | Added Chaofa Yuan's "Agent 系统中的 Prompt Caching 设计（下）" → created source, updated wiki/people/chaofa-yuan (fourth article), updated kv-cache-and-prompt-caching with context rot, compaction, sub-agent patterns
   153|   153|- **2026-04-07** | maintain | Audit pass: fixed 8 orphans (linked all people to concept pages), added kv-cache-and-prompt-caching to rosa and chaofa-yuan related, added luongnv89 to coding-agents, fixed tag inconsistency (trailing spaces), updated claude-code-workflow related
   154|   154|- **2026-04-07** | ingest | Added "爱马仕：一家做了 189 年 Harness 的公司" → created source, created wiki/people/jinse-chuanshuo-dacongrming, updated harness-engineering with new metaphor
   155|   155|
   156|   156|- **2026-04-08**: Maintenance pass
   157|   157|  - Orphan pages: ✅ None found
   158|   158|  - Stale pages (90+ days): ✅ None found
   159|   159|  - Broken refs: ✅ None found
   160|   160|  - Tag consistency: ✅ All lowercase/hyphenated
   161|   161|  - Entity coverage: ✅ All source authors have wiki pages (including new entries)
   162|   162|  - Index sync: ✅ Fixed missing entry (金色传说大聪明)
   163|   163|- **2026-04-08** | maintain | Audit pass: added hermes-harness-metaphor.md to harness-engineering sources (was missing), updated rosa.md with OpenClaw article content in Key Points and Timeline, added rosa-openclaw-architecture.md to coding-agents sources with timeline entry. 17 sources, 8 concepts, 15 people, 1 project. No orphans, no broken refs.
   164|   164|- **2026-04-08** | ingest | Added Chaofa Yuan's "RAG 进化之路" → created source, created wiki/concepts/agentic-rag (new concept: RAG evolution); updated chaofa-yuan (5th article), added cross-refs to agentic-patterns and coding-agents. 18 sources, 9 concepts.
   165|   165|- **2026-04-08** | maintain | Audit pass: no orphans, no broken refs, no stale pages, entity coverage complete. Fixed 4 tag inconsistencies: `agent` → `ai-agents` (3 files), `prompt-cache` → `prompt-caching` (2 files), `tools` → `tool-use` (1 file). 18 sources, 9 concepts, 15 people, 1 project.
   166|   166|- **2026-04-08** | query+create | "将 Agentic RAG 做成 harness" → created wiki/synthesis/agentic-rag-as-harness (first synthesis page!). Cross-cutting analysis: harness 化的 RAG 检索轨迹可桥接工具驱动与 RL 驱动两条路径.
   167|   167|
   168|   168|
   169|   169|- **2026-04-08**: Ingested Agency Agents (msitarzewski/agency-agents)
   170|   170|  - Created source: sources/articles/agency-agents.md
   171|   171|  - Created wiki: wiki/people/msitarzewski.md
   172|   172|  - Updated index.md with both entries
   173|   173|
   174|   174|- **2026-04-10** | maintain | Audit pass results:
   175|   175|  - Orphan pages: Fixed 3 orphans — linked msitarzewski from coding-agents, agentic-rag-as-harness from agentic-rag, crypto-morningstar-integration from claude-code-workflow (mutual link)
   176|   176|  - Stale pages: ✅ None (all pages <90 days old)
   177|   177|  - Contradictions: ✅ None found
   178|   178|  - Tag consistency: Fixed 2 files using `ai-agent` (singular) → `ai-agents` (plural, standard). All tags now lowercase/hyphenated.
   179|   179|  - Entity coverage: ✅ All source authors have wiki pages (false positives from multi-author and parenthetical fields in parser)
   180|   180|  - Index sync: ✅ All 30 wiki pages appear in index.md
   181|   181|  - Updated `updated:` dates on 6 modified pages.
   182|   182|
   183|   183|- **2026-04-10** | ingest | Added "Claude Code from Source" full book (18 chapters) by Alejandro Balderas. Source: https://claude-code-from-source.com/. Created 18 source files (sources/books/claude-code-from-source-ch01..ch18.md), wiki/projects/claude-code-architecture.md (main book page), wiki/people/alejandro-balderas.md. Updated 4 concept pages (coding-agents, agentic-patterns, kv-cache-and-prompt-caching, tool-use-as-meta-ability) with cross-refs and timeline entries. Updated index.md with Books section, new project, and new person. Total: 37 sources (18 book chapters + 19 articles), 9 concepts, 17 people, 3 projects, 1 synthesis.
   184|   184|
   185|   185|
   186|   186|- **2026-04-17** | ingest | Added Anthropic "Introducing Claude Opus 4.7" article
   187|   187|  - Created source: sources/articles/claude-opus-4-7.md
   188|   188|  - Created wiki: wiki/concepts/claude-opus-4-7.md (new concept)
   189|   189|  - Updated index.md with new concept entry
   190|   190|  - Related to: coding-agents, agentic-patterns
   191|   191|  - Key findings: 13% improvement on coding benchmark, xhigh effort level, higher resolution vision (2,576px), updated tokenizer (1.0-1.35x more tokens)
   192|   192|
   193|   193|- **2026-04-17** | ingest | Added OpenAI "Codex for (almost) everything" article (via Wayback)
   194|   194|  - Created source: sources/articles/codex-update-2026.md
   195|   195|  - Created wiki: wiki/concepts/openai-codex-2026.md (new concept)
   196|   196|  - Updated index.md with new concept entry
   197|   197|  - Related to: coding-agents, agentic-patterns
   198|   198|  - Key findings: Background computer use, multi-agent parallel work, memory preview, 90+ new plugins, in-app browser
   199|   199|
   200|   200|- **2026-04-17** | ingest | Added Anthropic "Using Claude Code: session management and 1M context" article
   201|   201|  - Created source: sources/articles/claude-code-session-management.md
   202|   202|  - Created wiki: wiki/concepts/claude-code-session-management.md (new concept)
   203|   203|  - Created wiki: wiki/people/thariq-shihipar.md (new person)
   204|   204|  - Updated index.md with new concept and person
   205|   205|  - Related to: coding-agents, harness-engineering, claude-code-workflow, justin-young, thariq-shihipar
   206|   206|  - Key findings: Context rot, 1M token, 5 tools (continue/rewind/clear/compact/subagent), decision table
   207|   207|
   208|   208|- **2026-04-17** | ingest | Added Microsoft Learn "什么是敏捷？" article
   209|   209|  - Created source: sources/articles/what-is-agile.md
   210|   210|  - Created wiki: wiki/concepts/agile.md (new concept)
   211|   211|  - Updated index.md with new source and concept
   212|   212|  - Related to: devops, software-development, methodology
   213|   213|  - Key findings: 敏捷宣言四个价值观、敏捷框架(Scrum/看板) vs 敏捷实践(规划扑克/持续集成)、常见误解澄清
   214|   214|
   215|   215|- **2026-04-17** | ingest | Added Microsoft Learn 敏捷系列文章 (5篇)
   216|   216|  - Sources created:
   217|   217|    - sources/articles/what-is-agile-development.md
   218|   218|    - sources/articles/what-is-scrum.md
   219|   219|    - sources/articles/what-is-kanban.md
   220|   220|    - sources/articles/adopting-agile.md
   221|   221|    - sources/articles/building-productive-teams.md
   222|   222|  - Wiki concepts created:
   223|   223|    - wiki/concepts/scrum.md
   224|   224|    - wiki/concepts/kanban.md
   225|   225|  - Updated wiki/concepts/agile.md with new content from all 5 articles
   226|   226|  - Updated index.md with all new sources and concepts
   227|   227|  - Key findings: 敏捷开发三要素、Scrum 框架、看板四原则、敏捷文化、双机组系统 (F-Crew/C-Crew)
   228|   228|
   229|   229|- **2026-04-17** | maintain | Audit pass:
   230|   230|  - **Broken source paths fixed**: agile.md, scrum.md, kanban.md had `../sources/` (resolves to wiki/sources/) — fixed to `../../sources/` (correct root-relative path)
   231|   231|  - **Index sync**: Added 3 missing source entries (claude-opus-4-7.md, codex-update-2026.md, claude-code-session-management.md) to Sources section
   232|   232|  - **Cross-refs added**: coding-agents → claude-opus-4-7, openai-codex-2026, claude-code-session-management; harness-engineering → claude-code-session-management; justin-young → claude-code-session-management
   233|   233|  - Orphans: 0 (agile/scrum/kanban form a self-contained cluster)
   234|   234|  - Stale pages: 0 (all <90 days)
   235|   235|  - Tag consistency: ✅
   236|   236|  - Entity coverage: ✅ (Microsoft Learn articles have corporate authorship, no individual author pages needed)
   237|   237|  - Stats: 36 wiki pages, 47 sources. Updated `updated:` dates on 4 modified pages.
   238|   238|
   239|   239|- **2026-04-20** | ingest | Added arXiv paper "Reasoning Shift: How Context Silently Shortens LLM Reasoning" (Rodionov, 2026)
   240|   240|  - Source created: sources/articles/reasoning-shift-rodionov.md
   241|   241|  - Wiki concept created: wiki/concepts/reasoning-shift.md
   242|   242|  - Updated related pages: wiki/concepts/claude-code-session-management.md, wiki/concepts/harness-engineering.md
   243|   243|  - Updated index.md with new source and concept entries
   244|   244|  - Key findings: 推理型 LLM 在非隔离上下文条件下推理链最多压缩 50%，自我验证行为（double-checking）显著减少。对简单问题影响小，对复杂任务性能下降。与 context rot、harness engineering 子代理策略高度相关。
   245|   245|
   246|
   247|- **2026-04-22** | ingest | Added Garry Tan's "How to really stop your agents from making the same mistakes" article
   248|  - Created source: sources/articles/2046876981711769720.md
   249|  - Created wiki concepts: wiki/concepts/skillify.md, wiki/concepts/thin-harness-fat-skills.md, wiki/concepts/resolver.md
   250|  - Created wiki project: wiki/projects/gbrain.md
   251|  - Updated wiki people: wiki/people/garry-tan.md
   252|  - Updated index.md with new source, concepts, and project entries
   253|  - Related to: ai-agents, reliability, testing, skills, langchain, gbrain, harness-engineering
   254|  - Key findings: Skillify practice (10-step checklist), thin harness/fat skills architecture, resolver routing, critique of LangChain for tools without workflow
   255|

- **2026-04-22** | maintain | Audit pass:
  - **孤儿子检查**: 2个误报页面 (kanban.md, scrum.md 被 agile.md 引用，不是真正的孤儿)
  - **标签一致性**: ✅ 良好
  - **实体覆盖**: ✅ 所有个人作者都有 people 页面
  - **索引同步**: ✅ 所有页面都在 index.md 中
  - **断裂引用**: ✅ 没有断裂引用
  - **统计**: 46 wiki 页面, 64 sources. 无实际问题需要修复。
