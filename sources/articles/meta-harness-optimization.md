---
title: "Meta-Harness: End-to-End Optimization of Model Harnesses"
url: https://arxiv.org/abs/2603.28052
date_added: 2026-04-07
type: paper
authors: [Yoonho Lee, Roshen Nair, Qizheng Zhang, Kangwook Lee, Omar Khattab, Chelsea Finn]
tags: [harness-engineering, optimization, ai-agents, automated-search]
---

## 摘要

LLM 系统的性能取决于"harness"设计——即管理信息存储、检索和呈现给模型的代码。Meta-Harness 通过一个基于 agent 的搜索系统来自动化这一设计过程，迭代地提出、评估和优化 harness 实现。

## 核心概念：什么是 Harness？

Harness 是"决定存储什么、检索什么、展示什么给模型的代码"。例如：prompt 构建逻辑、检索策略、记忆管理、工具编排。在相同基准测试和冻结模型权重的条件下，harness 设计可以导致高达 6 倍的性能差异。

## Meta-Harness 方法

一个 agent 式的提议者（Claude Code + Opus 4.6）通过文件系统接口访问源代码、评估指标和执行历史。与之前将反馈压缩为标量分数或摘要的文本优化方法不同，Meta-Harness 实现了"对原始诊断经验的选择性访问"。

每个评估周期产生多达 1000 万 token 的诊断信息——大约是之前文本优化方法的三个数量级。提议者每次迭代中位数读取 82 个文件（约 41% 源代码，约 40% 执行轨迹）。

核心设计原则："将诊断和编辑决策交给提议者，而不是硬编码搜索启发式规则，Meta-Harness 可以随着编码 agent 能力的提升而自动改进。"

## 实验结果

### 在线文本分类（LawBench、Symptom2Disease、USPTO-50k）
- 平均准确率 48.6%，比 ACE 高出 7.7 个百分点
- 上下文 token 用量减少 4 倍（11.4K vs 50.8K）
- 评估次数比最佳文本优化器少 10 倍
- 在 9 个分布外数据集上泛化，平均准确率 73.1%

### 检索增强数学推理（200 道 IMO 级别题目）
- 在 5 个未见模型上比无检索基线平均提高 4.7 个百分点
- 发现了基于学科的路由策略（组合数学、几何、数论、代数），使用 BM25 检索

### TerminalBench-2 Agent 编码（89 个任务）
- Claude Opus 4.6 通过率 76.4%（总排名第 2）
- Claude Haiku 4.5 通过率 37.6%（Haiku agent 中排名第 1）
- 关键发现：环境引导——在 agent 开始前注入系统快照，减少 2-4 轮探索

## 消融实验：接口设计很重要

文本分类任务上不同提议者接口的对比：
- 仅分数：中位准确率 34.6%
- 分数 + 摘要：中位准确率 34.9%
- 完整接口（含执行轨迹）：中位准确率 50.0%

"访问原始执行轨迹是最重要的组件。"

## 发现的 Harness 示例

- **文本分类**：标签引导查询——预先展示完整标签空间、每类覆盖示例、基于查询的对比样本对（相似样本不同标签）
- **数学检索**：四路词法路由器，配备学科特定策略（组合数学：去重 + 难度重排序；几何：原始结构匹配）
- **TerminalBench-2**：环境引导——在 agent 第一步之前收集操作系统信息、可用语言、包管理器、/app 目录内容

## 核心洞察

- 发现的 harness 可迁移到未见模型和分布外数据集
- 搜索在数小时内完成
- 生成的代码可读且可检查
- "一旦搜索空间变得可访问，更强的通用 agent 就能超越手工设计的方案"
- 未来方向：harness 与模型权重的协同进化——"策略塑造模型学到的东西，反之亦然"
