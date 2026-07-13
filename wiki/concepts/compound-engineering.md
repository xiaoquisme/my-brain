---
title: Compound Engineering
created: 2026-06-07
updated: 2026-07-13
type: concept
tags: [workflow, agent, harness-engineering, skills, software-engineering, coding-agents]
sources: [../../sources/articles/compound-engineering-every-2026.md]
confidence: medium
---

## Summary

Compound Engineering 是 Every 团队（Kieran Klaassen 等）提出的 AI 原生工程哲学：每个工程工作单元应该让后续单元更容易，而不是更难。核心是一条四步循环：Plan → Work → Review → **Compound** → Repeat。最关键的第四步 "Compound" 将解决方案编码回系统，使系统持续进化。

## Key Points

### 核心循环（四步）

1. **Plan** — 从需求到蓝图。理解需求、研究现有模式、设计方案、验证完整性
2. **Work** — 按计划实现。Agent 执行，开发者监控。Git worktree 隔离
3. **Review** — 多 agent 并行审查（14+ 专门 agent），P1/P2/P3 优先级
4. **Compound** — 记录可复用洞察，更新 CLAUDE.md，创建新 agent，验证系统是否能自动捕获

**时间分配**：Plan + Review 占 80%，Work + Compound 占 20%。大多数思考发生在代码编写前后。

### 80/20 与 50/50 规则

- **80/20 规则**（构建功能时）：80% 时间用于 plan + review，20% 用于 work + compound
- **50/50 规则**（整体工程时间）：50% 构建功能，50% 改进系统。传统团队 90/10，把系统改进当开销而非投资。一小时创建 review agent 节省未来一年 10 小时审查

### 插件体系

工作流以插件形式发布，支持 Claude Code、OpenCode、Codex。GitHub: [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin)

**包含内容：**
- 14+ 代码审查专家 agent（security-sentinel、performance-oracle、architecture-strategist 等）
- 14 个领域技能文件（agent-native architecture、style guide 等）
- 40+ 并行研究 agent（deepen-plan 模式）
- /lfg 全流程管线：plan → deepen-plan → work → review → resolve → browser tests → feature video → compound，50+ agent

### 关键命令（已从 /ce-* 更名为 /workflows:*）

- `/workflows:brainstorm` — 需求模糊时的创意探索
- `/workflows:plan` — 实现规划，3 个并行研究 agent，支持 ultrathink 模式
- `/workflows:work` — Agent 实现代码，4 阶段：quick start → execute → quality check → ship
- `/workflows:review` — 14+ 专业 agent 并行审查 PR
- `/workflows:resolve` — 自动修复 P1/P2 问题
- `/workflows:triage` — 人工逐条决策（approve/skip/customize）
- `/workflows:compound` — 记录已解决的问题，6 个并行子 agent
- `/lfg` — 一键全流程：描述功能 → 交付 PR

### 核心信念

- 代码不是首要产物——产生代码的系统才是
- 品味属于系统，不属于审查
- 教系统做事，而不是自己做
- 构建安全网，而非审查流程
- 计划是新的代码
- 第一次尝试 95% 是垃圾，第二次 50%——这是过程不是失败

### 五级成熟度

- Stage 0: 手动开发
- Stage 1: Chat 辅助（AI 当参考工具）
- Stage 2: Agent 工具 + 逐行审查（守门员模式）
- Stage 3: **Plan-first, PR-only review** ← 复合工程从这里开始
- Stage 4: Idea → PR（单机）

### 扩展实践

文章新增了多个实践领域：
- **Design in Code** — 用 baby app 原型化，Figma 同步 agent，设计迭代
- **Vibe Coding** — 跳过阶梯直达 Stage 4，适合非技术人员快速原型
- **Team Collaboration** — 异步计划审批、PR 归属、人工审查聚焦意图而非实现
- **User Research** — 结构化用户洞察为 AI 可用的 planning context
- **Copy** — 将文案纳入计划，定义 voice skill
- **Marketing** — 从计划自动生成 release notes、社交帖子、截图

## Connections

- 与 [[skill-file]] 高度相关——CE 的 14 skills 本质就是 skill files
- 与 [[thin-harness-fat-skills]] 理念一致——保持框架精简，智能封装在技能中
- 与 [[harness]] 工程互补——CE 是一种完整的 harness 设计方法论
- 与 [[skillify]] 哲学相似——"每次失败转化为永久修复"对应 CE 的 compound 步骤
- 与 [[claude-code-harness]] 直接兼容——CE plugin 可安装到 Claude Code
- 与 [[agent-context-management]] 呼应——CLAUDE.md/AGENTS.md 是上下文管理的核心
- 与 [[autoresearch]] 的"自改进循环"理念异曲同工——都强调系统持续进化
- [[agile]] 的 AI 原生演进——CE 的循环结构借鉴了敏捷迭代
- 与 [[loop-engineering]] 理念相似——都是系统化循环，CE 更聚焦 AI 编码场景

## Open Questions

- CE plugin 在大型团队（10+ 人）中的效果如何？文章主要基于单人工程团队
- 50/50 规则在有 deadline 压力时如何执行？
- 14+ review agent 的维护成本——当 agent 过时或冲突时如何管理？
- 与 RLHF/DPO 等训练方法的关系——CE 的 "compound" 是在 harness 层还是模型层？

---
## Evidence Timeline

- **2026-06-07**: Kieran Klaassen 在 Every.to 发布 Compound Engineering 指南初版，基于构建 Cora 等 6 个产品的实战经验。核心为七步循环。 ^[sources/articles/compound-engineering-every-2026.md]
- **2026-07-13**: 文章大幅重写——七步循环简化为四步（Plan → Work → Review → Compound），新增 install 指南、Design in Code、Vibe Coding、Team Collaboration、User Research、Copy、Marketing 等章节。命令从 /ce-* 更名为 /workflows:*。Review agent 从泛称 "40+" 细化为 14 个具名专家。 ^[sources/articles/compound-engineering-every-2026.md]

## 相关页面

- [[every]] — Every 团队项目页，CE 的实践主体
