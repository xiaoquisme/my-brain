---
title: AI Coding Benchmark
created: 2026-04-28
updated: 2026-04-28
type: concept
tags: [benchmark, agent, code-gen, testing]
sources: [../../sources/articles/swe-atlas-github-2026.md]
confidence: medium
---

# AI Coding Benchmark

AI 编程基准（AI Coding Benchmark）是用于评测 AI 代码生成/编程 Agent 能力的标准化测试集，是衡量 LLM 和 Agent 在真实软件工程任务上表现的核心工具。

## 主要评测维度

| 维度 | 代表基准 | 说明 |
|------|---------|------|
| Bug 修复 | swe-bench.md | 给定 GitHub issue，让 agent 修复 bug 并通过测试 |
| 代码问答 | ../projects/swe-atlas.md (QnA) | 深度代码库理解与自然语言问答 |
| 测试编写 | ../projects/swe-atlas.md (TW) | 为给定代码编写高覆盖率测试 |
| 代码补全 | HumanEval, MBPP | 填写函数实现 |
| 多语言 | MultiPL-E | 跨编程语言代码生成 |

## 评测方法演进

- 早期：单元测试通过率（pass@k），如 HumanEval
- 中期：端到端 bug 修复，如 SWE-bench（需运行真实测试套件）
- 现在：LLM-as-Judge + Rubric，允许评测开放性问答任务，如 codebase-qna.md

## LLM Judge 模式

../projects/swe-atlas.md 使用 Claude Opus 4.5 作为 judge，依据人工编写的 rubrics.json 对 agent 答案评分。这允许评测主观性更强、无法用程序验证的任务。

## 开放问题

- LLM judge 的评分稳定性和偏见问题
- 真实工程场景（多文件、长上下文）的评测成本
- 排行榜数据污染（训练数据泄漏）风险

## 相关概念

- codebase-qna.md — 代码库问答这一具体评测形式
- swe-bench.md — 影响力最大的同类基准之一
- [[codebase-qna]]
- [[swe-atlas]]