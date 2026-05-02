# Wiki Index

> 内容目录。每个 wiki 页面按类型列出，附一行摘要。
> 查询前先读此文件以找到相关页面。
> Last updated: 2026-05-02 | Total pages: 68 | Lint maintenance pass complete

## Concepts

- [[agent-context-management]] — Agent harnesses share a fundamental constraint: the context window is finite. As sessions grow,...
- [[agent-loop-pattern]] — 一种 AI 编码 Agent 架构：将大型任务拆分为独立子任务，每轮迭代启动一个全新的 AI 实例完成一个子任务，通过外部状态文件传递记忆
- [[agentic-patterns]] — Six composable design patterns for building LLM-powered agentic systems, from simple augmentation to autonomous agents
- [[agentic-rag]] — Agentic RAG is the evolution of traditional RAG that adds agentic capabilities like tool use and multi-step reasoning
- [[agile]] — 敏捷是一种软件开发方法论，强调增量交付、团队协作、持续规划和持续学习
- [[ai-coding-benchmark]] — AI 编程基准是用于评测 AI 代码生成/编程 Agent 能力的标准化测试集
- [[ashbys-law]] — A control system must have at least as much variety as the system it seeks to control
- [[car-framework]] — CAR (Control, Agency, Runtime) is a formal decomposition of the harness layer in language agents
- [[claude-code-session-management]] — Claude Code 上下文管理：session、compaction、rewind、subagent 是影响使用效果的关键
- [[claude-opus-4-7]] — Claude Opus 4.7 是 Anthropic 于 2026-04-16 发布的新模型，在高级软件工程任务上有显著提升
- [[codebase-qna]] — 代码库问答评测形式：让 Agent 探索真实代码库并回答自然语言问题
- [[coding-agents]] — AI agents that autonomously write, modify, and test code
- [[diarization]] — 让模型读取某个主题的所有内容，然后输出结构化摘要。读 50 份文档，产出 1 页判断
- [[harness]] — Harness 是运行 LLM 的程序，负责循环运行模型、读写文件、管理上下文、执行安全检查
- [[harness-engineering]] — 构建围绕 AI 编码 Agent 的系统性控制——安全、可观测性、错误恢复
- [[harnesscard]] — HarnessCard: 轻量级报告格式，用于披露 harness 配置以保证可复现性
- [[kanban]] — 看板最初由丰田汽车公司开发，用于提高制造效率，后被引入软件开发
- [[kv-cache-and-prompt-caching]] — KV Cache 和 Prompt Caching: 两种互补的 LLM 推理加速技术
- [[latent-vs-deterministic]] — 系统中的每一步要么是 Latent（模型判断）要么是 Deterministic（确定性），好的架构把正确的工作放在正确的层级
- [[llm-wiki-pattern]] — LLM 增量构建和维护结构化、互链接的知识库模式
- [[meta-harness]] — Meta-Harness: 自动搜索最优 harness 配置的系统
- [[openai-codex-2026]] — OpenAI 于 2026-04-16 发布 Codex 重大更新，扩展为可在电脑上自主操作的全面开发伴侣
- [[reasoning-shift]] — 推理型 LLM 在非隔离上下文条件下推理链显著缩短（最多 50%）的现象
- [[resolver]] — Resolver 是上下文的路由表：当任务类型 X 出现时，首先加载文档 Y
- [[sandbox]] — Sandbox 是 harness 的执行环境，提供隔离的计算环境、文件系统和状态管理
- [[scrum]] — Scrum 是最流行的敏捷框架之一，将敏捷原则实现为具体的项目、实践和角色
- [[skill-file]] — Skill File 是可复用的 Markdown 流程文件，教 AI 模型 HOW 做某事
- [[skillify]] — Garry Tan 提出的实践：每次 AI agent 失败都转化为永久修复
- [[thin-harness-fat-skills]] — Garry Tan 提出的 AI Agent 架构原则：保持框架精简，将智能封装在技能文件中
- [[tool-use-as-meta-ability]] — Agent 的编码/脚本能力是其"元能力"——构建可靠工具的能力

