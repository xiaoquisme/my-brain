---
title: Harness
created: 2026-04-23
updated: 2026-04-23
tags: [ai-agents, harness-engineering, architecture]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [thin-harness-fat-skills.md, skill-file.md, resolver.md, harness-engineering.md]
---

## Summary

Harness 是运行 LLM 的程序，负责四件事：循环运行模型、读写文件、管理上下文、执行安全检查。核心原则是 **保持精简**（thin），让智能封装在 Skills 中。

## Key Points

### Harness 的四个职责

1. **循环运行模型** - 维护对话循环
2. **文件读写** - 与文件系统交互
3. **上下文管理** - 加载/卸载上下文
4. **安全执行** - 确保操作安全

### Thin Harness 原则

- 约 200 行代码
- JSON in, text out
- 默认只读
- CLI 优先，MCP 后加

### 反模式：Fat Harness

❌ **错误做法：**
- 40+ 工具定义吃掉半个上下文窗口
- MCP 往返 2-5 秒延迟
- REST API 包装器把每个端点变成工具
- 3x token、3x 延迟、3x 失败率

✅ **正确做法：**
- Playwright CLI：200ms 完成截图+断言
- Chrome MCP 需要 15s 的操作（75x 更快）
- "软件不必再精致了。精确构建你需要的。"

### Harness 实例

| Harness | 用途 | 特点 |
|---------|------|------|
| Claude Code | 编码 | 最佳编码 harness |
| OpenClaw | 通用 | 邮件、日历、会议、研究、告警 |
| Cursor | 编码 | IDE 集成 |
| Codex | 编码 | OpenAI 的编码代理 |

### 与 Anthropic Claude Code 源码的印证

2026-03-31，Anthropic 意外将 Claude Code 源码发布到 npm（512,000 行）。Garry Tan 阅读后确认：

> "秘方不是模型。是包裹模型的东西：live repo context、prompt caching、purpose-built tools、context bloat minimization、structured session memory、parallel sub-agents。"

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 定义
