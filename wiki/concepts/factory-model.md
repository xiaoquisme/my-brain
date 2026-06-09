---
title: Factory Model
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [agent, coding-agents, workflow, multi-agent]
sources: [../../sources/articles/loop-engineering-osmani-2026.md]
confidence: low
---

## Summary

Factory Model 是 Addy Osmani 提出的 AI 软件构建系统模型，将整个软件开发流程视为一个工厂：Agent 在流水线上执行任务，循环系统（[[loop-engineering]]）调度和协调。它位于 Harness（单个 Agent 运行环境）之上，是更上层的系统抽象。

## Key Points

### 层级关系

- **Harness** = 单个 Agent 的运行环境（安全、上下文管理、工具集成）
- **Loop** = Harness + 定时器 + 子 Agent + 自我喂养
- **Factory** = 多个 Loop 组成的完整软件构建系统

### 核心理念

工厂模型的核心思想是：软件构建可以像制造业一样被系统化。每个工位（Agent）有明确的输入/输出，流水线（Loop）负责调度，质检（Sub-agent verifier）负责把关。

## Open Questions

- Factory Model 的详细架构尚未完整发布（截至 2026-06，仅在 Osmani 博客中简要提及）
- 与 [[compound-engineering]] 的关系需要进一步厘清
- 实际生产环境中的 case study 缺失

## Evidence Timeline

- **2026-06-09**: 从 Loop Engineering 文章中间接了解，Osmani 将其定位为 Loop 的上层抽象

## Related

- [[loop-engineering]] — Factory 的核心运行机制
- [[harness-engineering]] — Factory 的基础层
- [[compound-engineering]] — 类似的系统化工程理念
- [[coding-agents]] — Factory 中的执行单元
- [[addy-osmani]] — Factory Model 提出者
