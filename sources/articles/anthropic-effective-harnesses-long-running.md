---
title: "Effective Harnesses for Long-Running Agents"
url: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
date_added: 2026-04-07
type: article
tags: [harness-engineering, coding-agents, anthropic, long-running-agents, context-management]
author: Justin Young
published: 2025-11-26
---

Justin Young (Anthropic) 关于长时间运行 agent 的 harness 设计。核心问题：agent 在离散会话中操作，每个新会话没有之前工作的记忆。

## 核心挑战

跨多个 context window 的任务有两个主要失败模式：

1. **Over-ambition（过度野心）**：agent 试图在单个 context window 中完成太多，上下文耗尽时留下半完成的、未文档化的功能
2. **Premature completion（过早完成）**：后续 agent 实例看到已有进度就宣布项目完成，遗漏剩余工作

## 两阶段解决方案

### 1. Initializer Agent（初始化 Agent）
第一个会话建立：
- `init.sh` 脚本用于运行开发环境
- `claude-progress.txt` 文件记录 agent 操作
- 初始 git commit 展示添加的文件

### 2. Coding Agent（编码 Agent）
后续会话专注增量进度，使用结构化更新，让 agent 在新 context window 开始时快速理解项目状态。

## Feature List 方法

用 JSON 文件枚举所有需要的功能，agent 只修改 `passes` 字段，防止意外删除需求：

```json
{
  "category": "functional",
  "description": "New chat button creates fresh conversation",
  "steps": ["Navigate to main interface", "Click 'New Chat' button", ...],
  "passes": false
}
```

## 每个会话的工作流

1. `pwd` 检查工作目录
2. 查看 git log 和进度文件
3. 选择最高优先级的未完成功能
4. 运行初始化脚本
5. 验证基本功能
6. 实现和测试单个功能
7. 带描述性消息的 commit

## 失败模式与解决方案

| 问题 | 解法 |
|------|------|
| 过早宣布完成 | 全面的 feature list 文件，逐个完成 |
| 有 bug / 缺文档 | Git repo + progress notes，每次读取 |
| 不完整的功能标记 | 标记前自我验证 |
| 花时间在设置上 | `init.sh` 脚本 |

## 关键洞察

- 每次只做一个功能，防止 context 耗尽
- Git 管理状态，支持从错误中恢复
- 浏览器自动化做端到端测试（比单元测试更能发现 bug）
- 结构化进度文档实现会话间的交接
- 这种方法类似人类工程实践——交接机制、文档标准、增量任务管理

## 未来方向

- 多 agent 架构（专门的测试 agent、QA agent、清理 agent）是否优于单一通用 agent？
- 当前方法针对 Web 开发优化，科研和金融建模场景待探索
