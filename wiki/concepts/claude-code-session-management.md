---
title: Claude Code Session Management
created: 2026-04-17
updated: 2026-04-17
tags: [claude-code, session-management, context-window, compaction, context-rot, coding-agents]
sources:
  - ../../sources/articles/claude-code-session-management.md
related:
  - ../concepts/coding-agents.md
  - ../concepts/harness-engineering.md
  - ../projects/claude-code-workflow.md
  - ../people/justin-young.md
  - ../people/thariq-shihipar.md
---

## Summary

Claude Code 提供一百万 token 上下文窗口，上下文管理（session、compaction、rewind、subagent）是影响使用效果的关键。核心概念包括 context rot（上下文增长导致性能下降）和 compaction（自动压缩）。

## Key Points

### 核心概念

- **上下文窗口**：模型一次"看到"的所有内容——system prompt、对话历史、工具调用、读取的文件。Claude Code 有 1M token。
- **Context Rot**：上下文增长导致性能下降，因为注意力分散到更多 token，且无关内容干扰当前任务。
- **Compaction**：当接近上下文窗口末尾时，当前任务自动被压缩成精简描述，在新窗口继续工作。

### 五大工具

| 操作 | 说明 |
|-----|------|
| Continue | 同一会话继续发送消息 |
| /rewind (Esc Esc) | 跳回之前消息重试 |
| /clear | 开始新会话 |
| /compact | 压缩当前会话摘要 |
| Subagent | 子代理独立上下文 |

### 决策原则

- **新任务 → 新会话**：虽然 1M 上下文可做更长任务，但 context rot 仍会发生
- **纠错 → Rewind**：比继续说"那不行，换X"更好，可保留有用的文件读取
- **/compact vs /clear**：compact 是自动摘要（可能有遗漏），clear 是手动整理（更可控）
- **Subagent**：适用于产生大量中间输出但只需要结论的任务

### 坏压缩的原因

当模型无法预测工作方向时，compaction 可能丢失关键信息。例如调试会话后自动压缩，但下一个任务是"修复另一个警告"，警告可能被遗漏。

### 子代理心智测试

"我需要这个工具输出吗？还是只需要结论？"

## Open Questions

- 1M 上下文下的最佳实践与之前有何不同？

---
## Evidence Timeline

- **2026-04-17**: 从 Thariq Shihipar 的 "Using Claude Code: session management and 1M context" 文章 ingested
