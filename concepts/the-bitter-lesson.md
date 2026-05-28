---
title: The Bitter Lesson
created: 2026-05-12
updated: 2026-05-12
type: concept
tags: [essay, optimization, training, reinforcement-learning, reasoning]
sources: [../../sources/articles/the-bitter-lesson.md]
confidence: high
---

## Summary

Rich Sutton 在 2019 年发表的文章，总结了 70 年 AI 研究的核心教训：**利用计算的通用方法最终远胜于利用人类知识的方法**。这一规律在象棋、围棋、语音识别、计算机视觉等领域反复验证。

## Key Points

### 核心论点

AI 研究的最大教训：通用方法 + 大规模计算 > 人类知识 + 精巧设计。原因是 Moore 定律——计算成本持续指数下降。研究者常假设计算量恒定，从而转向人类知识来提升性能，但长期来看只有利用计算才是真正重要的。

### 历史验证

- **国际象棋 (1997)**: 深度搜索击败 Kasparov，人类知识方法的研究者"不是好的失败者"
- **围棋 (2016+)**: 同样的模式延迟 20 年重演，搜索 + 自博弈学习 统治了围棋
- **语音识别 (1970s-)**: HMM 统计方法胜过基于音素/声道知识的方法；深度学习进一步减少人类知识依赖
- **计算机视觉**: 边缘检测、SIFT 等手工特征被 CNN 完全取代

### 两个关键结论

1. **通用方法的力量**: 搜索 (search) 和学习 (learning) 是两种能随计算量无限扩展的方法
2. **心智内容不可简化**: 试图将人类对空间、物体、对称性的理解硬编码到系统中是徒劳的——应该构建的是发现这些复杂性的**元方法**，而不是我们已发现的东西

### 对现代 AI 的启示

这篇文章在 LLM 时代愈发显得有先见之明：
- 大语言模型就是"搜索+学习"的极致体现——用海量数据和算力训练通用模型
- 提示工程 (prompt engineering) 和人类知识注入 vs. 纯规模化训练 的争论，本质上重演了 bitter lesson
- [[latent-vs-deterministic]] 框架是这一教训的现代架构映射

## Open Questions

- "Bitter lesson" 是否意味着人类知识完全无用？（Sutton 说的是"在长期来看"，短期人类知识仍有价值）
- 在算力受限的场景（边缘设备、小模型），人类知识方法是否仍然是必要的？
- Scaling laws 是否就是 bitter lesson 的数学表达？

## Related Pages

- [[rich-sutton]] — 文章作者，强化学习先驱
- [[latent-vs-deterministic]] — Bitter Lesson 的架构化表述：学习型 vs 规则型
- [[coding-agents]] — AI 编码 Agent 正在实践这一教训
- [[agentic-patterns]] — Agent 设计中通用方法 vs 领域知识的权衡
- [[harness]] — 提供计算资源的基础设施层
