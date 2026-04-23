---
title: Skill File
created: 2026-04-23
updated: 2026-04-23
tags: [ai-agents, skills, architecture]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [thin-harness-fat-skills.md, harness.md, resolver.md]
---

## Summary

Skill File 是可复用的 Markdown 流程文件，教 AI 模型 **HOW** 做某事（而非 WHAT）。它像方法调用一样工作：相同流程，不同参数产生不同能力。

## Key Points

### 核心特性

- **参数化**：像函数调用，接受参数产生不同输出
- **Markdown 即代码**：用模型能理解的语言描述流程和判断
- **可复用**：同一技能可用于完全不同场景
- **可进化**：通过 `/improve` 技能自动改写自身

### Skill File vs 传统代码

| 维度 | Skill File | 传统代码 |
|------|------------|----------|
| 语言 | Markdown（模型原生理解） | Python/TS 等 |
| 描述 | 流程、判断、上下文 | 逻辑、数据结构 |
| 运行时 | 模型的 latent space | CPU/GPU |
| 适应性 | 根据参数和上下文调整 | 固定逻辑 |

### 示例：/investigate 技能

```
参数：TARGET, QUESTION, DATASET

七步流程：
1. 确定数据集范围
2. 构建时间线
3. 为每份文档做 diarization
4. 综合分析
5. 正反论证
6. 引用来源
7. 输出结论
```

**同一技能的两种调用：**
- 调用 A：调查 Dr. Sarah Chen + 210 万封邮件 → 医学研究分析
- 调用 B：调查 Pacific Corp + FEC 文件 → 法务取证

### Garry Tan 的规则

> "你不能做一次性工作。如果你让我做某事，而这类事情会再次发生，你必须：第一次手动做 3-10 个项目。展示输出。如果我批准，就编码成技能文件。如果应该自动运行，就放到 cron 上。"
>
> "测试：如果我不得不问你两次，你就失败了。"

### 与其他概念的关系

- **Harness** 加载并执行 Skills
- **Resolver** 决定何时加载哪个 Skill
- Skills 中的 latent 步骤依赖模型判断力
- Skills 中的 deterministic 步骤调用 CLI 工具

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 定义
