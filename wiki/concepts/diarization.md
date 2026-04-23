---
title: Diarization
created: 2026-04-23
updated: 2026-04-23
tags: [ai-agents, knowledge-work, analysis]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [thin-harness-fat-skills.md, skill-file.md, latent-vs-deterministic.md]
---

## Summary

Diarization 是让模型读取关于某个主题的所有内容，然后输出结构化摘要。读 50 份文档，产出 1 页判断。这是 AI 在真实知识工作中发挥价值的关键能力。

## Key Points

### 定义

> "模型读取关于某个主题的所有内容，编写结构化档案。读 50 份文档，产出 1 页判断。"

### 为什么 RAG 做不到

- SQL 查询无法产生这种输出
- RAG 管道无法产生这种输出
- 模型必须真正阅读、在心中保持矛盾、注意变化的时间点、编写结构化情报

### 核心能力

1. **跨文档综合** - 同时持有多个信息源
2. **矛盾检测** - 注意不同来源的冲突
3. **时间线追踪** - 发现什么在什么时候变化
4. **"说的" vs "做的"** - 对比声明与实际行为

### YC Startup School 示例

```
FOUNDER: Maria Santos
COMPANY: Contrail (contrail.dev)
SAYS: "Datadog for AI agents"
ACTUALLY BUILDING: 80% of commits are in billing module.
  She's building a FinOps tool disguised as observability.
```

这种洞察需要同时阅读：
- GitHub commit 历史
- 申请表
- 导师 1:1 谈话记录

没有嵌入能捕捉这种重新分类。没有算法能做到。模型必须阅读整个档案。

### Diarization 的应用模式

```
retrieve → read → diarize → count → synthesize
     ↓
  survey → investigate → diarize → rewrite skill
```

这个模式在每个领域都适用：
- YC 创始人分析
- 医学研究综述
- 法务取证
- NPS 调查分析

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 定义
