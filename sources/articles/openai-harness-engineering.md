---
title: "Harness Engineering: Leveraging Codex in an Agent-First World"
url: https://openai.com/index/harness-engineering/
date_added: 2026-04-07
type: article
tags: [harness-engineering, coding-agents, openai, codex, architecture]
author: OpenAI
published: 2026-02
---

OpenAI 内部团队的实践报告：用 Codex agent 在 5 个月内构建了一个 100 万行代码的生产系统，**零行人工编写代码**。

## 核心数据

- 3 名工程师，1,500+ 合并的 PR，平均每人每天 3.5 个 PR
- 100 万行代码，全部由 AI 生成，人类审查
- 大约是手动编码所需时间的 1/10
- 第一次 commit 在 2025 年 8 月末

## 关键定义

> Agent = Model + Harness

Harness = AI agent 中模型之外的一切。没有好的 harness，agent 产出"AI slop"——语法正确但违反架构不变性、重复逻辑、悄悄降低可维护性的代码。

## 三大支柱

### 1. Context Engineering（上下文工程）
- 仓库结构为 agent 可读性优化，不仅为正确性
- 维护结构化文档目录：系统地图、执行计划、设计规范
- 文档即基础设施（single source of truth）

### 2. Architectural Constraint Enforcement（架构约束执行）
- 强制执行的依赖层序列：Types → Config → Repo → Service → Runtime → UI
- Agent 限制在这些层内操作
- 结构测试验证合规性，防止模块分层违规

### 3. Custom Linters & Feedback（自定义 Linter 和反馈）
- 自定义 linter 和结构测试来执行规则
- 关键：linter 的错误信息专门为 agent 编写，注入修复指令到 agent 上下文
- 定期"垃圾收集"扫描漂移，让 agent 建议修复

## 开发者角色转变

从写代码 → 设计环境、指定意图、构建反馈循环：
- 设计开发环境
- 指定系统意图
- 提供结构化反馈
- 审查 agent 迭代

## 相关文章

- [Unlocking the Codex harness: how we built the App Server](https://openai.com/index/unlocking-the-codex-harness/) (2026-02-04)
