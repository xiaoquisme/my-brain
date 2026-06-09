---
title: 现地现物（Gemba / Go See）
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [agent, coding-agents, cybernetics, software-engineering]
sources: [../../sources/articles/cybernetics-human-on-the-loop-2026.md]
confidence: medium
---

## Summary

现地现物（Gemba / Go See，日语 Genchi Genbutsu）是精益管理实践，要求管理者亲临生产一线。在 Agent SDLC 中，它意味着工程师必须定期从元维度"降维"回到微观代码层，用人类直觉校准控制模型——这是 [[human-on-the-loop]] 系统中不可或缺的次级反馈闭环。

## Key Points

### 核心概念

- **Gemba**（现场/源头）= 创造价值的实际场所，在 Agent SDLC 中 = Agent 与代码/仓库交互的微观世界
- **Go See**（Genchi Genbutsu）= 管理者离开象牙塔，深入生产一线
- 在 Agent 语境：工程师不能完全依赖仪表盘和策略文件，必须定期亲自审查 Agent 产出

### 为什么需要现地现物

- LLM 可能生成表面完美但实际低效的代码（通过所有测试但数据结构选择不当）
- 自动化传感器（衰减机制）可能过滤掉关键信号
- 代码退化（Code Decay）和隐性幻觉（Hallucinations）难以被自动化工具捕获
- 控制模型需要持续校准才能保持准确（Conant-Ashby Theorem）

### 实践方式

- **定期抽样审查**：如每周五随机挑选 3 个复杂 PR 进行深度手动审查
- **识别未知失败模式**：用工程直觉发现自动化工具无法检测的问题
- **校准控制模型**：发现问题后更新策略文件、调整 Agent 流水线设计

### 双环学习

现地现物本质上是组织学习理论中的**双环学习（Double-loop Learning）**：
- 单环学习：在现有策略下优化执行
- 双环学习：质疑并修正策略本身
- 现地现物 = 发现策略失效 → 修正 Harness 配置 → 更新控制模型

### 与衰减的关系

传感器通过聚合和过滤来"衰减"多样性，而现地现物刻意**逆转**这一过程——让人重新直面微观现实。这是设计上的张力：既要减少噪音（衰减），又要保持对真相的感知（现地现物）。

## Open Questions

- 现地现物的最优频率？过于频繁 = 回退为 HITL，过于稀少 = 失去校准价值
- 如何选择抽样策略？随机抽样 vs 高风险区域重点抽样
- 如何将现地现物发现的模式系统化反馈到 Agent 策略中？

## Related

- [[human-on-the-loop]] — 现地现物是 HotL 的校准机制
- [[attenuation-amplification]] — 现地现物逆转衰减过程
- [[harness-engineering]] — 发现问题后改进 Harness 配置
- [[coding-agents]] — 现地现物的审查对象
