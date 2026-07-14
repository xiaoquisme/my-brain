---
title: Harness Engineering
created: 2026-04-07
updated: 2026-07-08
type: concept
tags: [ai-agents, coding-agents, software-engineering, quality]
sources:
  - ../../sources/articles/lilian-weng-harness-self-improvement-2026.md
  - ../../sources/articles/martin-fowler-harness-engineering.md
  - ../../sources/articles/yuanchaofa-harness-engineering.md
  - ../../sources/articles/hermes-harness-metaphor.md
related:
  - coding-agents.md
  - agentic-patterns.md
  - meta-harness.md
  - ashbys-law.md
  - llm-wiki-pattern.md
  - harness-engineering-case-studies.md
  - ../people/birgitta-bockeler.md
  - ../people/martin-fowler.md
  - ../people/chaofa-yuan.md
  - ../people/jinse-chuanshuo-dacongrming.md
  - claude-code-session-management.md
  - reasoning-shift.md
  - sandbox.md
  - skillify.md
  - thin-harness-fat-skills.md
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

## Engineering Hierarchy (Chaofa Yuan)

Prompt Engineering → Context Engineering → Harness Engineering 是递进扩展关系：

- **Prompt Engineering**：聚焦指令措辞
- **Context Engineering**：管理整个输入窗口（what goes into the context）
- **Harness Engineering**：控制执行环境和系统约束（everything outside model weights）

## Transient vs Persistent Harness

并非所有 harness 设计都具有同等寿命：

- **Transient**：补偿当前模型局限的设计（如强制自验证、推理三明治），模型进步后可能过时
- **Persistent**：物理约束驱动的架构决策（持久存储、沙箱、版本控制），与模型能力无关

## Harness-Model Co-evolution

Harness 执行轨迹成为训练数据 → 模型改进 → harness 可简化 → 新轨迹 → 持续共同演化。这与 Anthropic 观察到的"模型越强，harness 越简"一致（Opus 4.6 移除了 sprint 分解）。

## Practical Implications

This directly relates to how we set up this knowledge base:
- `CLAUDE.md` = a **guide** (feedforward control)
- The maintain/lint workflow = a **sensor** (feedback control)
- The schema constrains the solution space (Ashby's Law)

## Open Questions

- How to measure harness coverage and quality?
- How to resolve conflicts between contradictory guidance signals?
- What does a good behaviour harness look like beyond tests?
- Can automated harness search (Meta-Harness) work for open-ended tasks where evaluation is harder?

---
## Evidence Timeline

- **2026-04-07**: Compiled from Birgitta Böckeler's article on martinfowler.com (published 2026-04-02)
- **2026-04-07**: Added Chaofa Yuan's engineering hierarchy (prompt → context → harness), transient vs persistent harness distinction, harness-model co-evolution
- **2026-06-08**: Split case studies, frameworks, and sandbox sections into [[harness-engineering-case-studies]]

## 相关页面

[[harness-engineering-case-studies]], [[car-framework]], [[harnesscard]], [[llm-wiki-pattern]], [[meta-harness]], [[sandbox]], [[skillify]], [[curator]], [[birgitta-bockeler]], [[martin-fowler]], [[jinse-chuanshuo-dacongrming]], [[self-evolving-harness]], [[agent-operation-tracing]]
- [[agentic-patterns]], [[ashbys-law]], [[claude-opus-4-7]], [[thin-harness-fat-skills]], [[coding-agents]]
- [[human-on-the-loop]], [[attenuation-amplification]], [[gemba-go-see]]
- [[loop-engineering]], [[factory-model]]
- [[agents-md-best-practices]]
- [[govctl]] — 从治理制品（RFC/ADR）角度切入 AI Agent 治理
- [[lilian-weng]] — 2026 年最全面的 Harness Engineering 综述，将 harness 与 RSI 联系
