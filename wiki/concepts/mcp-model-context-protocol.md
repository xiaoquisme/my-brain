---
title: MCP (Model Context Protocol)
created: 2026-05-10
updated: 2026-05-10
type: concept
tags: [mcp, tool-integration, agent, anthropic, protocol]
sources: [../../sources/articles/mcp-vs-cli-wrong-debate.md]
confidence: medium
---

## Summary

MCP (Model Context Protocol) 是 Anthropic 发布的 Agent-工具连接协议，提供类型契约但存在 context 开销问题。截至 2026 年初 SDK 下载量达 3 亿，是增长最快的 Agent 基础设施。

## Key Points

- **优势**：提供 typed contracts（类型化契约），agent 不需要猜测工具输出格式
- **劣势**：工具描述一次性全量加载到 context，token 开销大
  - Playwright MCP：13.7K tokens
  - Chrome DevTools MCP：18K tokens
  - 5 个 server 组合：55K tokens
- **现状**：Anthropic 报告 300M SDK 下载量（从年初 100M 增长），协议并未死亡
- **进化方向**：从"启动时全量加载"转向"按需加载"——即 [[code-mode]] 中的 typed module imports 模式
- **争论误区**："MCP is dead" 是错误结论。死的不是协议，而是"一次性加载所有工具"的做法

## 与现有概念的联系

- [[code-mode]]：Code Mode 保留了 MCP 的类型契约，但改为按需 import
- [[agent-context-management]]：MCP 的 context 开销是 agent 上下文管理的核心挑战之一
- [[harness]]：MCP server 的集成是 harness 层面的架构决策

## Open Questions

- MCP 协议本身是否会演进为支持懒加载？
- 在 Code Mode 模式下，MCP server 的角色如何重新定义？

---
## Evidence Timeline

- **2026-05-10**: 从 @akshay_pachaar 的文章了解到 MCP 的 token 开销数据和 SDK 下载增长
