---
title: Geoffrey Huntley
created: 2026-05-02
updated: 2026-05-02
type: entity
tags: [person, agent]
sources: [raw/articles/snarktank-ralph-github-2026.md]
confidence: medium
---

# Geoffrey Huntley

提出 **Ralph 模式**——用文件系统（git 历史、进度文件、PRD JSON）作为 AI 编码 Agent 的外部记忆，通过循环迭代完成大型任务。

## 核心理念

- 每轮迭代使用全新 AI 实例（避免 context 污染）
- 所有记忆外化到文件系统（可审计、不依赖模型）
- PRD 驱动任务分解，单故事粒度确保一轮可完成

原始文章：https://ghuntley.com/ralph/

## 相关页面

- [[ralph]] — 基于此模式的实现
- [[agent-loop-pattern]] — 该模式的抽象概念
- [[agent-context-management]] — 迭代隔离策略
