---
title: Codebase QnA
created: 2026-04-28
updated: 2026-04-28
type: concept
tags: [benchmark, agent, code-gen]
sources: [../../sources/articles/swe-atlas-github-2026.md]
---

# Codebase QnA

Codebase QnA（代码库问答）是一类 AI Agent 评测任务形式：给定一个真实代码库，让 Agent 通过探索代码回答关于架构、实现细节、行为的自然语言问题。

## 与传统代码基准的区别

传统基准（HumanEval、SWE-bench）要求 Agent 生成或修改代码。Codebase QnA 测试的是：
- 代码库导航与检索能力
- 多文件、跨层次理解
- 将代码知识转化为自然语言解释的能力

## SWE-Atlas 中的实现

../projects/swe-atlas.md 的 QnA 子基准包含 496 个任务，典型问题如：

> "Reader 开发服务器绑定哪个端口？架构是否使用多端口处理热重载和 API 调用？
> Redux 在初始加载时触发哪些 action？侧栏在不同屏幕宽度下的响应式设计逻辑是什么？"

Agent 需要：
1. 在 Docker 沙箱中探索 /app 目录下的真实仓库
2. 执行 bash 命令（grep、find、cat 等）寻找证据
3. 将答案写入 /logs/agent/answer.txt，用 `<<FINAL_ANSWER>>` 标签包裹
4. 不得修改仓库任何文件

## 评测

由 LLM Judge（Claude Opus 4.5）依据 rubrics.json 评分，属于开放式问答评测。

## 相关概念与实体

- ai-coding-benchmark.md — 上位概念
- ../projects/swe-atlas.md — 目前最大规模的 Codebase QnA 基准
- swe-bench.md — 侧重 bug 修复的互补基准
- [[ai-coding-benchmark]]
