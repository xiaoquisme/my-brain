---
title: Model Alignment
created: 2026-07-06
updated: 2026-07-06
type: concept
tags: [training, reinforcement-learning, llms, alignment]
sources: [sources/articles/leerob-how-we-teach-ai-models-2026.md]
confidence: medium
---

## Summary

Model Alignment 是让 AI 模型按照人类期望"正确"行为的过程。智力 alone 不够 — 一个天才但粗鲁的人不会受欢迎，模型也一样。Alignment 通过 model spec（行为规范）+ 训练惩罚坏行为 + A/B 测试来实现，是 pretraining → SFT → RL 管线之后的关键步骤。

## Key Points

### 模型学习的四个阶段

用篮球类比：

| 阶段 | 类比 | 做什么 |
|------|------|--------|
| **Pretraining** | 读所有篮球书 | 从海量文本中学习预测模式，获得"书本智慧" |
| **SFT（监督微调）** | 看优秀球员录像 | 用大量优秀行为示例教模型模仿 |
| **RL（强化学习）** | 上场比赛 + 教练反馈 | 模型实际执行任务，reward 信号告诉它决策好坏 |
| **Alignment** | 球品 + 社交能力 | 确保模型不仅聪明，还行为得体 |

### Model Spec（行为规范）

每个模型都有一个定义"正确行为"的文档：
- OpenAI: [Model Spec](https://model-spec.openai.com/2025-12-18.html)
- Google: [Principles](https://ai.google/principles/)
- Anthropic: [Constitution](https://www.anthropic.com/constitution)

这个文档同时用于内部对齐和训练中的 eval。

### Alignment 的具体做法

1. **识别问题** — 工程师大量对话新模型，记录所有怪癖（如过度使用 "Bottom line:"、为简洁牺牲清晰度）
2. **惩罚坏行为** — 在进一步训练中 penalize 这些行为
3. **A/B 测试** — 在生产环境中对比新旧版本，测量用户偏好

### RL 的泛化能力

新研究发现，RL 中学到的品质（如 truthfulness）可以跨域泛化 — 在一个领域教模型诚实，它在所有领域都会更诚实。

### Benchmark 作为"考试"

- **练习题** = 训练中可以看答案的测试
- **期末考试** = held-out 任务，模型没见过的题目
- **评分方式** = 客观正确性（测试通过？）+ LLM-as-judge（用 rubric 打分）
- **关键**: benchmark 必须测 unseen 任务，否则只是背答案

### Continual Learning 的现状

模型不会从对话中实时学习。当前的"持续学习"方案是：
- 把知识写成 rules/skills 文件
- Agent 在 prompt 时读取这些文件加入 context
- 这种"朴素的记忆方案"效果出奇地好，但离真正的同事式学习还有距离

## Open Questions

- RL 中学到的 truthfulness 泛化能力有多强？边界在哪？
- 当前基于文件的 agent memory 方案（skills/rules）的天花板是什么？
- 如何平衡 alignment 和 capability？过度对齐会降低模型能力吗？

## Related Pages

- [[training]] — 模型训练方法（pretraining、SFT、RL 的技术细节）
- [[reinforcement-learning]] — RL 的具体算法和实践
- [[ai-coding-benchmark]] — Benchmark 评测体系
- [[skill-file]] — 当前 agent "持续学习"的文件方案
- [[the-bitter-lesson]] — Scale vs alignment 的张力
- [[lee-robinson]] — 文章作者
