---
title: "RAG 进化之路：传统 RAG 到工具与强化学习双轮驱动的 Agentic RAG"
url: https://yuanchaofa.com/post/from-native-rag-to-agentic-rag
date_added: 2026-04-08
type: article
author: Chaofa Yuan
tags: [rag, agentic-rag, ai-agents, reinforcement-learning, tool-use]
---

## 阅读收获

- 了解传统 RAG 的基本概念
- 了解 Agentic RAG 的基本概念
- 了解企业级 Agentic RAG 实现（Chatbox 项目）
- 了解强化学习驱动的 Agentic RAG（Search-R1）

## 传统 RAG (Native RAG)

核心概念：检索 + 生成，需要两个方面的提升：
- 更好的知识检索机制
- 增强模型对知识的利用能力

**离线流水线**：文档加载 → 文本切分 → 向量化 → 存储
**在线流水线**：用户查询 → 文档检索 → Prompt 构建 → LLM 生成

## Agentic RAG

### 传统 RAG 的局限

- 单次流水线，缺乏自适应检索策略
- 缺乏任务分解能力
- 工具编排不足，仅限于相似度搜索
- 证据利用浅层
- 对多跳问题适应性差

### 定义

"让 LLM 作为'智能体（Agent）'充当控制器，结合一组工具执行'思考→行动→观察'的循环"

Agentic RAG 实际上就是指在传统 RAG 基础上，加入了 Agent 组件的 RAG 系统，使其具有自主决策能力。

### 实现路径一：Prompt Engineering + Tool（工具驱动）

以开源项目 Chatbox（36.8k stars）为例：

工具设计：
- `query_knowledge_base`: 语义搜索候选文档
- `get_files_meta`: 获取文件元数据，用于策略决策
- `read_file_chunks`: 精准读取特定片段
- `list_files`: 浏览完整文件目录

关键洞察："给模型配备合适的工具和策略性的 Prompt，就能展现出令人惊叹的智能" — 从被动信息检索变为主动决策过程。

### 实现路径二：强化学习驱动（Search-R1）

通过 RL 训练模型自主决定何时/搜索什么内容，通过策略优化实现"推理-搜索-推理"循环。

### 对比表

| 方法 | 决策机制 | 搜索能力 | 适应性 | 实现复杂度 |
|------|---------|---------|--------|-----------|
| 传统 RAG | 固定流水线 | 单次检索 | 低 | 低 |
| Prompt 驱动的 Agentic RAG | 基于规则 | 多次检索 | 中 | 中 |
| RL 驱动的 Agentic RAG | 学习优化 | 自适应多次检索 | 高 | 高 |

## 资源

- GitHub: Hands-On-Large-Language-Models-CN (第 8 章)
- Chatbox 项目（36.8k stars）
- Search-R1 项目
