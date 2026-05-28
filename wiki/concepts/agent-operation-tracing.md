---
title: Agent Operation Tracing
created: 2026-05-28
updated: 2026-05-28
type: concept
tags: [observability, harness-engineering, ai-agents, agent-architecture]
sources: [../../sources/articles/self-evolving-harness-arvin-xu.md]
confidence: medium
---

## Summary

Agent Operation Tracing 是 LobeHub 自研的 Agent 可观测性基础设施，为每次 Agent 执行生成完整的 Execution Snapshot（执行快照），是 Self-Evolving Harness 的核心构件。

## Key Points

### 为什么 Tracing 是 Self-Evolution 的前提

要让 Harness 改进自己，首先要让系统知道自己刚才发生了什么。没有可追溯的执行记录，Self-Evolution 就是空中楼阁。

### 行业困境

主流 Agent Framework 的 tracing 都是「后加」的：
- **LangChain**: callback 可选，忘了注册就丢 trace
- **CrewAI**: 事件监听器挂在事件总线上，事件丢失 = trace 断裂
- **OpenAI Agents**: 需要显式创建 trace，不自动传播
- **AG2**: middleware 可选安装，不装就零 tracing

根本原因：**所有 runtime 架构都没把 observability 当作一等公民。**

### LobeHub 的方案

状态机模型 + 单步执行原则：
```
执行 → [需要手动加 callback] → 产生 trace  (行业现状)
单步执行 → 自然产生 trace（run step = event boundary）  (LobeHub)
```

### Execution Snapshot 内容

每次 Agent 执行记录：
- 调用了哪个模型
- 每个 LLM 请求的 Token 消耗和 cache 命中率
- 每一步的类型（call_llm / call_tool）和耗时
- 执行总步数、总耗时、总成本
- 出错步骤和错误详情
- 单步执行时的 Context Engine 状态

### 价值

- **开发调试**: 可视化执行流程
- **生产环境**: 每次失败留下足够上下文，支持错误模式分析、上下文策略优化、新模型适配
- **Harness 进化**: Trace 是 Harness 的黑匣子，让问题可以回放、归因和比较

### 开源

[Agent Tracing 已在 LobeHub 主仓库开源](https://github.com/lobehub/lobehub/tree/canary/packages/agent-tracing)

## Related Pages

- [[self-evolving-harness]] — 理念框架
- [[harness-engineering]] — 工程实践
- [[harness]] — Harness 概念
- [[lobehub]] — 实现项目
- [[claude-code-session-management]] — Claude Code 的 session 管理（类似的可观测性需求）
