---
title: Latent vs Deterministic
created: 2026-04-23
updated: 2026-04-23
type: concept
tags: [ai-agents, architecture, system-design]
sources: [../../sources/articles/thin-harness-fat-skills.md]
confidence: medium
related: [thin-harness-fat-skills.md, harness.md, skill-file.md]
---

## Summary

系统中的每一步要么是 **Latent**（潜在空间，模型判断），要么是 **Deterministic**（确定性，相同输入相同输出）。好的架构把正确的工作放在正确的层级。

## Key Points

### 两种空间

| 维度 | Latent Space | Deterministic |
|------|--------------|---------------|
| 特点 | 判断、综合、模式识别 | 相同输入 → 相同输出 |
| 信任 | 概率性 | 可靠 |
| 工具 | LLM | SQL、代码、数字 |
| 适用 | 需要理解、推理 | 需要精确、可重复 |

### 经典例子

> "LLM 可以给 8 个人安排座位。让它安排 800 人，它会生成一个看起来合理但完全错误的座位表。"

这是把 **确定性问题**（座位安排算法）强行塞进 **潜在空间**（模型猜测）。

### 架构原则

```
Fat Skills（顶层）     → Latent: 判断、流程、领域知识
Thin Harness（中间层） → 混合: 路由、调度
Your App（底层）       → Deterministic: DB、搜索、时间线
```

- 智能 **向上** 推入 Skills（latent）
- 执行 **向下** 推入确定性工具（deterministic）
- 保持 Harness 精简

### Skill 中的混合

一个 Skill 文件可能同时包含：
- **Latent 步骤**：阅读文档、综合分析、做出判断
- **Deterministic 步骤**：调用 CLI、查询数据库、计算指标

关键是把每一步放在正确的空间。

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 定义

## 相关页面

[[thin-harness-fat-skills]], [[harness]]
