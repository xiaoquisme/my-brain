---
title: Harness Engineering — Case Studies & Frameworks
created: 2026-06-08
updated: 2026-06-08
type: concept
tags: [ai-agents, coding-agents, software-engineering, harness-engineering]
sources:
  - ../../sources/articles/martin-fowler-harness-engineering.md
  - ../../sources/articles/openai-harness-engineering.md
  - ../../sources/articles/anthropic-harness-design-long-running.md
  - ../../sources/articles/anthropic-effective-harnesses-long-running.md
  - ../../sources/articles/meta-harness-optimization.md
  - ../../sources/articles/meta-harness-library-jagtap.md
  - ../../sources/articles/2045925288908046570.md
  - ../../sources/articles/harness-engineering-car-harnesscard.md
related:
  - harness-engineering.md
  - car-framework.md
  - harnesscard.md
  - meta-harness.md
  - sandbox.md
  - ../people/justin-young.md
  - ../people/prithvi-rajasekaran.md
  - ../people/shashikant-jagtap.md
  - ../projects/claude-code-workflow.md
  - ../synthesis/agentic-rag-as-harness.md
---

## Summary

Real-world harness engineering implementations and formal frameworks. Covers OpenAI, Anthropic, LangChain case studies, the CAR decomposition model, HarnessCard reporting standard, sandbox architecture, and Meta-Harness automation. Companion to [[harness-engineering]] which covers core principles.

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

## Anthropic's Session Continuity Harness (Justin Young)

解决跨 context window 的连续性问题——agent 每次新会话都不记得之前做了什么：

- **两个失败模式**: Over-ambition（一次做太多，半途耗尽上下文）和 Premature completion（看到进度就宣布完成）
- **两阶段方案**: Initializer Agent（建立环境 + feature list + init.sh）→ Coding Agent（增量推进）
- **Feature List 作为合同**: JSON 枚举所有功能，agent 只改 `passes` 字段，不能删需求
- **每次只做一个功能**: 防止 context 耗尽，git commit 支持回滚
- **浏览器自动化测试**: 端到端验证比单元测试更能发现 bug
- **核心类比**: 本质上是人类团队的交接机制（handoff）搬到了 agent 世界

## LangChain Terminal Bench 2.0 Case Study

同一模型（GPT-5.2-Codex）仅修改 harness 即从 Top 30 跃升至 Top 5，四项改进：

1. **强制自验证**：中间件拦截 Agent 退出，必须自检
2. **环境预扫描**：启动注入环境信息，减少探索时间
3. **循环检测**：追踪跨迭代文件编辑
4. **推理三明治**（高→中→高）：平衡质量与延迟

## CAR Framework (He et al., 2026)

**Harness Engineering for Language Agents** (He et al., Alibaba-NTU, April 2026) proposes the **CAR decomposition** as a formal framework:

**H = ⟨C, A, R⟩** — Control, Agency, Runtime

### Control Layer (C)
Durable artifacts that shape behavior **before** action:
- Repository maps, AGENTS.md, tool descriptions
- System instructions, architecture rules
- Tests, linters, permission policies, success criteria
- **Key insight**: "Reliable agents are rarely bounded by prompt wording; they are often bounded by specifications"

### Agency Layer (A)
How the model is **allowed to act**:
- Action substrates (code execution, browser interaction)
- Planner-verifier or orchestrator-worker structures
- Reviewer roles and action space interfaces
- **Definition**: "The mediated action surface and delegation structure that the harness permits"

### Runtime Layer (R)
What happens as work **unfolds over time**:
- Context assembly, memory and compaction
- Checkpointing, retries, backtracking
- Approval flows, budgets, trace collection, replay support
- **Key insight**: "Many agent failures are runtime failures: stale state, brittle retry loops, overgrown context"

### Mini-Cases from Paper

**Repository Coding Agent**: Two systems share the same frontier model but differ:
- Control: Repository map, AGENTS.md, required tests, linter
- Agency: Shell access, file-edit surface
- Runtime: Progress file, retries, escalation logic

**Browser/Research Agent**: Same browsing model, different harness:
- Control: Source hierarchy, citation rules, note-taking format
- Agency: Search, browser, delegation surface
- Runtime: Scratchpads, branching traces, recovery

## HarnessCard Reporting Artifact

Also from He et al. (2026), **HarnessCard** is proposed as a lightweight reporting standard:

