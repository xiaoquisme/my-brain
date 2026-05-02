---
title: Gleb Rodionov
created: 2026-04-20
updated: 2026-04-20
type: entity
tags: [llms, reasoning, ai-agents]
sources: [../../sources/articles/reasoning-shift-rodionov.md]
related: [../concepts/reasoning-shift.md]
---

## Summary

Gleb Rodionov 是来自 Yandex 的研究人员，研究 LLM 推理行为。发表了关于上下文条件如何静默影响 LLM 推理链长度的研究，揭示了推理模型的脆弱性。

## Key Points

- 研究发现：提示中加入时间压力、权威信号等上下文条件，可使 LLM 推理链缩短最多 50%
- 自我验证行为（让模型检查自己的答案）在此类上下文下显著减少
- 该研究对 AI 安全和 Agent 设计有重要意义：prompt 内容会悄无声息地影响推理质量

## Open Questions

- 该效应在不同模型族（GPT、Claude、Gemini）间是否有差异？
- 是否存在对抗此类推理压缩的 prompt 设计模式？

---
## Evidence Timeline

- **2026-04-20**: 通过 reasoning-shift 文章识别，创建本页。

## 相关页面

[[reasoning-shift]]

