---
title: Claude Opus 4.7
created: 2026-04-17
updated: 2026-04-20
type: concept
tags: [anthropic, claude, llms, coding-models, multimodal, opus]
sources:
  - ../../sources/articles/claude-opus-4-7.md
confidence: medium
related:
  - ../concepts/coding-agents.md
  - ../concepts/agentic-patterns.md
  - ../concepts/openai-codex-2026.md
---

## Summary

Claude Opus 4.7 是 Anthropic 于 2026年4月16日发布的新模型，在高级软件工程任务上有显著提升，特别是在最困难的任务上。它能够处理复杂、长时的任务，注重指令遵循，并在报告前验证自己的输出。

## Key Points

### 核心能力提升

- **软件工程**: 在 93-task 编码基准上比 Opus 4.6 提升 13%，包括 4 个两者都无法解决的任务
- **长时推理**: 在研究代理基准上达到 0.715 分（与另外两个模型并列第一），长上下文表现最佳
- **指令遵循**: 大幅提升，但旧模型写的 prompt 可能会产生意外结果
- **多模态**: 支持更高分辨率图像，最多 2,576 像素（约 3.75MP），是之前模型的 3 倍以上
- **自主性**: 能自主工作数小时，穿透困难问题而不是放弃

### 评测结果

- **Hex**: 最强模型，能正确报告数据缺失而不是提供看似合理但错误的默认值
- **CursorBench**: 70% vs Opus 4.6 的 58%
- **Rakuten-SWE-Bench**: 解决的生产任务数量是 Opus 4.6 的 3 倍
- **Devin**: 长时间自主性达到新水平
- **Replit**: 相同质量但更低成本

### 新特性

- **xhigh 努力级别**: 在 high 和 max 之间新增的细粒度控制
- **更新的 tokenizer**: 相同输入映射到约 1.0-1.35x 更多 token
- **更高思考量**: 高努力级别下产生更多输出 token，但可靠性更高

### 安全

与 Opus 4.6 相似的安全 profile。在诚实度和 prompt 注入攻击抵抗方面有改进。

### 定价

与 Opus 4.6 相同：$5/百万输入 token，$25/百万输出 token。

## Open Questions

- 新 tokenizer 对现有工作流的影响如何优化？
- xhigh 努力级别的最佳使用场景是什么？

---
## Evidence Timeline

- **2026-04-17**: 从 Anthropic 官方发布文章 ingested

## 相关页面

[[openai-codex-2026]]
- [[claude-code-session-management]]