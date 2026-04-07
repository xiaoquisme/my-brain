---
title: Harness Engineering — Agent 不好用，也许不是模型的问题
url: https://yuanchaofa.com/post/harness-engineering-for-ai-agents
date_added: 2026-04-07
author: Chaofa Yuan
type: article
tags: [harness-engineering, ai-agents, context-engineering]
---

# Harness Engineering — Agent 不好用，也许不是模型的问题

作者：Chaofa Yuan | 2026-03-14（最后修改：2026-03-22）

## 核心论点

Agent 表现不好，问题往往不在模型。引用 LangChain 研究：同一模型（GPT-5.2-Codex）仅修改 harness 就从 Terminal Bench 2.0 的 Top 30 跃升至 Top 5。

## 关键定义

**Harness** 包括：系统提示词、指令文件（CLAUDE.md）、工具集、沙箱环境、上下文压缩、中间件钩子、子 Agent 管理。定义为"模型权重之外的一切"。

## 概念层次框架

三个工程层次是递进扩展关系，不是替代关系：

- **Prompt Engineering**：聚焦指令措辞
- **Context Engineering**：管理整个输入窗口
- **Harness Engineering**：控制执行环境和系统约束

## LangChain 案例：四项实际改进

1. **强制自我验证**：通过中间件拦截，Agent 退出前必须自检
2. **环境预扫描**：启动时注入环境信息，减少探索时间
3. **循环检测**：追踪跨迭代的文件编辑，识别死循环
4. **推理三明治**（高→中→高强度）：平衡质量与延迟

## 战略洞察

- 某些 harness 设计是补偿当前模型局限的——模型进步后会过时
- 但持久存储、沙箱、版本控制等架构决策是**物理约束**，与模型能力无关，属于持久性设计
- Harness 本身成为数据集——执行轨迹反馈到后续模型训练，形成环境与模型的**共同演化**