## People

- [[alejandro-balderas]] — 《Claude Code from Source》作者，18 章技术书详解 Claude Code 架构
- [[andrej-karpathy]] — AI researcher, former Tesla AI Director, OpenAI co-founder
- [[aparna-dhinakaran]] — AI engineering researcher, wrote "Sandboxes Are the Key to Unlocking Coding Agents"
- [[arize-alyx]] — Arize AI 及其内部 Agent Alyx，独立复现了四大 harness 的 context 管理模式
- [[barry-zhang]] — Anthropic engineer, co-author of "Building Effective Agents"
- [[birgitta-bockeler]] — Software engineer/consultant at Thoughtworks, wrote "Harness Engineering" on Martin Fowler's blog
- [[chaofa-yuan]] — 技术博主，撰写 AI agent engineering 和 LLM 基础设施文章
- [[chaoyue-he]] — Alibaba-NTU 研究者，CAR Framework 和 HarnessCard 论文作者
- [[chelsea-finn]] — Stanford professor, foundational work on meta-learning (MAML)
- [[erik-schluntz]] — Anthropic engineer, co-author of "Building Effective Agents"
- [[garry-tan]] — YC CEO，"Thin Harness, Fat Skills" 理念提出者
- [[geoffrey-huntley]] — 提出 Ralph 模式——用文件系统作为 AI 编码 Agent 的外部记忆
- [[gleb-rodionov]] — Yandex 研究者，研究 LLM 推理行为和 Reasoning Shift
- [[jinse-chuanshuo-dacongrming]] — 技术博主，通过爱马仕比喻解释 Harness 工程哲学
- [[justin-young]] — Anthropic engineer, authored "Effective Harnesses for Long-Running Agents"
- [[luongnv89]] — 开发者，创建 "Claude How To" 开源教程
- [[martin-fowler]] — Thoughtworks Chief Scientist, software engineering thought leader
- [[martin-kleppmann]] — 剑桥大学研究员，《设计数据密集型应用》作者
- [[msitarzewski]] — Agency Agents 开源项目创建者
- [[omar-khattab]] — AI researcher, creator of DSPy
- [[prithvi-rajasekaran]] — Anthropic Labs engineer, authored harness design research
- [[ralph]] — 自主 AI 编码 Agent 循环，反复调用 AI 工具直到 PRD 完成
- [[rosa]] — 技术博主，撰写 AI agent engineering 和工具使用文章
- [[ryan-carson]] — Ralph 自主 AI 编码 Agent 循环的作者
- [[scale-ai]] — AI 数据基础设施公司，发布 SWE-Atlas 等评测基准
- [[shashikant-jagtap]] — 创建 superagentic-metaharness Python 库
- [[thariq-shihipar]] — Anthropic MTS, working on Claude Code

## Projects

- [[claude-code-architecture]] — 《Claude Code from Source》18 章技术书，详解架构、模式与内部实现
- [[claude-code-harness]] — Claude Code Agent Harness，两层预读防护 + 工具结果优化管线
- [[claude-code-workflow]] — Claude Code 工作流与功能特性
- [[ddia]] — 《设计数据密集型应用》第二版，系统讲解现代数据系统的设计原则
- [[gbrain]] — Garry Tan 开源的 AI Agent 框架，实现 "Thin Harness, Fat Skills"
- [[harbor]] — laude-institute 开源任务运行框架，专为 AI Agent 评测基准设计
- [[letta-code]] — 开源 Agent harness，核心特色为 git 版本化 MemFS 持久记忆
- [[openclaw]] — 基于 Pi 的 Agent harness，纵深防御 context 管理
- [[pi-mono]] — 开源 Agent harness，OpenClaw 的上游
- [[swe-atlas]] — Scale AI 发布的 AI 编程 Agent 多维度评测基准

## Synthesis

- [[agentic-rag-as-harness]] — 将 Agentic RAG 用 harness engineering 框架重新设计，实现可控的智能检索
