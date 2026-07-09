---
title: LMCache
created: 2026-07-09
updated: 2026-07-09
type: entity
tags: [inference, kv-cache, llms, optimization, open-source, swe-tool]
sources: [../../sources/articles/akshay-lmcache-kv-cache-management-2026.md]
confidence: high
---

## Summary

LMCache 是一个 KV Cache 管理层，将 KV cache 从临时状态转变为可复用的 AI 原生知识。支持持久化存储、跨引擎复用、可观测性监控，显著降低 TTFT 并提升吞吐量，尤其适合长上下文 Agent、多轮对话和 RAG 场景。

## 核心架构

LMCache 采用分层存储（Tiered Storage）设计：

1. **GPU Memory** — 最快、最贵
2. **CPU RAM** — 次快
3. **Local SSD** — 中等
4. **Cloud/Remote Storage** — 最慢、最便宜

LMCacheDaemon 作为独立守护进程运行，与推理引擎（vLLM/SGLang）解耦，实现：
- 并行搜索所有存储层
- 仅对未缓存的 token 执行 attention 计算
- 新产生的 KV cache 写入共享 GPU 内存 + 低层存储

## 关键特性

- **Engine-independent** — 独立守护进程，引擎崩溃不丢失 KV cache（no fate-sharing）
- **Persistent tiered offloading** — GPU → CPU → SSD → remote，跨请求/会话/引擎实例复用
- **Production observability** — Kubernetes 指标、prefix cache hit、生命周期、用户级用量
- **Pluggable backends** — 统一接口集成远程存储和 KV 传输后端
- **Vendor-neutral** — 支持 vLLM、SGLang 等多种引擎和硬件

## 生态整合

- **PyTorch Foundation** 成员（2025/10 加入）
- **NVIDIA Dynamo** 集成（2025/09）
- **CoreWeave** 合作加速 Cohere 推理（2025/11）
- **Tensormesh** 发布（2025/10）
- 支持 AMD MI300X、Arm、Ascend 等多硬件平台

## 与 KV Cache 理论的关系

[[kv-cache-and-prompt-caching]] 页面描述了 KV Cache 的基本原理（intra-request）和 Prompt Caching（inter-request prefix matching）。LMCache 在此基础上进一步：
- 突破 GPU 内存限制，将 KV cache 持久化到多层存储
- 实现跨引擎实例的 KV cache 共享
- 为 agentic workload 提供更好的长上下文支持

## 技术栈

- 语言：Python + C++
- 集成：vLLM、SGLang
- GitHub: https://github.com/LMCache/LMCache
- Stars: 5,000+（截至 2025/08）

## 相关页面

- [[kv-cache-and-prompt-caching]] — KV Cache 基础理论
- [[akshay-pachaar]] — 推荐此项目的博主
- [[harness-engineering]] — LMCache 是 harness 层推理优化的关键组件
- [[coding-agents]] — 长上下文 Agent 场景是 LMCache 的核心 use case
