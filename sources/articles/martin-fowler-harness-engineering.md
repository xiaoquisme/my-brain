---
title: "Harness Engineering for Coding Agent Users"
url: https://martinfowler.com/articles/harness-engineering.html
date_added: 2026-04-07
type: article
tags: [ai-agents, coding-agents, software-engineering, testing, architecture]
author: Birgitta Böckeler
published: 2026-04-02
---

Birgitta Böckeler (Martin Fowler's blog) 提出的框架：如何通过系统化的工程控制来建立对 AI 生成代码的信任。Harness = AI agent 中模型之外的一切。

## 核心框架：Feedforward + Feedback

- **Guides（前馈/引导）**：在代码生成前引导 agent 行为，提高首次成功率
- **Sensors（反馈/传感器）**：生成后监控，支持自我纠正

> "Feedback-only systems produce repeated errors; feedforward-only systems lack validation."

## 两种执行类型

- **Computational（计算型）**：确定性、快速（毫秒-秒级）、可靠。如：测试、linter、类型检查
- **Inferential（推理型）**：通过 AI 做语义分析，更慢、概率性但语义更丰富。如：代码审查 agent、自定义 LLM 评判

## 三类控制维度

### 1. Maintainability Harness（可维护性）
监控内部代码质量：重复代码、复杂度、风格问题。计算型传感器可靠地捕捉这些问题。

### 2. Architecture Fitness Harness（架构适应度）
通过 fitness functions 定义和监控系统特性——描述性能需求的 skill + 性能测试 + 可观测性标准。

### 3. Behaviour Harness（行为验证）
最具挑战的维度。目前依赖 AI 生成的测试套件 + 人工测试，对于高自主度场景不够严谨。

## Timing/Quality Left

按成本和速度在开发生命周期中分布检查：
- Pre-commit（提交前）
- Pre-integration（集成前）
- Post-integration pipeline（集成后流水线）
- Continuous monitoring（持续监控）

早期检测降低修复成本。

## Harnessability（可装备性）

不是所有代码库都同等适合 harness engineering：
- 强类型语言 ✓
- 清晰模块边界 ✓
- 框架抽象 ✓
- 这些创造"ambient affordances"——让系统更适合 agent 操作

## Ashby's Law

监管系统需要足够的"多样性"来治理目标。承诺预定义的服务拓扑可以缩小解空间，使全面的 harness 更可实现。

## 人的角色

开发者提供"隐式 harness"——内化的规范、组织对齐、经验判断。显式 harness 将这些知识外部化，但不能完全替代人的输入。好的 harness"将人的精力导向最重要的地方"。

## 开放问题

- 复杂度增长时如何维护连贯的 harness？
- 如何系统性评估 harness 覆盖率和质量？
- 如何解决矛盾的引导信号？
- 更好的行为验证方法？
- 统一 harness 配置和推理的工具？
