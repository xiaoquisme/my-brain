---
title: Code Mode
created: 2026-05-10
updated: 2026-05-10
type: concept
tags: [agent-architecture, tool-use, context-management, mcp, agent]
sources: [../../sources/articles/mcp-vs-cli-wrong-debate.md]
confidence: medium
---

## Summary

Code Mode 是一种 Agent 运行时模式：模型写代码调用工具，而非通过 context 窗口调用工具。结合了 MCP 的类型契约和 CLI 的懒加载，是 2025 年 "MCP vs CLI" 争论的实践答案。

## Key Points

- **核心思想**：工具定义放在代码里，不放在 context 里。模型按需 import，只加载实际使用的工具描述。
- **两个原语**：
  - **Bash**：处理已有二进制（git/curl/grep），无需工具定义，模型从训练数据已知用法
  - **Typed module imports**：专有 API（Salesforce/Stripe/内部服务）封装为 TypeScript 模块，类型签名随 import 加载
- **Token 节省效果**：
  - Anthropic 示例：Google Drive → Salesforce 流程，从加载两个完整 schema 降到 2K tokens（**降 98.7%**）
  - Cloudflare：2,500 个 API endpoint，从 1.17M tokens schema 压缩到 1K tokens（只暴露 `search` + `execute`）
- **与旧模式对比**：旧模式 = 房间里所有工具摆在桌上；Code Mode = 墙上贴工具目录，按需取用
- **不是替代而是组合**：Code Mode 不替代 MCP 或 CLI，而是将两者作为原语在运行时中组合

## 与现有概念的联系

- [[harness]]：Code Mode 是 harness 层面的架构决策，影响工具调度方式
- [[agent-context-management]]：Code Mode 直接解决 context 膨胀问题
- [[skill-file]]：Typed module imports 类似 skill 文件的理念——按需加载，不预载全部
- [[latent-vs-deterministic]]：Bash 执行是确定性的，import 选择是 latent 的

## Open Questions

- Code Mode 在多轮对话中的状态管理如何处理？
- 对于不支持 TypeScript 的 runtime（如纯 Python agent），等效方案是什么？
- Cloudflare 的 search/execute 二函数模式是否可泛化到其他大型 API？

---
## Evidence Timeline

- **2026-05-10**: 从 @akshay_pachaar 的 X Article 了解到 Code Mode 概念，Anthropic 2025.11.4 发布 "Code execution with MCP" 是关键转折点

## 相关页面

[[akshay-pachaar]]
