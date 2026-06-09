---
title: 人在环上（Human-on-the-Loop）
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [agent, coding-agents, cybernetics, control-theory, harness-engineering]
sources: [../../sources/articles/cybernetics-human-on-the-loop-2026.md]
confidence: medium
---

## Summary

Human-on-the-Loop (HotL) 是一种 AI Agent 控制范式：人类不再逐行审查代码（Human-in-the-Loop），而是退居元维度（meta level），通过设计系统架构、配置策略和监控异常来引导 Agent 系统。这一范式源自控制论（Cybernetics）和管理科学。

## Key Points

### 从 HITL 到 HotL 的范式转变

- **Human-in-the-Loop (HITL)**：人类在每个微操作中参与决策 → 成为瓶颈（fracture point）
- **Human-on-the-Loop (HotL)**：人类在元维度进行系统级引导，Agent 自主运行内部反馈闭环
- 核心驱动力：Agent 的产出速度已超过人类逐行审查的能力极限

### 控制论基础

HotL 的理论根基来自控制论三大定律：

1. **阿什比必要多样性定律**（[[ashbys-law]]）：控制系统的多样性必须 ≥ 被控系统的多样性。Agent 产出的代码变更多样性远超人类认知极限 → 在代码层死磕必然失败
2. **康南特-阿什比定理**（Conant-Ashby Theorem）：任何优秀的调节者都必须是该系统的模型。人类必须深刻理解 Agent 系统如何运行
3. **内稳态（Homeostasis）**：Agent 系统多样性与人类能力之间达到动态平衡

### HotL 的三个支柱

1. **设计与配置**：定义成功标准、建立团队结构和流程、编码架构决策到 AGENTS.md
2. **衰减与放大**（[[attenuation-amplification]]）：用传感器过滤噪音，用指南放大人类影响力
3. **现地现物**（[[gemba-go-see]]）：定期降维回到微观层，用人类直觉校准控制模型

### 管理学类比

将 Agent SDLC 类比为组织管理：
- 管理者不审查每件事，但掌控整个系统
- 设计组织架构 → 配置 Agent 系统
- 目标管理 → 设定衡量标准
- 异常干预 → 阈值告警
- 规则边界 → 策略文件

### 与 Harness Engineering 的关系

HotL 中的"衰减与放大"机制正是 [[harness-engineering]] 的核心实践：
- 衰减 = Harness 过滤 Agent 输出（仪表盘、聚合报告）
- 放大 = Harness 传递人类策略（AGENTS.md、DESIGN_PRINCIPLES.md）
- 安全套件工程（Harness Engineering）= 为高多样性 Agent 系统构建稳固的控制框架

## Open Questions

- 如何量化 Agent 系统的"多样性"以便设计合适的衰减/放大策略？
- HotL 模式在小团队 vs 大型组织中的适用性差异？
- "现地现物"的频率和深度如何确定？过度审查 vs 放任之间的平衡点？

## Related

- [[ashbys-law]] — 必要多样性定律，HotL 的理论基础
- [[harness-engineering]] — Harness 工程，HotL 的技术实现
- [[attenuation-amplification]] — 衰减与放大，HotL 的核心控制机制
- [[gemba-go-see]] — 现地现物，HotL 的校准机制
- [[coding-agents]] — AI 编码 Agent，HotL 的控制对象
- [[agile]] — 敏捷方法论，HotL 管理学灵感来源之一
- [[loop-engineering]] — 循环工程是 HotL 的技术实现形式
