# Index

Content catalog for My Brain. One line per page, organized by category.

## Sources

- [什么是敏捷？](sources/articles/what-is-agile.md) — 敏捷宣言四个价值观、敏捷方法与实践、常见误解
- [什么是敏捷开发？](sources/articles/what-is-agile-development.md) — 敏捷开发关键成功因素：待办事项优化、CI/CD、最小化技术债务
- [什么是 Scrum？](sources/articles/what-is-scrum.md) — Scrum 框架：冲刺、团队角色、每日 Scrum、燃尽图
- [什么是看板？](sources/articles/what-is-kanban.md) — 看板四原则：可视化、拉取模型、WIP 限制、持续改进
- [采用敏捷文化](sources/articles/adopting-agile.md) — 敏捷文化要素：计划节奏、航运文化、健康团队
- [构建以客户为中心的高效团队](sources/articles/building-productive-teams.md) — 双机组系统：F-Crew 功能团队、C-Crew 客户团队
- [Karpathy - LLM Wiki](sources/articles/karpathy-llm-wiki.md) — LLM-maintained wiki pattern for personal knowledge bases
- [Garry Tan - GBrain](sources/articles/garry-tan-gbrain.md) — Full build spec for SQLite-based personal knowledge system
- [Böckeler - Harness Engineering](sources/articles/martin-fowler-harness-engineering.md) — Systematic controls for AI coding agents
- [OpenAI - Harness Engineering](sources/articles/openai-harness-engineering.md) — Codex case study: 1M lines, zero handwritten code
- [Anthropic - Harness Design](sources/articles/anthropic-harness-design-long-running.md) — Multi-agent GAN-inspired harness for long-running tasks
- [Anthropic - Effective Harnesses](sources/articles/anthropic-effective-harnesses-long-running.md) — Session continuity: feature lists, init scripts, incremental progress
- [Claude How To Guide](sources/articles/claude-howto-guide.md) — Structured guide to all Claude Code features with templates
- [Meta-Harness (Lee et al.)](sources/articles/meta-harness-optimization.md) — Automated harness search outperforming manual engineering
- [Meta-Harness Library (Jagtap)](sources/articles/meta-harness-library-jagtap.md) — Open-source Python library for harness optimization
- [Anthropic - Building Effective Agents](sources/articles/anthropic-building-effective-agents.md) — Six composable agentic patterns, simplicity-first design
- [rosa - Bash Tools for Agents](sources/articles/rosa-bash-tools-agents.md) — Coding as agent meta-ability, Bash tools for deterministic offloading
- [rosa - OpenClaw Architecture](sources/articles/rosa-openclaw-architecture.md) — Gateway, Agentic Loop, Skills, MCP, Memory, Heartbeat - core patterns of modern AI agents
- [Chaofa Yuan - Harness Engineering](sources/articles/yuanchaofa-harness-engineering.md) — Engineering hierarchy (prompt→context→harness), LangChain case study, transient vs persistent harness
- [Chaofa Yuan - KV Cache & Prompt Caching](sources/articles/yuanchaofa-kv-cache-prompt-caching.md) — KV Cache mechanics, Prefill/Decode phases, Prompt Caching prefix matching and Agent implications
- [Chaofa Yuan - Prompt Caching Design (上)](sources/articles/yuanchaofa-prompt-cache-design.md) — Cache 破坏、Prompt 布局与工具管理，三种 Agent 系统的 cache-aware 设计
- [Chaofa Yuan - Prompt Caching Design (下)](sources/articles/yuanchaofa-agent-context-management.md) — 上下文管理、子代理架构、The Bitter Lesson
- [金色传说大聪明 - 爱马仕：一家做了 189 年 Harness 的公司](sources/articles/hermes-harness-metaphor.md) — 用爱马仕的比喻理解 Harness 哲学：对齐、护栏、配货、克制、可溯源
- [Agency Agents](sources/articles/agency-agents.md) — 50+ specialized AI agent prompts for engineering, design, sales, marketing
- [Chaofa Yuan - RAG 进化之路](sources/articles/yuanchaofa-native-rag-to-agentic-rag.md) — 传统 RAG 到 Agentic RAG：工具驱动（Chatbox）与强化学习驱动（Search-R1）
- [Anthropic - Introducing Claude Opus 4.7](sources/articles/claude-opus-4-7.md) — Claude Opus 4.7 发布：编码基准提升13%、xhigh 努力级别、更高分辨率视觉
- [OpenAI - Codex for (almost) everything](sources/articles/codex-update-2026.md) — Codex 2026 更新：后台电脑使用、多代理并行、记忆功能、90+ 插件
- [Anthropic - Claude Code Session Management](sources/articles/claude-code-session-management.md) — Claude Code 1M 上下文管理：context rot、compaction、rewind、subagent
- [Reasoning Shift (Rodionov, 2026)](sources/articles/reasoning-shift-rodionov.md) — 上下文条件如何静默缩短 LLM 推理链（最多50%），自我验证行为显著减少
- [Aparna Dhinakaran - Sandbox: Server of Harness Era](sources/articles/2045925288908046570.md) — Sandbox 即 harness 的服务器，trajectory 是最有价值的 artifact
- [Garry Tan - How to really stop your agents from making the same mistakes](sources/articles/2046876981711769720.md) — Skillify practice: turning every failure into a permanent skill with tests, 10-step checklist
- [Garry Tan - Thin Harness, Fat Skills](sources/articles/thin-harness-fat-skills.md) — YC Spring 2026 演讲：五定义三层架构，skill 如方法调用，resolver 路由上下文


