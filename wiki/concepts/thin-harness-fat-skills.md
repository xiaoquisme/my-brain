---
title: Thin Harness, Fat Skills
created: 2026-04-23
updated: 2026-04-23
tags: [ai-agents, harness-engineering, skills, architecture]
sources: [../sources/articles/thin-harness-fat-skills.md]
related: [skill-file.md, harness.md, resolver.md, latent-vs-deterministic.md, diarization.md, harness-engineering.md]
---

## Summary

"Thin Harness, Fat Skills" 是 Garry Tan 提出的 AI Agent 架构原则：保持框架（harness）精简，将智能和判断力封装在技能文件（skills）中。核心观点是 100x 效率提升来自架构而非模型本身。

## Key Points

### 三层架构

1. **Fat Skills（顶层）**：Markdown 格式的技能文件，编码判断力、流程和领域知识。90% 的价值在这里。
2. **Thin CLI Harness（中间层）**：约 200 行代码，JSON 输入、文本输出，默认只读，CLI 优先。
3. **Your App（底层）**：确定性工具——QueryDB、ReadDoc、Search、Timeline。

### 核心原则

- 智能向上推入 Skills
- 执行向下推入确定性工具
- 保持 Harness 精简

### 五个定义

1. **Skill File** - 可复用的 Markdown 流程，教模型 HOW 而非 WHAT
2. **Harness** - 运行 LLM 的程序：循环、文件读写、上下文管理、安全执行
3. **Resolver** - 上下文路由表：任务类型 X → 加载文档 Y
4. **Latent vs Deterministic** - 潜在空间（判断）vs 确定性（信任）
5. **Diarization** - 读取多文档，输出结构化摘要

### 效率提升的真相

> "2x 人和 100x 人在用同样的模型。区别是五张索引卡大小的概念。"

Steve Yegge 的数据：AI 编码代理用户比 2005 年 Google 工程师高效 1000x。这不是因为模型更聪明，而是架构更好。

### Skill File 如何工作

- 像方法调用（method call）：相同流程，不同参数产生不同能力
- Markdown 是代码：用模型能理解的语言描述流程和判断
- 参数化：`/investigate(TARGET, QUESTION, DATASET)` 可用于医疗研究或法务调查

### 反模式：Fat Harness

- 40+ 工具定义吃掉半个上下文窗口
- MCP 往返 2-5 秒延迟
- 3x token、3x 延迟、3x 失败率

正确做法：Playwright CLI 200ms 完成 Chrome MCP 需要 15s 的操作（75x 更快）

### 自学习循环

YC Startup School 案例：
1. `/enrich-founder` 每晚分析 6000 创始人
2. `/match-*` 技能进行匹配（同一技能，三种调用）
3. `/improve` 读取 NPS 调查，自动改写匹配规则
4. 结果：12% "OK" 评级 → 4%

---
## Evidence Timeline

- **2026-04-23**: 从 gbrain 仓库 ingest，Garry Tan 在 YC Spring 2026 的演讲稿
