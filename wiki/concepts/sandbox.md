---
title: Sandbox
created: 2026-04-20
updated: 2026-04-20
type: concept
tags: [ai-agents, coding-agents, harness-engineering]
sources:
  - ../../sources/articles/2045925288908046570.md
confidence: medium
related:
  - harness-engineering.md
  - coding-agents.md
  - claude-code-session-management.md
  - ../people/aparna-dhinakaran.md
---

## Summary

Sandbox（沙箱）是 harness 的执行环境，类比于服务器在传统应用中的角色。Harness 负责推理和调用工具，Sandbox 提供隔离的计算环境、文件系统和状态管理。

## Key Points

### Sandboxes Vs Servers

- **服务器**：运行应用，使用计算资源、写入文件系统、跨重启保持状态
- **Sandbox**：运行 harness，提供隔离执行环境
- 两者可独立替换：swap either one independently and the system still works

### Core Functions

1. **Compute Isolation**：隔离的执行环境，防止 agent 行为污染主系统
2. **Filesystem Access**：agent 创建、修改、删除文件的场所
3. **State Persistence**：跨会话保持状态的能力

### State Components

1. **Trajectory**（轨迹）：完整记录——问了什么问题、做了什么 tool call、做了什么决策
2. **Local Data**（本地数据）：下载的文件、新写的 skills、生成的分析、修改的 code

### Providers

- **Daytona**：Cloud-hosted sandboxes
- **E2B**：Cloud-hosted sandboxes  
- **Stripe Minions**：Self-hosted option
- **Browserbase**：Browser automation sandboxes

## Open Questions

- How will enterprises balance managed vs self-hosted sandbox options?
- What trajectory ownership models will emerge?

---
## Evidence Timeline

- **2026-04-20**: Ingested from Aparna Dhinakaran's "Sandboxes Are the Servers of the Harness Era"

## 相关页面

[[aparna-dhinakaran]]
- [[claude-code-session-management]]
