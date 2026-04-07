---
title: "理解 KV Cache 与 Prompt Caching：LLM 推理加速的核心机制"
url: https://yuanchaofa.com/post/understanding-kv-cache-and-prompt-cache-basics
date_added: 2026-04-07
date_published: 2026-02-21
date_modified: 2026-03-22
author: Chaofa Yuan
type: article
tags: [llm, transformer, kv-cache, prompt-caching, inference]
---

## 核心概念

### 1. KV Cache

**重复计算问题**：自回归生成中，每一步都要对所有历史 token 重新做 Attention 计算（Q、K、V 矩阵乘法）。但历史 token 的 K 和 V 值不会变化（参数和 token 都没变），只有最新 token 的 Q、K、V 是新的。

**核心优化**：缓存每个已生成 token 的 K、V 向量，每步只计算新 token 的 Q、K、V，将新向量追加到缓存中做 Attention。计算量从 O(t × d) 降到 O(d)。

**显存开销公式**：
KV Cache 显存 = 4blh(s + n) bytes
- b = batch size
- l = transformer 层数
- h = hidden size
- s = 输入序列长度
- n = 输出序列长度

### 2. Prefill vs Decode 两阶段

**Prefill 阶段 (Compute Bound)**：
- 所有输入 token 并行处理
- 大量矩阵乘法，计算密集
- 算术强度高

**Decode 阶段 (Memory Bound)**：
- 每步只处理一个 token
- 计算量小，但需从 GPU 显存读取整个 KV Cache
- 算术强度低

**算术强度** = 计算量 (FLOPs) / 数据搬运量 (Bytes)

**为什么 Prefill 需要计算所有位置的 Q 向量？**
Multi-layer Decoder 中，每一层的 K、V cache 依赖于上一层的完整输出，因此必须计算所有位置的 Q。

**延迟指标**：
- TTFT (Time To First Token)：主要由 Prefill 决定
- TPOT (Time Per Output Token)：主要由 Decode 决定

### 3. Prompt Cache (Prefix Caching)

**跨请求优化**：如果两次 API 调用共享相同的 prompt 前缀，第二次可以复用第一次 Prefill 计算好的 KV Cache，跳过前缀计算。

**适用场景**：多轮对话、共享 system prompt、Agent 系统

**前缀匹配规则**：必须从第一个 token 开始完全一致；任何位置出现分歧，该位置之后的缓存全部失效。

**关键洞察**：前缀精确匹配的约束，从根本上影响了 Agent 系统的架构设计。

**生产实现**：
- vLLM：`--enable-prefix-caching`，基于 hash 的 block 管理
- SGLang：默认 RadixAttention，使用 Radix Tree 管理前缀

### 4. 结论

KV Cache 是单次请求内的优化（避免重复计算），Prompt Cache 是跨请求的优化（复用共享前缀的 KV Cache）。前缀精确匹配的约束对 Agent 系统架构有深远影响。
