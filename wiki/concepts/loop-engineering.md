---
title: Loop Engineering
created: 2026-06-09
updated: 2026-06-09
type: concept
tags: [agent, coding-agents, harness-engineering, workflow, multi-agent]
sources: [../../sources/articles/loop-engineering-osmani-2026.md]
confidence: medium
---

## Summary

Loop Engineering 是设计自动化系统（循环）来代替人类手动 prompt Agent 的实践。循环 = 递归目标，AI 反复迭代直到完成。它位于 [[harness]] 之上——harness 是单个 Agent 的运行环境，loop 是在定时器上运行、生成子 Agent、自我喂养的系统。核心理念来自 Peter Steinberger 和 Boris Cherny（Claude Code 负责人）："你不应该再 prompt Agent 了，你应该设计 prompt Agent 的循环。"

## Key Points

### 五个原语 + 状态

一个循环需要五个组件和一个记忆系统：

1. **Automations（自动化）**：按调度自动发现和分类工作。Codex 的 Automations tab，Claude Code 的 /loop、cron、hooks、GitHub Actions。/goal 保持运行直到条件为真（独立小模型检查是否完成）
2. **Worktrees（工作树）**：git worktree 隔离并行 Agent 的文件冲突。每个 Agent 在自己的分支/目录工作
3. **Skills（技能）**：SKILL.md 文件固化项目知识，避免每次会话重新解释。技能是意图的外部化（[[skill-file]]）
4. **Plugins & Connectors（插件和连接器）**：基于 MCP 连接外部工具（issue tracker、数据库、Slack）。技能是创作格式，插件是分发方式
5. **Sub-agents（子 Agent）**：分离创作者和检查者。写代码的 Agent 不应该自己评分。典型分工：explore → implement → verify
6. **State（状态）**：Markdown 文件或 Linear board，存在于对话之外。Agent 遗忘，仓库不遗忘

### 与 Harness Engineering 的关系

Loop Engineering 位于 [[harness-engineering]] 之上一层：
- **Harness** = 单个 Agent 的运行环境（安全、可观测性、错误恢复）
- **Loop** = Harness + 定时器 + 子 Agent + 自我喂养
- **Factory Model**（[[factory-model]]）= 构建软件的完整系统

### 关键风险

循环改变工作，不消灭人：

1. **验证仍在人**：无人值守的循环 = 无人值守地犯错。Maker-checker 分离是信任基础
2. **理解力腐烂（Comprehension Debt）**：循环越快交付你没写的代码，你和代码之间的鸿沟越大
3. **认知投降（Cognitive Surrender）**：循环自运行时，很容易停止有主见。同样的动作，不同的结果——取决于你是带着判断力设计循环，还是为了逃避思考

### 设计哲学

- 两个人可以构建完全相同的循环，得到完全相反的结果
- 循环设计比 prompt 工程更难，不是更简单
- 杠杆点移动了：从"写 prompt"到"设计 prompt Agent 的系统"
- 平衡：直接 prompt Agent 仍然有效，关键是找到平衡

## Open Questions

- Token 成本管理：循环的使用模式因 token 预算差异巨大
- 循环的可观测性：如何监控和调试一个自主运行的循环？
- 什么时候循环过度（over-engineering）vs 不够？

## Related

- [[harness-engineering]] — 循环位于 harness 之上一层
- [[human-on-the-loop]] — 循环是 HotL 的技术实现形式
- [[factory-model]] — 循环的上层抽象
- [[skill-file]] — Skills 原语的载体
- [[compound-engineering]] — Every.to 的七步循环，类似理念
- [[coding-agents]] — 循环控制的对象
- [[attenuation-amplification]] — 循环 = 自动化的衰减机制
- [[gemba-go-see]] — "验证仍在人" = 现地现物
- [[addy-osmani]] — 文章作者
