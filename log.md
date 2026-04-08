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

