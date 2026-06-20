---
title: HarnessX
created: 2026-06-20
updated: 2026-06-20
type: concept
tags: [harness-engineering, self-evolution, agent, reinforcement-learning, multi-agent, benchmark]
sources: [../../sources/articles/harnessx-agent-harness-foundry.md]
confidence: high
---

## Summary

HarnessX 是小米 Darwin Agent Team 提出的 Agent Harness 工厂（foundry），将 harness 视为可组合、可适应、可进化的一等公民对象。核心创新：九维处理器分类 + 替换代数实现类型安全组合，AEGIS 多 Agent 进化引擎实现 trace 驱动的自动优化，cross-harness GRPO 实现 harness 与模型协同进化。5 个 benchmark 上平均提升 +14.5%，最高 +44.0%。

## Key Points

### 三大设计原则

1. **可组合（Composable）**：Harness 原语通过类型化接口组装，替换代数保证类型安全。改一个组件不会炸其他部分。
2. **可适应（Adaptive via AEGIS）**：trace 驱动的多 Agent 进化引擎，把 harness 适配映射为 RL 问题。
3. **协同进化（Co-Evolution）**：cross-harness GRPO 将 harness 进化与模型训练交织，共享 replay buffer。

### 九维处理器分类

Harness 配置 H = (c₁, c₂, ..., c₉)：
1. Model Selection — 模型选择与采样参数
2. Context Assembly — prompt 模板与系统指令
3. Memory Management — 暂存器、长期记忆、检索
4. Tool Ecosystem — 工具定义、包装器、schema
5. Execution Environment — 沙箱与资源限制
6. Evaluation and Reward — 验证器与奖励塑形
7. Control and Safety — 护栏与审批门控
8. Observability — 日志、追踪、指标
9. Training Bridge — replay buffer 与训练信号提取

### AEGIS 四阶段流水线

1. **Digester**：压缩原始 trace（~10M tokens → ~10K tokens 结构化摘要），识别失败集群
2. **Planner**：综合失败分析，生成适配假设与编辑提案
3. **Evolver**：实现具体 harness 修改，生成变更清单
4. **Critic**：评估候选编辑，seesaw 约束（不允许任何任务回归）门控发布

### Operational Mirror（操作镜像）

将符号化的 harness 适应映射到标准 RL 构造：

| 符号域 | RL 域 |
|---|---|
| Harness 配置 H | 状态 |
| Harness 编辑 e: H→H | 动作 |
| 任务成功率 | 奖励 |
| 编辑序列 | 策略轨迹 |
| Trace 日志 | 经验 |

三种 RL 病理在符号空间的具体表现：
- **Reward hacking**：编辑利用验证器格式规律而非真正解决问题
- **Catastrophic forgetting**：改善一个任务集群导致另一个退化
- **Under-exploration**：重复在同一邻域（如仅调 prompt）编辑直至穷尽

### Cross-Harness GRPO

关键洞察：同一任务的所有轨迹（不论来自哪个 harness 版本或模型 checkpoint）组成一个 GRPO 组。组内变异反映策略差异而非采样噪声。

- **Task-level alignment**（非 action-level）：不同 harness 版本的不兼容动作空间在同一组内共存无冲突
- **Off-policy 训练**：replay buffer 中混合多版本策略，FIFO 淘汰限制版本偏差
- **零额外 rollout 成本**：同一套轨迹同时驱动 AEGIS 和 GRPO，模型训练不产生新 rollout

### 实验结果

| Benchmark | 最弱 Agent 提升 | 最强 Agent 提升 |
|---|---|---|
| ALFWorld | Qwen3.5-9B: **+44.0%** | Sonnet 4.6: +11.2% |
| WebShop | Qwen3.5-9B: +13.0% | GPT-5.4: +18.0% |
| GAIA | Qwen3.5-9B: +17.1% | Sonnet 4.6: +9.7% |
| SWE-bench | Qwen3.5-9B: +18.2% | Sonnet 4.6: +10.9% |
| τ³-Bench | GPT-5.4: +14.5% | Qwen3.5-9B: +1.1% |

**Inverse scaling**：基线越弱的 Agent 提升越大。说明 harness 进化主要弥补模型自身无法纠正的行为缺陷。

**协同进化额外增益**：GAIA +4.3%, WebShop +5.0%, 平均 +4.7%（超越仅 harness 进化）。

**Variant isolation**：GAIA GPT-5.4 在 Global 策略下停滞（Δ=0.0），切换到 Ensemble 策略后提升至 +13.6% 且不退化。

### 失败案例分析

三个病理各一个案例，均被 AEGIS 检测并自我修正：
1. GAIA R10 reward hacking → R12 自修正
2. τ³-Bench Telecom R7 catastrophic forgetting → R9 自修正
3. ALFWorld R4-R7 under-exploration → 通过 ship-prediction accuracy 下降诊断

## Connections

- [[harness]] — Harness 基础概念
- [[self-evolving-harness]] — HarnessX 是自进化 harness 的最完整理论框架
- [[meta-harness]] — Meta-Harness 只搜索 harness 配置；HarnessX 同时协同进化模型
- [[autoresearch]] — HarnessX 实现了 autoresearch 的"harness × model × verifiable loop"
- [[harness-engineering]] — HarnessX 是 harness 工程的最新里程碑
- [[car-framework]] — HarnessX 的九维分类扩展了 CAR 的三维分解
- [[evo]] — Evo 是开源 autoresearch orchestrator，思路相近
- [[coding-agents]] — SWE-bench 是五大 benchmark 之一

## Open Questions

- 代码何时开源？论文承诺 "future release"
- 能否扩展到更大规模任务集（目前 55-134 tasks）
- Meta-agent 是否必须用 Opus 级别模型？能否用更小模型？
- Per-edit gating 对 sub-threshold coupling 的结构性盲区如何解决？
- 在开放式任务（无自动验证器）上能否工作？

---

## Evidence Timeline

- **2026-06-12**: 论文发布（arXiv:2606.14249），Darwin Agent Team（小米），5 benchmark 平均 +14.5%，最高 +44.0%
