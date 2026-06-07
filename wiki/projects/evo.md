---
title: Evo
created: 2026-06-07
updated: 2026-06-07
type: entity
tags: [autoresearch, agent, open-source, harness, fine-tuning, benchmark]
sources: [sources/articles/evo-autoresearch-lawbench-2026.md]
confidence: medium
---

## Summary

Evo 是一个开源的 autoresearch orchestrator，由 [Alok Bishoyi](../people/alok-bishoyi.md) 等人构建。给定一个系统、"更好"的定义和预算，Evo 自动生成假设、在隔离工作区中运行实验、评分结果，并维护一棵尝试树——扩展有效的，剪枝无效的。

## Key Points

- **核心能力**：同时优化模型权重（SFT/LoRA/RL）和 harness（prompts/scaffold/skills），在同一循环中、针对同一目标
- **v0.5 里程碑**：首次实现模型微调 + harness 改写的一体化循环，系统自行决定预算分配
- **LawBench 成绩**：在中文刑事案件定罪基准上达到 **0.776**，超过此前 SOTA（0.701），且全程无人工干预
- **奥卡姆剃刀发现**：Evo 尝试了 120B 模型微调但效果不佳，最终落地方案是一个无 LLM 的经典分类器管线，跑在低端无 GPU 机器上
- **开源**：Evo 本身、基准评测器、获胜 harness、完整运行记录全部开源
- **兼容宿主**：Claude Code、Codex、Cursor 等

## 设计哲学

> base model × harness × a verifiable loop

三个因子相乘。多年来只有第一个因子（base model）在移动——新模型发布带动下游一切。另外两个因子（harness 和可验证循环）一直是你的，但难以系统化地推动。自改进循环让它们动起来。

## Connections

- 核心理念与 [[self-evolving-harness]] 密切相关——harness 通过 tracing 数据自动进化
- 与 [[meta-harness]] 互补——Meta-Harness 搜索最优 harness 配置，Evo 更进一步同时搜索模型和 harness
- LawBench 结果挑战了 [[the-bitter-lesson]] 的隐含假设——更大更强的模型不一定是最优解
- 奥卡姆剃刀结果与 [[latent-vs-deterministic]] 框架呼应——最终方案是确定性的经典管线
- 属于 [[coding-agents]] 生态中的自改进子类别
- [[alok-bishoyi]] 是 Evo 的核心构建者

## Open Questions

- Evo 在其他基准（如 SWE-bench）上的表现如何？
- "可验证循环"对 reward hacking 的抵抗力有多强？文章提到 auditor 检查但未详述
- 与 RLHF/DPO 等训练方法的关系——Evo 的 fine-tuning 是用什么信号？

---
## Evidence Timeline

- **2026-06-06**: Alok Bishoyi 在 X 发布 Twitter Article，报告 Evo v0.5 在 LawBench 上达到 0.776 SOTA ^[sources/articles/evo-autoresearch-lawbench-2026.md]