## Books

- [Claude Code from Source (Ch 1-18)](sources/books/claude-code-from-source/claude-code-from-source-ch01.md) — 18-chapter reverse-engineering of Claude Code's architecture from npm source maps
- [DDIA 第二版 - 序言](sources/books/ddia/ddia-preface.md) — 为何数据密集型应用如此重要，本书目标读者与纲要（共15章，577k字）

## Concepts

- [敏捷 (Agile)](wiki/concepts/agile.md) — 增量交付、团队协作、持续规划的软件开发方法论
- [Scrum](wiki/concepts/scrum.md) — 敏捷框架：冲刺、团队角色(PO/SM/Dev)、每日 Scrum、燃尽图
- [看板 (Kanban)](wiki/concepts/kanban.md) — 敏捷框架：可视化工作、拉取模型、WIP 限制、持续改进
- [LLM Wiki Pattern](wiki/concepts/llm-wiki-pattern.md) — Using LLMs to build and maintain structured knowledge bases
- [Harness Engineering](wiki/concepts/harness-engineering.md) — Feedforward + feedback controls for coding agents
- [Coding Agents](wiki/concepts/coding-agents.md) — AI agents that autonomously write and modify code
- [Ashby's Law](wiki/concepts/ashbys-law.md) — Requisite variety: regulator must match system complexity
- [Meta-Harness](wiki/concepts/meta-harness.md) — Automated search for optimal LLM harness configurations
- [Agentic Patterns](wiki/concepts/agentic-patterns.md) — Six composable patterns for LLM agent architecture
- [Tool Use as Meta-Ability](wiki/concepts/tool-use-as-meta-ability.md) — Coding/scripting as foundational agent capability for deterministic offloading
- [KV Cache and Prompt Caching](wiki/concepts/kv-cache-and-prompt-caching.md) — Inference acceleration: intra-request KV Cache + inter-request prefix caching
- [Agentic RAG](wiki/concepts/agentic-rag.md) — RAG evolution: from fixed pipeline to agent-driven adaptive retrieval
- [Claude Opus 4.7](wiki/concepts/claude-opus-4-7.md) — Anthropic 2026年4月发布的新模型，软件工程能力提升13%
- [OpenAI Codex 2026](wiki/concepts/openai-codex-2026.md) — OpenAI Codex 重大更新：后台电脑使用、多代理并行、记忆功能
- [Claude Code Session Management](wiki/concepts/claude-code-session-management.md) — Claude Code 1M token 上下文管理：context rot、compaction、rewind、subagent
- [Reasoning Shift](wiki/concepts/reasoning-shift.md) — 上下文条件静默压缩 LLM 推理链（最多50%），自我验证行为脆弱
- [Sandbox](wiki/concepts/sandbox.md) — Harness 的执行环境，类比服务器在传统应用中的角色
- [Skillify](wiki/concepts/skillify.md) — Practice of turning every AI agent failure into a permanent, tested skill
- [Thin Harness, Fat Skills](wiki/concepts/thin-harness-fat-skills.md) — Architectural pattern: minimal runtime + domain logic in markdown skills
- [Resolver](wiki/concepts/resolver.md) — Routing table mapping user intents to specific skills
- [Skill File](wiki/concepts/skill-file.md) — 可复用 Markdown 流程，教模型 HOW 而非 WHAT，像方法调用
- [Harness](wiki/concepts/harness.md) — 运行 LLM 的程序：循环、文件读写、上下文管理、安全执行
- [Latent vs Deterministic](wiki/concepts/latent-vs-deterministic.md) — 潜在空间（判断）vs 确定性（信任），架构分层原则
- [Diarization](wiki/concepts/diarization.md) — 读取多文档输出结构化摘要，AI 知识工作的核心能力

## People

- [Andrej Karpathy](wiki/people/andrej-karpathy.md) — AI researcher, proposed LLM Wiki pattern
- [Garry Tan](wiki/people/garry-tan.md) — YC CEO, building GBrain, introduced skillify practice and 10-step checklist
- [Martin Fowler](wiki/people/martin-fowler.md) — Software engineering thought leader, Thoughtworks
- [Birgitta Böckeler](wiki/people/birgitta-bockeler.md) — Author of harness engineering framework
- [Justin Young](wiki/people/justin-young.md) — Anthropic, session continuity harness for long-running agents
- [Prithvi Rajasekaran](wiki/people/prithvi-rajasekaran.md) — Anthropic Labs, GAN-inspired multi-agent harness design
- [luongnv89](wiki/people/luongnv89.md) — Creator of claude-howto tutorial (5,900+ stars)
- [Chelsea Finn](wiki/people/chelsea-finn.md) — Stanford professor, meta-learning (MAML), Meta-Harness co-author
- [Thariq Shihipar](wiki/people/thariq-shihipar.md) — Anthropic, Claude Code session management guide author
- [Omar Khattab](wiki/people/omar-khattab.md) — Creator of DSPy, Meta-Harness co-author
- [Shashikant Jagtap](wiki/people/shashikant-jagtap.md) — Creator of superagentic-metaharness library
- [Erik Schluntz](wiki/people/erik-schluntz.md) — Anthropic, co-author of "Building Effective Agents"
- [Barry Zhang](wiki/people/barry-zhang.md) — Anthropic, co-author of "Building Effective Agents"
- [rosa](wiki/people/rosa.md) — Technical writer, agent tool use and meta-ability
- [Chaofa Yuan](wiki/people/chaofa-yuan.md) — Technical writer, harness engineering hierarchy and co-evolution
- [金色传说大聪明](wiki/people/jinse-chuanshuo-dacongrming.md) — Tech blogger, harness engineering via Hermès metaphor
- [msitarzewski](wiki/people/msitarzewski.md) — Creator of Agency Agents (50+ specialized AI agent prompts)
- [Alejandro Balderas](wiki/people/alejandro-balderas.md) — Author of "Claude Code from Source" (18-chapter architecture book)
- [Martin Kleppmann](wiki/people/martin-kleppmann.md) — 剑桥大学研究员，DDIA 第一/二版作者，分布式系统与 CRDT 专家
- [Gleb Rodionov](wiki/people/gleb-rodionov.md) — Yandex 研究员，发现上下文条件静默压缩 LLM 推理链
- [Aparna Dhinakaran](wiki/people/aparna-dhinakaran.md) — AI 工程研究者，提出"Sandbox 是 harness 的服务器"，trajectory 是最有价值的 artifact

## Projects

- [Claude Code Workflow](wiki/projects/claude-code-workflow.md) — Feature composition and harness engineering mapping for Claude Code
- [Claude Code Architecture](wiki/projects/claude-code-architecture.md) — Full architectural analysis from "Claude Code from Source" book (18 chapters)
- [DDIA 第二版](wiki/projects/ddia.md) — 设计数据密集型应用第二版综合笔记：存储引擎、分布式事务、流式处理全书14章精华
- [GBrain](wiki/projects/gbrain.md) — Open-source knowledge engine for AI agents with skill verification and quality gates

## Synthesis

- [Agentic RAG as Harness](wiki/synthesis/agentic-rag-as-harness.md) — 用 harness engineering 框架重设计 Agentic RAG：可控检索 + RL 训练数据桥梁
