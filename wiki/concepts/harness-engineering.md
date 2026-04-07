---
title: Harness Engineering
created: 2026-04-07
updated: 2026-04-07
tags: [ai-agents, coding-agents, software-engineering, quality]
sources:
  - ../../sources/articles/martin-fowler-harness-engineering.md
  - ../../sources/articles/openai-harness-engineering.md
  - ../../sources/articles/anthropic-harness-design-long-running.md
related:
  - coding-agents.md
  - ashbys-law.md
  - llm-wiki-pattern.md
  - ../people/birgitta-bockeler.md
  - ../people/martin-fowler.md
---

## Summary

Harness engineering is the practice of building systematic controls around AI coding agents — everything in an agent setup except the model itself. It uses feedforward controls (guides) to steer behavior before code generation, and feedback controls (sensors) to monitor and correct after generation.

## Key Points

- **Agent = Model + Harness** — harness is everything except the model itself
- **Guides (Feedforward)**: CLAUDE.md, prompts, architecture docs, coding standards — steer the agent before it acts
- **Sensors (Feedback)**: Tests, linters, type checkers, code review agents — validate after action
- **Both are needed**: Feedback-only → repeated errors; feedforward-only → no validation
- **Computational vs Inferential**: Deterministic checks (tests/lints) are fast and reliable; AI-based checks (code review agents) are richer but probabilistic
- **Three dimensions**: Maintainability (code quality), Architecture Fitness (system properties), Behaviour (correctness) — behaviour is hardest
- **Timing matters**: Shift checks left (pre-commit > pre-integration > pipeline > monitoring)
- **Harnessability**: Strong types, clear module boundaries, framework abstractions make codebases more agent-tractable
- **Ashby's Law applied**: Constrain the solution space (e.g., predefined service topology) to make comprehensive harnesses feasible

## OpenAI's Codex Case Study

OpenAI 用 Codex 在 5 个月内构建了 100 万行代码的生产系统，零行人工代码：

- **3 名工程师**, 1,500+ PR, 平均每人每天 3.5 个 PR，约为手动的 10 倍效率
- **三大支柱**: Context Engineering（上下文工程）、Architectural Constraint Enforcement（架构约束执行）、Custom Linters & Feedback（自定义反馈）
- **依赖层强制执行**: Types → Config → Repo → Service → Runtime → UI
- **Linter 错误信息为 agent 编写**: 注入修复指令到 agent 上下文
- **定期"垃圾收集"**: 扫描架构漂移，让 agent 建议修复
- **Without good harness → "AI slop"**: 语法正确但违反架构不变性的代码

## Anthropic's Multi-Agent Harness Design

Anthropic 的实践：用 GAN 式的 Generator-Evaluator 分离来解决长时间任务：

- **核心问题**: 自我评估偏差（agent 过度赞美自己）+ 上下文焦虑（context anxiety）
- **三个 Agent**: Planner（规划）→ Generator（生成）→ Evaluator（评估，用 Playwright 功能测试）
- **GAN 式反馈循环**: 评估器偏向怀疑，通过迭代 prompt 调优
- **成本-质量权衡**: Retro Game Maker — $9/20min（功能破损） vs $200/6h（精致完整），20x 成本但质的飞跃
- **关键洞察**: 模型能力提升 → harness 可以简化（Opus 4.6 移除了 sprint 分解）
- **标准措辞影响输出**: "museum quality" 直接改变了设计方向

## Practical Implications

This directly relates to how we set up this knowledge base:
- `CLAUDE.md` = a **guide** (feedforward control)
- The maintain/lint workflow = a **sensor** (feedback control)
- The schema constrains the solution space (Ashby's Law)

## Open Questions

- How to measure harness coverage and quality?
- How to resolve conflicts between contradictory guidance signals?
- What does a good behaviour harness look like beyond tests?

---
## Evidence Timeline

- **2026-04-07**: Compiled from Birgitta Böckeler's article on martinfowler.com (published 2026-04-02)
- **2026-04-07**: Updated with OpenAI's Codex case study — 1M lines, zero handwritten code, 3 engineers in 5 months
- **2026-04-07**: Updated with Anthropic's multi-agent harness design — GAN-inspired generator-evaluator separation for long-running tasks
