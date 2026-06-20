---
title: Autoresearch
created: 2026-06-07
updated: 2026-06-20
type: concept
tags: [autoresearch, agent, harness, fine-tuning, optimization]
sources: [../../sources/articles/evo-autoresearch-lawbench-2026.md]
confidence: medium
---

## Summary

Autoresearch 是一种 AI 系统自改进模式：系统定义"更好"的度量，然后自动搜索（harness 调参 + 模型微调）空间来最大化该度量。核心公式：**base model × harness × a verifiable loop**。

## Key Points

### 两个参数空间

每个 agentic 系统都有两个可优化的参数空间：
1. **Harness 层**：prompts、scaffold、skills、答案提取和检查方式
2. **模型层**：权重（通过 RL/SFT/LoRA 微调）

大多数系统只优化其中一个——要么调 harness，要么训模型。几乎没有人同时在同一个循环中、针对同一个目标优化两者。

### 自改进循环

自改进循环（self-improving loop）的关键要素：
- **可验证目标**：必须有一个明确的、可自动评分的度量
- **假设生成**：系统自动生成改进假设
- **隔离实验**：每个假设在独立工作区运行
- **搜索树**：保留获胜者，剪枝失败者
- **审计器**：防止优化器"gaming the metric"

### 奥卡姆剃刀效应

当同时搜索模型和 harness 空间时，系统可能发现：
- 昂贵的模型微调不是最优解
- 简单的经典管线（无 LLM）反而得分更高
- 这是"搜索发现的奥卡姆剃刀"——不是预先假设简单更好，而是搜索证明了简单更好

## Connections

- [[evo]] 是目前最突出的 autoresearch 实现
- 与 [[self-evolving-harness]] 概念高度重叠——harness 自动进化是 autoresearch 的子集
- 与 [[meta-harness]] 互补——Meta-Harness 只搜索 harness 配置，autoresearch 同时搜索模型
- 挑战 [[the-bitter-lesson]] 的简单解读——通用方法+大计算不一定是最优的
- 与 [[harness]] 工程的 [[car-framework]] 有交叉——autoresearch 优化的正是 CAR 的 Control 和 Agency 层
- [[harnessx]] — HarnessX 实现了 autoresearch 的完整范式：harness 进化 + cross-harness GRPO 模型协同进化 + 验证器反馈闭环

## Open Questions

- autoresearch 对 reward hacking / Goodhart's Law 的抵抗力如何？
- "可验证目标"的限制——很多现实任务难以自动评分
- 计算成本——40 次实验的预算对中小团队是否可行？
- 是否适用于非代码领域（如写作、设计）？
