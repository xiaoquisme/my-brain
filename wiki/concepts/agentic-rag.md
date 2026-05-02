---
title: Agentic RAG
created: 2026-04-08
updated: 2026-04-10
type: concept
tags: [rag, ai-agents, tool-use, reinforcement-learning]
sources:
  - ../../sources/articles/yuanchaofa-native-rag-to-agentic-rag.md
related:
  - agentic-patterns.md
  - coding-agents.md
  - tool-use-as-meta-ability.md
  - ../people/chaofa-yuan.md
  - ../synthesis/agentic-rag-as-harness.md
---

## Summary

Agentic RAG is the evolution of traditional RAG (Retrieval Augmented Generation) that adds agent capabilities — autonomous decision-making through "think → act → observe" loops — replacing the fixed single-pass retrieval pipeline with iterative, adaptive information gathering.

## Key Points

- **Traditional RAG** follows a fixed pipeline: query → retrieve → generate. It lacks task decomposition, adaptive retrieval, and multi-hop reasoning
- **Agentic RAG** makes the LLM a controller that dynamically decides what to retrieve, when, and how — transforming passive retrieval into active decision-making
- Two implementation pathways:

### 1. Tool-Driven (Prompt Engineering + Tools)

Exemplified by Chatbox (36.8k GitHub stars):
- `query_knowledge_base` — semantic search for candidates
- `get_files_meta` — metadata for strategic decisions
- `read_file_chunks` — precision reading of specific segments
- `list_files` — browse file inventory

Key insight: "给模型配备合适的工具和策略性的 Prompt，就能展现出令人惊叹的智能" — appropriate tools + strategic prompts yield remarkable intelligence.

### 2. RL-Driven (Reinforcement Learning)

Exemplified by Search-R1:
- Model learns when/what to search through policy optimization
- Enables "推理-搜索-推理" (reasoning-search-reasoning) cycles
- Higher adaptability but significantly more complex to implement

### Comparison

| | Traditional RAG | Tool-Driven Agentic | RL-Driven Agentic |
|---|---|---|---|
| Decision | Fixed pipeline | Rule-based | Learning-optimized |
| Retrieval | Single pass | Multiple passes | Adaptive multi-pass |
| Adaptability | Low | Medium | High |
| Complexity | Low | Medium | High |

## Relationship to Other Concepts

- Directly implements the **Augmented LLM** and **Orchestrator-Workers** patterns from [Agentic Patterns](agentic-patterns.md)
- The tool-driven approach aligns with [Tool Use as Meta-Ability](tool-use-as-meta-ability.md) — tools enable deterministic, reliable operations
- RAG is increasingly a foundational component within [Coding Agents](coding-agents.md), not a standalone system

## Open Questions

- When is RL-driven Agentic RAG worth the implementation complexity vs. tool-driven?
- How does Agentic RAG interact with prompt caching — do iterative retrieval loops break cache efficiency?
- What's the optimal tool granularity for knowledge base access?

---
## Evidence Timeline

- **2026-04-08**: Initial compilation from Chaofa Yuan's "RAG 进化之路" (published 2025-10-03, modified 2026-03-18)

## 相关页面

[[tool-use-as-meta-ability]], [[chaofa-yuan]]

