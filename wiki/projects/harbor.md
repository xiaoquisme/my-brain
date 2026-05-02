---
title: Harbor (laude-institute)
created: 2026-04-28
updated: 2026-04-28
tags: [swe-tool, open-source, agent]
sources: [../../sources/articles/swe-atlas-github-2026.md]
---

# Harbor

Harbor 是 laude-institute 开发的开源任务运行框架，专为 AI Agent 评测基准设计。

- GitHub: https://github.com/laude-institute/harbor
- 安装：`uv tool install .`
- 用途：管理评测任务的定义、发布（harbor publish）和运行（harbor add）

## 在 SWE-Atlas 中的作用

swe-atlas.md 使用 Harbor 来管理 496 个 QnA 任务和 360 个 Test Writing 任务的发布与运行。数据集通过 Harbor 发布到 `scale-ai/swe-atlas-qna` 等命名空间。

## 相关实体

- swe-atlas.md — 主要使用方
- ../concepts/modal.md — 配套的沙箱执行环境