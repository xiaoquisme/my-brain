---
title: Graph Engineering
created: 2026-07-06
updated: 2026-07-06
type: concept
tags: [agent-architecture, coding-agents, multi-agent, harness, claude-code, workflow]
sources: [sources/articles/codez-graph-engineering-claude-2026.md]
confidence: medium
---

## Summary

Graph Engineering 是将 AI Agent 的工作流从线性链重新建模为有向图的方法论。核心思想：节点（node）是独立的工作单元，边（edge）是数据依赖关系。通过识别哪些步骤真正有数据依赖、哪些可以并行执行，将线性 Agent 重构为 fan-out/fan-in 的图结构，从而实现并行化、验证门控和模型分层。

## Key Concepts

### 节点与边

- **节点** = 一个 Agent 调用（`agent()`），有明确的输入契约和输出 schema
- **边** = 数据流动方向，不是执行顺序。"然后"不等于有边 — 只有当下一步真正读取上一步的输出时才有边
- **边的代价为零** — 边是纯 JavaScript 代码（flatten、dedupe、filter），不需要消耗 token

### 五种基本拓扑

1. **线性链（degenerate graph）** — 默认形态，每个节点等前一个完成。正确但脆弱、慢
2. **钻石（diamond）** — split → work → merge，核心模式：`fan out → reduce → synthesize`
3. **带条件路由的图** — router 节点检查结果后决定走哪条边（if/switch）
4. **带验证门控的图** — verifier 节点在结果到达 merge 前进行二次审查（three-vote skeptic）
5. **带循环的图** — loop-until-dry 模式，用于未知规模的发现任务

### 核心操作

| 操作 | Claude Code API | 作用 |
|------|----------------|------|
| 扇出 | `parallel(thunks)` | 并发执行 N 个独立子 Agent |
| 扇入 | barrier（等待所有完成） | 汇总所有结果进行去重/排序 |
| 流水线 | `pipeline()` | 无 barrier，每项独立流过所有阶段 |
| 路由 | JS if/switch | 根据节点输出选择下游路径 |
| 验证 | 三票怀疑者 | 3 个独立 Agent 审查同一发现 |
| 循环 | while + dedupe | 持续发现直到连续 K 轮无新结果 |

### 关键实践原则

- **每个节点要有契约** — 用 JSON schema 强制结构化输出，不要返回自由文本
- **默认用 `pipeline()`**，只在真正需要跨集合操作时才用 barrier
- **模型分层** — 重复性节点用便宜模型，判断性节点用好模型
- **worktree 隔离** — 并行写文件时用 git worktree 防止冲突
- **去重对 everything seen** — 循环中对所有已见结果去重，而非仅对已确认结果

### Dynamic Workflows

Claude Code 的动态工作流功能：Claude 自己编写 JavaScript 编排脚本，然后 spawn 协调的子 Agent 舰队执行。编排层是代码而非对话，**零 token 成本**。

三种触发方式：
1. prompt 中说 "workflow"
2. 运行已保存的工作流（如 `/deep-research`）
3. 开启 ultracode，Claude 自动为大任务规划工作流

### 六个实战图例

1. **安全审计** — 每个路由文件一个子 Agent，verifier 确认每个发现
2. **引用报告** — `/deep-research`：scope → parallel search → fetch → adversarial verify → synthesize
3. **逐文件迁移** — fan out 翻译，测试门控，失败循环回来
4. **Diff 对抗审查** — 路由到不同审查者（正确性/安全/性能），judge panel 综合
5. **生态扫描** — 定时运行，多源并行，barrier 排序，写摘要
6. **未知规模发现** — finders 并行，dedupe against seen，verifier 确认，loop until dry

## Open Questions

- Graph Engineering 在非 Claude Code 的 harness 中如何实现？Hermes 的 `delegate_task` + `parallel` 模式是否等价？
- 循环图的收敛性保证在实践中是否足够可靠？K 值如何选择？
- `pipeline()` vs `parallel()` 的延迟差异在实际任务中的量级？

## Related Pages

- [[coding-agents]] — Graph Engineering 是 coding agent 的高级编排模式
- [[harness-engineering]] — Graph thinking 是 harness 层面的架构决策
- [[loop-engineering]] — Loop Engineering 是线性循环，Graph Engineering 是其图化演进
- [[claude-code-harness]] — Claude Code 的 dynamic workflows 是 Graph Engineering 的原生实现
- [[agent-loop-pattern]] — Agent Loop Pattern 是线性形态，Graph Engineering 将其升级为图
- [[agentic-patterns]] — Agentic patterns 中的部分模式（routing, parallelization）在 Graph Engineering 中有具体实现
- [[factory-model]] — Factory Model 的 Loop 可以用 Graph Engineering 重构为更高效的拓扑
