---
title: Resolver
created: 2026-04-23
updated: 2026-04-23
type: concept
tags: [ai-agents, context-management, architecture]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [thin-harness-fat-skills.md, skill-file.md, harness.md]
---

## Summary

Resolver 是上下文的路由表：当任务类型 X 出现时，首先加载文档 Y。Skills 说 **HOW**，Resolvers 说 **WHEN 加载 WHAT**。

## Key Points

### 核心功能

- **路由决策**：根据任务类型自动加载相关文档
- **隐式触发**：开发者可能不知道某些文档/技能存在，resolver 自动加载
- **注意力管理**：避免把所有信息塞进单一上下文文件

### Claude Code 的内置 Resolver

每个 Skill 有一个 `description` 字段，模型自动将用户意图匹配到 Skill 描述。

> "你永远不需要记住 `/ship` 存在。描述就是 resolver。它像 Clippy，但真的有效。"

### Garry Tan 的教训

**问题**：CLAUDE.md 被写到 20,000 行——每个怪癖、模式、教训都塞进去。

**后果**：模型注意力退化，Claude Code 建议缩减。

**修复**：缩减到约 200 行，只保留指针。Resolver 在需要时加载正确的文档。

### Resolver 工作示例

```
开发者修改了 prompt → 直接提交？

没有 resolver：是的，直接提交了
有 resolver：模型先读 docs/EVALS.md
  → 运行 eval 套件
  → 比较分数
  → 如果准确率下降 > 2%，回滚并调查

开发者甚至不知道 eval 套件存在！
```

### 与其他概念的关系

- **Harness** 包含 Resolver
- **Skills** 是 Resolver 路由的目标
- Resolver 依赖 Skill 的 `description` 字段进行匹配

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 定义

## 相关页面

[[skill-file]]

