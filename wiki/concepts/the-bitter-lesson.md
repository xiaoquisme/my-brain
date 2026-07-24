---
title: The Bitter Lesson
created: 2026-05-12
updated: 2026-06-07
type: concept
tags: [training, optimization, ai-researcher, reasoning]
sources: [../../sources/articles/the-bitter-lesson.md]
confidence: high
---

## Summary

Rich Sutton 2019 年的经典论述：70 年 AI 研究最大的教训是，利用计算的通用方法最终最有效，而且优势巨大。原因在于 Moore 定律的推广——计算成本持续指数下降。短期内利用人类知识看似有效，但长期只有利用计算才重要。

## Key Points

- **核心论点**：通用方法（搜索 + 学习）+ 大规模计算 终将胜过人类知识驱动的方法
- **历史模式**：AI 研究者反复犯同一个错误——把当前可用计算当作常量，转而利用人类知识
- **两个方向的张力**：利用人类知识 vs 利用计算，在实践中往往对立
- **具体案例**：围棋（搜索 > 人类直觉）、语音识别（统计方法 > 专家规则）、计算机视觉（深度学习 > 手工特征）
- **心理障碍**：研究者对人类知识方法有心理投入，不愿承认计算方法的优越性

## Connections

- 与 [[autoresearch]] 的发现形成有趣张力——Evo 在 LawBench 上发现简单经典管线（无 LLM）优于 120B 微调模型
- 与 [[evo]] 的奥卡姆剃刀结果呼应——搜索发现的简单方案赢了
- 与 [[the-bitter-lesson]] 的"通用方法"论点不矛盾——Evo 的搜索本身就是通用方法
- Rich Sutton（[[rich-sutton]]）是作者

## Open Questions

- bitter lesson 是否适用于 harness 工程？harness 本质上是人类知识的编码
- 当计算不再指数增长（摩尔定律放缓），bitter lesson 是否仍然成立？

---
## Evidence Timeline

- **2026-05-12**: 从 Rich Sutton 原文 ingest ^[sources/articles/the-bitter-lesson.md]

## 相关页面

- [[human-3.0]] — Dan Koe 的发展框架中"超越并包含"低层级的概念与 bitter lesson 的通用方法论思想相通
- [[model-alignment]] — Scale vs alignment 的张力：bitter lesson 强调 scale，alignment 强调对齐
