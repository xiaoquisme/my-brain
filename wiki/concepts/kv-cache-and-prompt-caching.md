---
title: KV Cache and Prompt Caching
created: 2026-04-07
updated: 2026-04-07
tags: [llm, transformer, inference, kv-cache, prompt-caching]
sources:
  - ../../sources/articles/yuanchaofa-kv-cache-prompt-caching.md
  - ../../sources/articles/yuanchaofa-prompt-cache-design.md
  - ../../sources/articles/yuanchaofa-agent-context-management.md
related:
  - coding-agents.md
  - agentic-patterns.md
  - ../projects/claude-code-workflow.md
---

## Summary

KV Cache and Prompt Caching are two complementary inference acceleration techniques for LLMs. KV Cache avoids redundant K/V computation within a single request (intra-request optimization). Prompt Caching reuses KV Cache across requests sharing the same prefix (inter-request optimization). The prefix-exact-matching constraint of Prompt Caching has deep implications for Agent system architecture.

## Key Points

### KV Cache (Intra-Request)

- In autoregressive generation, historical tokens' K and V values never change — only the new token's Q/K/V matters
- Core idea: cache K/V vectors for all previous tokens, compute only the new token's Q/K/V each step
- Reduces per-step computation from O(t × d) to O(d)
- Memory cost formula: **4blh(s + n) bytes** (b=batch, l=layers, h=hidden, s=input len, n=output len)

### Two Inference Phases

- **Prefill** (Compute Bound): all input tokens processed in parallel, high arithmetic intensity, determines TTFT
- **Decode** (Memory Bound): one token per step, small computation but reads entire KV Cache from GPU memory, determines TPOT
- Key insight: Prefill must compute Q for all positions because multi-layer decoders require each layer's K/V to depend on previous layer's complete output

### Prompt Caching (Inter-Request)

- If two API calls share identical prompt prefix, the second reuses the first's KV Cache — skips prefix Prefill entirely
- **Prefix matching rule**: must match exactly from the first token; any divergence invalidates everything after that point
- Use cases: multi-turn conversations, shared system prompts, Agent systems
- Production implementations: vLLM (`--enable-prefix-caching`, hash-based blocks), SGLang (RadixAttention with Radix Trees, enabled by default)
- **Architectural implication**: the prefix-exact-matching constraint fundamentally shapes how Agent systems structure their prompts (system prompt first, shared context next, variable parts last)

## Open Questions

- How does Prompt Caching interact with techniques like DeepSeek MLA (Multi-head Latent Attention)?
- What are the optimal prompt structuring strategies for maximizing cache hit rates in Agent systems?
- How do different providers (OpenAI, Anthropic, open-source) differ in their caching implementations and constraints?

---
## Evidence Timeline

- **2026-04-07**: Initial compilation from Chaofa Yuan's article (published 2026-02-21, updated 2026-03-22)
