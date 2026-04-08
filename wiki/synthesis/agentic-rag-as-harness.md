---
title: Agentic RAG as Harness
created: 2026-04-08
updated: 2026-04-08
tags: [rag, harness-engineering, ai-agents, synthesis]
sources:
  - ../../sources/articles/yuanchaofa-native-rag-to-agentic-rag.md
  - ../../sources/articles/yuanchaofa-harness-engineering.md
related:
  - ../concepts/agentic-rag.md
  - ../concepts/harness-engineering.md
  - ../concepts/agentic-patterns.md
  - ../concepts/tool-use-as-meta-ability.md
  - ../people/chaofa-yuan.md
---

## Summary

将 Agentic RAG 用 harness engineering 框架重新设计，可以实现"可控的智能检索"——不限制 Agent 能力，而是让它在正确轨道上更高效运行。更重要的是，harness 化的检索轨迹可以作为 RL 训练数据，桥接工具驱动和 RL 驱动两条演化路径。

## Key Points

### 当前 Agentic RAG 的问题

直接把检索工具交给 Agent 自主决策，缺少：
- 检索质量守门——Agent 可能用垃圾证据直接生成
- 成本控制——可能无限循环检索
- 策略引导——完全依赖模型推理能力

### Harness 化设计

| Harness 层 | 应用方式 | 效果 |
|---|---|---|
| 前馈：策略引导 | 检索策略指南（先元数据、再语义搜索、后精读） | 减少无效检索，降低 token 消耗 |
| 前馈：工具设计 (ACI) | 精心设计的工具粒度（如 Chatbox 的 4 个工具） | 工具即约束，限定操作空间 |
| 反馈：评估器 | 检索结果质量检查（相关度阈值、信息充分性） | 智能替代 reranking |
| 反馈：终止条件 | 最大检索轮次、token 预算、证据充分度 | 防止无限循环，控制成本 |
| 反馈：验证 | 答案与证据一致性校验 | 减少幻觉 |

### 瞬时性与持久性 Harness

借用袁超发的分类：
- **瞬时性**：检索策略引导——模型推理能力增强后逐渐不需要
- **持久性**：token 预算、安全边界、审计日志——物理约束永远存在

### 演化桥梁

Harness 执行轨迹变成训练数据的路径：

> 好的 RAG harness → 高质量检索轨迹 → RL 训练数据 → 模型内化检索策略 → harness 简化

这桥接了 Agentic RAG 的两条实现路径：从工具驱动（中等复杂度）渐进演化到 RL 驱动（高适应性），而非二选一。

## Open Questions

- Harness 化的 RAG 如何与 prompt caching 协同？迭代检索是否会破坏 cache 效率？
- 检索质量评估器本身需要多少推理能力？会不会引入额外延迟？
- 最优的工具粒度是什么？太粗失去精度，太细增加决策负担

---
## Evidence Timeline

- **2026-04-08**: 综合推理——将 agentic-rag 和 harness-engineering 两个概念交叉分析，产出本页
