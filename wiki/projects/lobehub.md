---
title: LobeHub
created: 2026-05-28
updated: 2026-05-28
type: entity
tags: [open-source, company, ai-agents, harness-engineering, agent-architecture]
sources: [../../sources/articles/self-evolving-harness-arvin-xu.md]
confidence: medium
---

## Summary

LobeHub 是一个开源 AI 聊天平台，由 Arvin Xu 创立。接入 70+ AI 模型 provider，是 Self-Evolving Harness 理念的首个生产级实践平台。

## Key Facts

- **创始人**: [[arvin-xu]]
- **开源**: [GitHub - lobehub/lobehub](https://github.com/lobehub/lobehub)
- **模型支持**: 70+ AI Providers（OpenAI、Anthropic、DeepSeek、Gemini、MiniMax、Kimi 等）
- **日活**: 上万次 Agent 执行/天

## 技术架构

LobeHub 的 Harness 四层系统：
1. **Model Runtime**: 适配不同模型供应商
2. **Agent Runtime**: 云原生的步级 Agent 循环（状态机模型，单步执行 = trace event）
3. **Context Engine**: 上下文策略管理
4. **Environment**: Page、Task、Group、IM 等使用环境

## 核心实践

- **Agent Operation Tracing**: 为每次 Agent 执行生成 Execution Snapshot
- **Error Pattern 自动巡检**: Agent 批量解析 tracing，自动发现和修复错误 pattern
- **Agent 成功率**: 从 ~75% 提升到 95%+（通过 9 轮巡检迭代）
- **Agent Tracing 开源**: [packages/agent-tracing](https://github.com/lobehub/lobehub/tree/canary/packages/agent-tracing)

## Related Pages

- [[arvin-xu]] — 创始人
- [[self-evolving-harness]] — 核心理念
- [[harness-engineering]] — 工程实践
- [[agent-operation-tracing]] — 技术基础设施
