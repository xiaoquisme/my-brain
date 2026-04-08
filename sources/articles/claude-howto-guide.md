---
title: "Claude How To - Master Claude Code in a Weekend"
url: https://github.com/luongnv89/claude-howto
date_added: 2026-04-07
type: article
tags: [claude-code, coding-agents, tutorial, tool-use, harness-engineering]
author: luongnv89
---

一个结构化的、视觉驱动的 Claude Code 完全指南。5,900+ stars，GitHub Trending #1。从基础到高级，包含可复制的模板。

## 核心定位

官方文档是功能参考，这个指南是**教程**：有 Mermaid 图、生产级模板、渐进学习路径。

## 10 个教程模块

| 顺序 | 模块 | 级别 | 时间 |
|------|------|------|------|
| 1 | Slash Commands | Beginner | 30 min |
| 2 | Memory | Beginner+ | 45 min |
| 3 | Checkpoints | Intermediate | 45 min |
| 4 | CLI Basics | Beginner+ | 30 min |
| 5 | Skills | Intermediate | 1h |
| 6 | Hooks | Intermediate | 1h |
| 7 | MCP | Intermediate+ | 1h |
| 8 | Subagents | Intermediate+ | 1.5h |
| 9 | Advanced Features | Advanced | 2-3h |
| 10 | Plugins | Advanced | 2h |

总学习时间：11-13 小时。15 分钟可以获得即时价值。

## Claude Code 功能对比

| Feature | 调用方式 | 持久性 | 最适合 |
|---------|---------|--------|--------|
| Slash Commands | 手动 `/cmd` | 会话内 | 快捷操作 |
| Memory | 自动加载 | 跨会话 | 长期学习 |
| Skills | 自动调用 | 文件系统 | 自动化工作流 |
| Subagents | 自动委派 | 隔离上下文 | 任务分发 |
| MCP Protocol | 自动查询 | 实时 | 实时数据访问 |
| Hooks | 事件触发 | 配置 | 自动化和验证 |
| Plugins | 一条命令 | 所有功能 | 完整解决方案 |
| Checkpoints | 手动/自动 | 会话级 | 安全实验 |

## 实际用例

- 自动化代码审查：Slash Commands + Subagents + Memory + MCP
- 团队入职：Memory + Slash Commands + Plugins
- CI/CD 自动化：CLI + Hooks + Background Tasks
- 文档生成：Skills + Subagents + Plugins
- 安全审计：Subagents + Skills + Hooks（只读模式）
- 复杂重构：Checkpoints + Planning Mode + Hooks

## 关键洞察

- Claude Code 的真正力量在于**组合功能**，而不是单独使用
- Skills 是自动调用的可重用能力（vs Slash Commands 是手动调用的快捷方式）
- Hooks 是事件驱动的自动化（类似 git hooks 的概念）
- Subagents 在隔离上下文中运行，适合任务分发
- Memory 跨会话持久化，是长期学习的基础
