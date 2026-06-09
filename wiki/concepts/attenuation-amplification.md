---
title: 衰减与放大（Attenuation & Amplification）
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [cybernetics, control-theory, agent, harness-engineering]
sources: [../../sources/articles/cybernetics-human-on-the-loop-2026.md]
confidence: medium
---

## Summary

衰减（Attenuation）与放大（Amplification）是控制论中实现 [[human-on-the-loop]] 的两个核心机制。衰减 = 过滤 Agent 系统的高多样性输出，避免人类过载；放大 = 将人类的决策和策略规模化传递给 Agent 系统。

## Key Points

### 衰减（Attenuation）

通过过滤或聚合，降低 Agent 系统侧的多样性，使其在人类认知带宽内可控：

- **聚合报告**：将高频输出浓缩为仪表盘（代码质量趋势、Agent 任务成功率）
- **异常升级**：仅在预设阈值被触发时向人类告警（如测试成功率 < 98%）
- **自我管理**：促进 Agent 系统内部的局部自治（类似成熟敏捷团队无需管理层日常介入）

核心思想：人类不应该阅读 200 个 QA 日志，应该只看到"测试成功率跌破阈值"这一个信号。

### 放大（Amplification）

将人类侧的多样性规模化传递给 Agent 系统：

- **策略编码**：将架构决策和准入规则写入 AGENTS.md / DESIGN_PRINCIPLES.md
- **知识注入**：为 Agent 提供统一的业务领域或技术规范知识库
- **分布式控制**：将控制权分散给多个人类角色或平台工程团队
- **思维模型深化**：通过培训提升人类对系统整体状态的理解

核心思想：一个开发者编写的策略文件，通过注入所有 Agent 的上下文，将个人技术影响力放大百倍。

### 与 Harness Engineering 的关系

衰减与放大是 [[harness-engineering]] 的两个核心操作维度：
- Harness 的可观测性组件 = 衰减（dashboard, alerts, aggregation）
- Harness 的策略注入组件 = 放大（AGENTS.md, resolver, skill files）
- [[harness]] 本身就是衰减+放大的技术载体

### 康南特-阿什比定理的要求

找到合适的衰减与放大方法，要求人类对 Agent 系统拥有足够精确的模型（Conant-Ashby Theorem）。如果模型不准确，衰减可能过滤掉关键信号，放大可能传递错误策略。

## Open Questions

- 衰减过度（过滤掉关键信号） vs 衰减不足（信息过载）的最优平衡点？
- 放大策略的版本管理和 A/B 测试方法？
- 如何设计反馈机制让 Agent 系统自动调节衰减/放大参数？

## Related

- [[human-on-the-loop]] — 衰减与放大是 HotL 的核心控制机制
- [[ashbys-law]] — 必要多样性定律决定了为什么需要衰减/放大
- [[harness-engineering]] — Harness 工程是衰减/放大的技术实现
- [[harness]] — Harness 框架承载衰减/放大功能
- [[gemba-go-see]] — 现地现物验证衰减/放大是否有效
