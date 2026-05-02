---
title: Agent Loop Pattern (循环迭代模式)
created: 2026-05-02
updated: 2026-05-02
type: concept
tags: [agent, code-gen]
sources: [sources/articles/snarktank-ralph-github-2026.md]
confidence: high
---

# Agent Loop Pattern

一种 AI 编码 Agent 架构：将大型任务拆分为独立子任务，每轮迭代启动一个**全新的 AI 实例**完成一个子任务，通过外部状态文件（而非 context 窗口）传递记忆，循环直到全部完成。

## 核心设计

```
┌─────────────────────────────────────────┐
│          外部状态（文件系统）              │
│  prd.json  progress.txt  git history    │
└──────────┬──────────────────┬───────────┘
           │ 读取              │ 读取
    ┌──────▼──────┐    ┌──────▼──────┐
    │ Iteration 1 │    │ Iteration 2 │  ... (最多 N 轮)
    │ 全新 context  │    │ 全新 context  │
    │ 完成 Story A  │    │ 完成 Story B  │
    └─────────────┘    └─────────────┘
```

## 关键权衡

| 选择 | 收益 | 代价 |
|------|------|------|
| 每轮清空 context | 避免长对话中的 context 污染和退化 | 无法利用前几轮的隐式学习 |
| 文件系统记忆 | 可审计、可调试、不依赖模型能力 | 需要精心设计格式，信息密度有限 |
| 单故事粒度 | 保证一轮可完成，降低出错率 | 无法处理跨故事依赖 |
| PRD 驱动 | 结构化进度追踪，人可介入 | PRD 质量决定上限 |

## 代表性实现

- **[[ralph]]** — `snarktank/ralph`，bash + prd.json，支持 Amp 和 Claude Code
- **Sweep AI** — 早期的 PRD→代码 Agent
- **Cursor / Windsurf Agent Mode** — 单次会话内的循环，但保留 context

## 与长 Context 策略的对比

Agent Loop（迭代隔离）vs. Context Management（长会话维护）是两种互补策略：

- **迭代隔离**：[[ralph]]、OpenClaw 的 bootstrap cap — 每轮从零开始
- **上下文维护**：[[claude-code-harness]] 的两层预读防护、[[letta-code]] 的 MemFS

实际最佳实践可能是两者结合：用 Agent Loop 处理宏观任务拆分，用 context 管理优化单轮执行质量。

## 相关页面

- [[ralph]] — 最典型的实现
- [[agent-context-management]] — 迭代隔离 vs. 上下文维护的对比
- [[coding-agents]] — 更广泛的 AI 编码 Agent 概念
- [[harness]] — Agent 运行时框架
