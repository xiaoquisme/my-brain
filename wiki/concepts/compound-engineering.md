---
title: Compound Engineering
created: 2026-06-07
updated: 2026-06-07
type: concept
tags: [workflow, agent, harness-engineering, skills, software-engineering, coding-agents]
sources: [sources/articles/compound-engineering-every-2026.md]
confidence: medium
---

## Summary

Compound Engineering 是 Every 团队（Kieran Klaassen 等）提出的 AI 原生工程哲学：每个工程工作单元应该让后续单元更容易，而不是更难。核心是一条七步循环：Ideate → Brainstorm → Plan → Work → Review → Polish → **Compound** → Repeat。最关键的第七步 "Compound" 将解决方案编码回系统，使系统持续进化。

## Key Points

### 核心循环（七步）

1. **Ideate** — 从模糊到候选列表（/ce-ideate）
2. **Brainstorm** — 从想法到具体需求（/ce-brainstorm）
3. **Plan** — 从需求到蓝图，3 个并行研究 agent（/ce-plan）
4. **Work** — 按计划实现，git worktree 隔离（/ce-work）
5. **Review** — 多 agent 并行审查，P1/P2/P3 优先级（/ce-code-review）
6. **Polish** — 以用户视角体验产品（/ce-polish-beta）
7. **Compound** — 记录可复用洞察，更新 CLAUDE.md，创建新 agent（/ce-compound）

### 50/50 规则

50% 时间构建功能，50% 时间改进系统。传统团队 90/10，把系统改进当开销而非投资。一小时创建 review agent 节省未来一年 10 小时审查。

### 五级成熟度

- Stage 0: 手动开发
- Stage 1: Chat 辅助（AI 当参考工具）
- Stage 2: Agent 工具 + 逐行审查（守门员模式）
- Stage 3: **Plan-first, PR-only review** ← 复合工程从这里开始
- Stage 4: Idea → PR（单机）
- Stage 5: 并行云执行（指挥舰队）

### 审查系统

40+ 专门 agent，按 diff 内容动态选择审查团队：
- **常驻**：正确性、测试、可维护性、项目标准、Agent 兼容性、历史教训
- **条件触发**：安全、性能、API 契约、数据迁移、可靠性、对抗性
- **技术栈特定**：Rails、Python、TypeScript、Swift/iOS

### 核心信念

- 代码不是首要产物——产生代码的系统才是
- 品味属于系统，不属于审查
- 教系统做事，而不是自己做
- 计划是新的代码
- 第一次尝试 95% 是垃圾，第二次 50%——这是过程不是失败

## Connections

- 与 [[skill-file]] 高度相关——CE 的 35+ skills 本质就是 skill files
- 与 [[thin-harness-fat-skills]] 理念一致——保持框架精简，智能封装在技能中
- 与 [[harness]] 工程互补——CE 是一种完整的 harness 设计方法论
- 与 [[skillify]] 哲学相似——"每次失败转化为永久修复"对应 CE 的 compound 步骤
- 与 [[claude-code-harness]] 直接兼容——CE plugin 可安装到 Claude Code
- 与 [[agent-context-management]] 呼应——CLAUDE.md/AGENTS.md 是上下文管理的核心
- 与 [[autoresearch]] 的"自改进循环"理念异曲同工——都强调系统持续进化
- [[agile]] 的 AI 原生演进——CE 的循环结构借鉴了敏捷迭代

## Open Questions

- CE plugin 在大型团队（10+ 人）中的效果如何？文章主要基于单人工程团队
- 50/50 规则在有 deadline 压力时如何执行？
- 40+ agent 的维护成本——当 agent 过时或冲突时如何管理？
- 与 RLHF/DPO 等训练方法的关系——CE 的 "compound" 是在 harness 层还是模型层？

---
## Evidence Timeline

- **2026-06-07**: Kieran Klaassen 在 Every.to 发布 Compound Engineering 指南，基于构建 Cora 等 6 个产品的实战经验 ^[sources/articles/compound-engineering-every-2026.md]
