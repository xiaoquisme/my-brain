---
title: AGENTS.md 最佳实践
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [agent, coding-agents, context-management, harness-engineering]
sources: [../../sources/articles/agents-md-osmani-2026.md]
confidence: medium
---

## Summary

AGENTS.md 应该只包含 Agent 无法自行发现的信息（工具陷阱、非显而易见的约定、地雷）。自动生成的 AGENTS.md（通过 /init）因冗余而降低性能、增加 20%+ 成本。最佳心智模型：AGENTS.md 是你尚未修复的代码库异味的活清单，而非永久配置。

## Key Points

### 研究证据

两项 2026 年研究得出看似矛盾实则互补的结论：

- **Lulla et al. (ICSE JAWs 2026)**：人工编写的 AGENTS.md 减少 28.64% 运行时间、16.58% token 消耗（124 个 GitHub PR 实验）
- **ETH Zurich**：LLM 生成的 context 文件降低 2-3% 成功率、增加 20%+ 成本；人工编写的提升 4% 成功率但增加 19% 成本

关键发现：LLM 生成的内容不是无用，而是**冗余**——Agent 本来就能通过读代码发现这些信息。给两遍 = 增加噪音。

### 什么值得写进 AGENTS.md

过滤标准：Agent 能通过读代码自己发现吗？能 → 不写。

值得写的：
- 工具选择（用 `uv` 不用 `pip`）
- 测试陷阱（`--no-cache` 避免 fixture 假阳性）
- 非标准模式（自定义 middleware，不要重构为标准 Express）
- 地雷（`legacy/` 目录已废弃但被 3 个生产模块引用）

不值得写的：
- 目录结构（Agent 第一次 ls 就能发现）
- 技术栈描述（README 里有）
- 代码库概述（Agent 自己能读）

### 粉色大象问题（锚定效应）

AGENTS.md 中提到的任何内容都会成为 Agent 每次 prompt 的上下文。如果提到 tRPC 但只用于遗留端点 → Agent 被锚定到错误模式。LLM 不区分"过去用的"和"应该用的"。

### 三层架构

单体 AGENTS.md 不够，需要分层：

1. **Protocol file（协议文件）**：路由文档——可用 persona、skills、MCP 连接、Agent 真正无法发现的最少必要事实
2. **Focused persona/skill files（聚焦文件）**：按任务类型选择性加载。UX Agent 和 Backend Agent 加载不同上下文
3. **Maintenance subagent（维护子 Agent）**：唯一职责是保持协议文件准确。文档会腐烂

### AGENTS.md 作为诊断工具

每条指令都是 Agent 在代码库中遇到困惑的信号——可能对新的人类贡献者也同样困惑。正确响应不是增长 context 文件，而是修复底层问题。

实践方法：从几乎空白开始，只加一条："遇到令人惊讶或困惑的地方，用 comment 标记。"修复底层问题，保持文件最小化。

### 自动化优化

Arize AI 的 prompt learning：用自动化优化循环代替手动写 CLAUDE.md——运行 Agent → 评估输出 → LLM 反馈失败原因 → 元 prompting 优化指令。结果：+5.19% 跨仓库准确率，+10.87% 仓库内准确率。

核心洞察：帮助人类理解代码库 vs 帮助 LLM 导航代码库，往往是不同的东西。

## Open Questions

- 三层架构在实际工具中如何实现？目前无主流 Agent 暴露 lifecycle hooks 支持此模式
- AGENTS.md 的"半衰期"有多长？模型进步多快使当前指令过时？
- 自动化优化（Arize 方式）能否取代人工编写？

## Related

- [[agent-context-management]] — AGENTS.md 是 context 管理的一部分
- [[harness-engineering]] — AGENTS.md 属于 harness 的 guide 层
- [[resolver]] — Resolver 决定何时加载哪个上下文，三层架构的路由层
- [[skill-file]] — 三层架构中的 Layer 2（聚焦 skill 文件）
- [[loop-engineering]] — 维护子 Agent（Layer 3）是循环的一个实例
- [[addy-osmani]] — 文章作者
