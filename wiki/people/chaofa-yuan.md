---
title: Chaofa Yuan
created: 2026-04-07
updated: 2026-04-07
tags: [ai-agents, harness-engineering, llm, inference]
sources:
  - ../../sources/articles/yuanchaofa-harness-engineering.md
  - ../../sources/articles/yuanchaofa-kv-cache-prompt-caching.md
  - ../../sources/articles/yuanchaofa-prompt-cache-design.md
  - ../../sources/articles/yuanchaofa-agent-context-management.md
related:
  - ../concepts/harness-engineering.md
  - ../concepts/coding-agents.md
  - ../concepts/kv-cache-and-prompt-caching.md
---

## Summary

Technical writer at yuanchaofa.com. Writes about AI agent engineering and LLM infrastructure in Chinese, covering harness engineering, inference optimization, and practical agent improvement strategies.

## Key Points

- Authored "Harness Engineering — Agent 不好用，也许不是模型的问题" — arguing performance issues are harness problems, not model problems
- Proposed a three-level engineering hierarchy: Prompt Engineering → Context Engineering → Harness Engineering (expanding scope, not replacement)
- Distinguished **transient** harness designs (compensate model limitations, will become obsolete) from **persistent** ones (physical constraints like storage, sandboxing, version control)
- Key insight: harness execution trajectories become training data — co-evolution between environment and model

- Also authored "理解 KV Cache 与 Prompt Caching" — explaining KV Cache, Prefill/Decode phases, and Prompt Caching with architectural implications for Agent systems
- Connects inference-level concerns (Prompt Caching prefix matching) to Agent system architecture design

## Open Questions

*None yet*

---
## Evidence Timeline

- **2026-04-07**: First encountered via harness engineering article (published 2026-03-14)
- **2026-04-07**: Second article ingested — KV Cache and Prompt Caching (published 2026-02-21). Expands scope from harness engineering to LLM inference fundamentals
