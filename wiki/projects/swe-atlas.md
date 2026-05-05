---
title: SWE-Atlas
created: 2026-04-28
updated: 2026-04-28
type: entity
tags: [benchmark, agent, swe-tool, open-source, dataset]
sources: [../../sources/articles/swe-atlas-github-2026.md]
confidence: medium
---

# SWE-Atlas

SWE-Atlas 是由 ../people/scale-ai.md 发布的 AI 编程 Agent 评测基准，覆盖软件开发生命周期中多种专业工程能力，而非单一孤立技能。

## 概述

- GitHub: https://github.com/scaleapi/SWE-Atlas
- 排行榜: https://labs.scale.com/leaderboard/sweatlas-qna 和 sweatlas-tw
- 与 ../concepts/swe-bench.md 等同类基准的区别：包含多个子榜，覆盖不同维度能力

## 两个子基准

### Codebase QnA (代码库问答)
- 任务数：496
- 类型：深度代码库理解与问答
- 代表任务类别：Code Onboarding（新人上手）
- 涉及真实开源仓库（如 Automattic/wp-calypso）
- Agent 需探索代码库，找出答案写入 /logs/agent/answer.txt

### Test Writing (测试编写)
- 任务数：360
- 类型：为给定代码编写高质量测试

## 任务结构

每个任务是一个独立文件夹，包含：

```
task-<id>/
  instruction.md        # 给 agent 的问题/任务
  task.toml             # 元数据（仓库、commit、Docker、资源）
  environment/
    Dockerfile          # 运行环境镜像
  solution/
    answer.txt          # 参考答案
    solve.sh            # 参考解法
  tests/
    evaluate_answer.py  # 自动评测脚本
    rubrics.json        # LLM judge 评分标准
    system_prompt.txt   # judge 系统提示
    user_prompt_template.txt
    test.sh
```

## 资源配置（QnA 典型）

- CPUs: 16
- RAM: 16 GB
- Storage: 20 GB
- GPU: 无
- 网络: 允许访问外网
- Agent 超时: 3 小时（10800s）
- Verifier 超时: 900s

## 评测流程

1. Agent 在 Docker 沙箱内探索代码库
2. 将答案写入 /logs/agent/answer.txt，用 `<<FINAL_ANSWER>>` 标签包裹
3. LLM Judge（Claude Opus 4.5）依据 rubrics.json 打分
4. 各任务得分汇总至排行榜

## 运行方式

依赖 harbor.md 框架和 ../concepts/modal.md 沙箱：

```bash
git clone https://github.com/laude-institute/harbor.git
cd harbor && uv tool install .

uv pip install modal && modal setup

bash run_config/tw/opus-4p6_claude-code.sh
```

## 相关实体

- ../people/scale-ai.md — 发布方
- harbor.md — 任务运行框架
- ../concepts/swe-bench.md — 同类基准，专注 bug 修复
- ../concepts/claude-code.md — 参考配置中使用的 agent

## 相关概念

- ../concepts/ai-coding-benchmark.md — 所属概念类别
- ../concepts/codebase-qna.md — 核心评测形式
- [[ai-coding-benchmark]], [[codebase-qna]], [[scale-ai]], [[ddia]], [[harbor]], [[openclaw]], [[pi-mono]]