| Field | Priority | What to Disclose |
|-------|----------|------------------|
| Base model(s) | Required | Model name, version, decoding settings, finetuning |
| Control artifacts | Required | System instructions, AGENTS.md, repo maps, rules |
| Runtime policy | Required | Memory type, compaction, checkpointing, retries |
| Action substrate | Required | Tools, APIs, browser, code execution, MCP |
| Execution topology | Required | Single vs multi-agent, planner/verifier roles |
| Feedback stack | Required | Tests, graders, reflection prompts, human review |
| Governance layer | Required | Permissions, sandboxing, escalation rules |
| Observability | Required | Traces, replay, latency/cost logs |
| Evaluation protocol | Required | Task set, runs, success criteria |
| Release artifacts | Recommended | Prompts, tool specs, traces, configs |
| Known limitations | Recommended | Failure modes, safety concerns |

**Purpose**: Make agent claims comparable, auditable, and reproducible — like Model Cards but for the harness layer.

## Meta-Harness: Automated Harness Optimization

Meta-Harness (Lee et al. 2026) shifts harness engineering from manual craft to automated search:

- **Agent-as-optimizer**: A coding agent iteratively proposes, evaluates, and refines harness code via filesystem access to source, traces, and metrics
- **Raw execution traces are critical**: Full trace access (50%) dramatically outperforms scores-only (34.6%) — the proposer needs to see *why* things failed
- **Results**: +7.7 points over SOTA on text classification with 75% fewer tokens; discovered harnesses transfer across unseen models
- **Implication**: Manual harness engineering becomes the **seed** for automated search rather than the final product
- See [[meta-harness]] for full details

## Sandbox: The Server of the Harness Era

Sandbox 即沙箱，是 harness 的执行环境，类比于服务器在传统应用中的角色。详见 [[sandbox]]。

### Sandboxes Vs Servers

- 应用运行在服务器上：使用计算资源、写入文件系统、跨重启保持状态
- Harness 和 Sandbox 同样关系：harness 负责推理和调用工具，sandbox 提供隔离执行环境
- 两者可独立替换：swap either one independently and the system still works

### The State Question

什么让 harness 可重启？两个东西：

1. **Trajectory**（轨迹）：完整记录问了什么问题、做了什么 tool call、做了什么决策。**这是 harness 产生的最有价值的 artifact**。
2. **Local Data**（本地数据）：harness 在沙箱文件系统中创建的一切。

Together：Anthropic 称为 "decoupling the brain from the hands"——brain 是 harness，hands 是 sandbox。**Trajectory + sandbox 文件系统持久化 = 持久的 artifact，trajectory 是最重要的**。

### Who Controls the State

- **版本一**：labs 运营 managed harnesses，trajectories 住在 labs 的 session logs
- **版本二**：企业不允许那种 connectivity，sandbox 跑在客户的 cloud 里，状态留在客户基础设施（Daytona, E2B, Stripe Minions）
- **关键问题**：谁控制 trajectory？推理历史让 harness 的工作可复现、可审计、可改进

### 未来：Swarm

- 跨多个沙箱协调的团队，每个有自己的 trajectory 和 state
- Individual harnesses fail and restart. Sandboxes die and get reprovisioned. **The swarm keeps working**
- 已见雏形：Stripe Minions, Browserbase

## Visibility Gap

He et al. audit 63 harness-relevant works and find:
- **Academic papers** often leave harness as "hidden implementation residue"
- **Public engineering notes** (Anthropic, OpenAI) describe harness innovations not yet in papers
- Many reported "agent gains" may be **harness-sensitive** rather than purely model-driven

## Engineering Evolution (from CAR perspective)

```
Software Engineering → Prompt Engineering → Context Engineering → Harness Engineering
```

- **Prompt Engineering**: Wording of instructions (Control subset)
- **Context Engineering**: What information is provided (Control + Runtime subset)
- **Harness Engineering**: Full H = ⟨C, A, R⟩ layer

---
## Evidence Timeline

- **2026-04-07**: OpenAI Codex case study — 1M lines, zero handwritten code, 3 engineers in 5 months
- **2026-04-07**: Anthropic's multi-agent harness design — GAN-inspired generator-evaluator separation
- **2026-04-07**: Justin Young's session continuity harness — Initializer/Coding agent pattern
- **2026-04-07**: Meta-Harness — automated harness search outperforming manual engineering
- **2026-04-07**: LangChain Terminal Bench 2.0 case study
- **2026-04-23**: CAR Framework (Control, Agency, Runtime) from He et al. (Alibaba-NTU)
- **2026-04-23**: HarnessCard reporting artifact
- **2026-04-23**: Visibility Gap finding — audit of 63 works
- **2026-06-08**: Split from [[harness-engineering]] — case studies and frameworks consolidated here

## 相关页面

[[harness-engineering]], [[car-framework]], [[harnesscard]], [[meta-harness]], [[sandbox]], [[openai-codex-2026]], [[justin-young]], [[prithvi-rajasekaran]], [[shashikant-jagtap]], [[birgitta-bockeler]], [[martin-fowler]]
