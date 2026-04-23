---
title: GBrain
created: 2026-04-23
updated: 2026-04-23
tags: [projects, ai-agents, knowledge-base, open-source]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [thin-harness-fat-skills.md, garry-tan.md, openclaw.md, skill-file.md]
---

## Summary

GBrain 是 Garry Tan 开源的 AI Agent 框架项目，实现了 "Thin Harness, Fat Skills" 架构。GitHub 仓库 github.com/garrytan/gbrain，10.5k stars。

## Key Points

### 项目定位

- 实现 "Thin Harness, Fat Skills" 的开源框架
- 专注于 AI Agent 的技能管理和执行
- 包含完整的文档、架构设计和 ethos

### 仓库结构

```
docs/
  ethos/           # 核心理念文档
    THIN_HARNESS_FAT_SKILLS.md
    MARKDOWN_SKILLS_AS_RECIPES.md
  architecture/    # 架构设计
  designs/         # 设计文档
  guides/          # 使用指南
skills/            # 内置技能
recipes/           # 配方/模板
src/               # 源代码
```

### 核心文档

1. **THIN_HARNESS_FAT_SKILLS.md** - 核心架构理念
2. **MARKDOWN_SKILLS_AS_RECIPES.md** - Skills 作为配方的设计
3. **GBRAIN_V0.md** - v0 版本设计
4. **GBRAIN_SKILLPACK.md** - 技能包规范
5. **ENGINES.md** - 引擎设计

### Agent Decision Guide

何时用 Skill vs Code：

| 问题 | YES → | NO → |
|------|-------|------|
| 需要思考/适应/提问？ | Skill | Code |
| 相同输入总是相同输出？ | Code | Skill |
| 需要判断用户环境？ | Skill | Code |
| 是查找/列表/状态检查？ | Code | 可能 Skill |
| 根据对话上下文改变行为？ | Skill | Code |

### GBrain 示例

- `gbrain integrations list` = **Code**（确定性）
- `gbrain integrations status` = **Code**（确定性）
- Recipe setup flow = **Skill**（需要适应环境）
- Entity detection = **Skill**（需要判断重要性）

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，10.5k stars，活跃开发中
