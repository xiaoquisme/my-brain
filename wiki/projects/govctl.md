---
title: govctl
created: 2026-07-08
updated: 2026-07-08
type: entity
tags: [swe-tool, governance, ai-coding, agent, governance-as-code, cli, rust]
sources: [../../sources/articles/govctl-tweet-2026.md]
confidence: medium
---

## Summary

govctl 是一个 governance-as-code CLI 工具，为使用 AI 构建软件的团队提供治理控制面。核心理念：AI 生成的变更必须是可审查、可追溯、分阶段门控的。

## 核心概念

govctl 将治理嵌入仓库本身（`gov/` 目录下的 TOML 文件），包含四类治理制品：

1. **RFC** — 描述外部相关行为和约束（"what must be true"）
2. **ADR** — 记录设计选择和权衡（"why a design was chosen"）
3. **Work Items** — 跟踪执行和验收标准
4. **Verification Guards** — 可执行的完成门控

**无 govctl 时：** prompt → code → drift → arguments
**有 govctl 时：** RFC / ADR → work item → guarded implementation → stable history

## 设计原则

1. **Spec-first by default** — 实现跟随治理制品，而非 prompt
2. **Artifacts are the control plane** — 制品在 `gov/` 中作为 TOML 文件，可 diff、可 PR 审查
3. **One CLI agents can reliably operate** — `list`, `show`, `get`, `edit` + 生命周期动词（`adr accept`, `rfc advance`, `rfc supersede`, `work move`）
4. **Works in brownfield repos** — `/migrate` 工作流支持增量采纳

## 技术栈

- 语言：Rust
- 安装：`cargo install govctl` 或 `cargo binstall govctl`
- 制品格式：TOML 文件，存放在 `gov/` 目录

## 与 AI Agent 工程的关系

govctl 直接解决 [[coding-agents]] 场景下的治理问题：当 AI Agent 大量生成代码时，如何确保变更经过审查、决策有记录、完成有验证。这与 [[harness-engineering]] 中强调的安全门控理念一致，但切入角度不同——govctl 从治理制品（RFC/ADR）出发，而非从 harness 执行环境出发。

在 [[loop-engineering]] 的框架下，govctl 提供的是循环中的"验证守卫"原语——不是测试代码能否运行，而是测试工作是否真正完成。在 [[factory-model]] 的视角中，它补充了"制品层"的治理缺失。

## 使用方式

```bash
govctl init              # 初始化治理结构
govctl status            # 查看当前治理状态
govctl rfc new "标题"     # 创建 RFC
govctl adr new "标题"     # 创建 ADR
govctl adr accept <id>   # 接受 ADR
govctl rfc advance <id>  # 推进 RFC 阶段
govctl self-update       # 更新 CLI
```

## 相关页面

- [[harness-engineering]] — 从执行环境角度治理 AI Agent
- [[coding-agents]] — govctl 的核心应用场景
- [[loop-engineering]] — govctl 的 verification guards 对应循环工程的验证原语
- [[compound-engineering]] — Every 团队的 AI 原生工程实践
- [[tom-doerr]] — 项目作者
