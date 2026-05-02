# Wiki Schema

## Domain
软件工程工具与 AI 研究 — 涵盖 AI/ML 研究成果、软件工程自动化工具、代码生成、基准测试、开源项目情报，以及将 AI 应用于软件工程的交叉领域（如 AI 代码助手、自动化测试、程序合成等）。

## Directory Structure

```
wiki/                   # 本仓库根目录即 wiki 根目录
├── SCHEMA.md           # 本文件：结构约定、标签分类
├── index.md            # 分区内容目录，附一行摘要
├── log.md              # 时间线操作日志（仅追加，按年轮转）
├── sources/            # Layer 1: 原始素材（不可变）
│   ├── articles/       # 网页文章、剪藏
│   ├── books/          # 书籍章节（按书名分子目录）
│   └── meetings/       # 会议记录、访谈
├── wiki/               # Layer 2: Agent 维护的知识页面
│   ├── concepts/       # 概念/主题页
│   ├── people/         # 人物/组织实体页
│   ├── projects/       # 项目/工具/产品实体页
│   └── synthesis/      # 综合分析、跨主题洞察
└── scripts/            # 维护脚本
```

## Conventions
- 文件名：小写，连字符分隔，无空格（如 `swe-bench.md`、`openai-codex.md`）
- 每个 wiki 页面以 YAML frontmatter 开头（见下方格式）
- 使用 `[[wikilinks]]` 链接页面，每页至少 2 个出站链接
- 更新页面时必须更新 `updated` 日期
- 每个新页面必须添加到 `index.md` 对应分区（按字母排序）
- 每次操作必须追加到 `log.md`
- 综合 3+ 个来源的页面，用 `^[sources/articles/source-file.md]` 标注段落来源

## Frontmatter
```yaml
---
title: 页面标题
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: entity | concept | comparison | query | summary
tags: [来自下方分类]
sources: [sources/articles/source-name.md]
confidence: high | medium | low
contested: true   # 仅在有未解决矛盾时设置
contradictions: [other-page-slug]
---
```

## Tag Taxonomy

### 模型与架构
- `model` — 具体的 AI 模型（GPT-4、Claude、Llama 等）
- `architecture` — 模型架构（Transformer、MoE、SSM 等）
- `llms` — 大语言模型通用话题
- `benchmark` — 评测基准（SWE-bench、HumanEval、MMLU 等）
- `training` — 训练方法、数据、流程
- `inference` — 推理、部署优化
- `fine-tuning` — 微调方法
- `reasoning` — 推理能力、Chain-of-Thought
- `multimodal` — 多模态模型
- `kv-cache` — KV Cache 技术
- `prompt-caching` — Prompt Caching 技术

### 软件工程
- `swe-tool` — 软件工程工具（IDE、linter、测试框架等）
- `code-gen` — 代码生成、程序合成
- `agent` — AI 编程 Agent、自主编程系统
- `ai-agents` — AI Agent 通用话题
- `coding-agents` — 编码 Agent
- `testing` — 自动化测试、模糊测试、验证
- `devops` — CI/CD、基础设施、部署工具
- `harness-engineering` — Harness 工程
- `tool-use` — 工具使用能力
- `skills` — 技能文件、可复用流程
- `context-management` — 上下文管理
- `rag` — 检索增强生成
- `workflow` — 工作流、开发流程

### 方法论
- `agile` — 敏捷方法论
- `kanban` — 看板方法
- `scrum` — Scrum 框架
- `methodology` — 通用方法论

### 人员与组织
- `person` — 研究者、工程师、创始人
- `company` — 公司、初创企业
- `lab` — 研究机构（OpenAI、DeepMind、CMU 等）
- `open-source` — 开源项目
- `anthropic` — Anthropic 相关
- `openai` — OpenAI 相关

### 系统设计
- `distributed-systems` — 分布式系统
- `databases` — 数据库
- `system-design` — 系统设计
- `architecture-pattern` — 架构模式

### 元信息
- `comparison` — 横向对比分析
- `timeline` — 时间线、历史
- `controversy` — 争议、未解决问题
- `prediction` — 预测、展望
- `synthesis` — 综合分析
- `knowledge-management` — 知识管理

规则：页面上的每个 tag 必须出现在此分类中。需要新 tag 时先在此处添加。

## Page Thresholds
- **创建页面**：实体/概念在 2+ 个来源中出现，或在一个来源中处于核心地位
- **追加到现有页面**：来源提到已有页面覆盖的内容
- **不创建页面**：一笔带过的提及、次要细节、领域外内容
- **拆分页面**：超过 200 行时拆分为子主题并交叉链接
- **归档页面**：内容完全被取代时移至 `_archive/`，从 index 删除

## Entity Pages (people/, projects/)
每个重要实体一个页面，包含：
- 概述 / 是什么
- 关键事实与日期
- 与其他实体的关系（[[wikilinks]]）
- 来源引用

## Concept Pages (concepts/)
每个概念/主题一个页面，包含：
- 定义/解释
- 当前知识状态
- 开放问题或争论
- 相关概念（[[wikilinks]])

## Synthesis Pages (synthesis/)
跨主题综合分析，包含：
- 综合了哪些来源/概念
- 核心洞察
- 与现有概念的联系
- 来源引用

## Update Policy
新信息与现有内容冲突时：
1. 对比日期 — 较新来源通常优先
2. 若确实矛盾，注明两种说法及日期和来源
3. 在 frontmatter 标注：`contradictions: [page-name]`
4. 在 lint 报告中标记供用户审阅
