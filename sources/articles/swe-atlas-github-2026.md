---
source_url: https://github.com/scaleapi/SWE-Atlas/tree/main
ingested: 2026-04-28
sha256: 4f0645c62de71e7fa294c954dab33c99ddf363c1f54ad9287e7dce80eb8586d1
---

# SWE-Atlas README

SWE-Atlas is a benchmark for evaluating AI coding agents across a spectrum of professional software engineering tasks. Rather than measuring a single skill in isolation, SWE-Atlas consists of multiple leaderboards that target distinct and complementary capabilities in the Software Development Cycle.

This repository has the data and instructions on running SWE Atlas - Codebase QnA (https://labs.scale.com/leaderboard/sweatlas-qna) and SWE Atlas - Test Writing (https://labs.scale.com/leaderboard/sweatlas-tw)

## Repository Structure

- data/qa/ — 496 Codebase QnA tasks
- data/tw/ — 360 Test Writing tasks
- run_config/ — Example configs for running benchmarks

## Requirements

- harbor (https://github.com/laude-institute/harbor) — task runner framework
- Modal — sandbox environment execution
- ANTHROPIC_API_KEY — for the agent under evaluation
- OPENAI_API_KEY + OPENAI_API_BASE — for the LLM judge (Claude Opus 4.5 used as judge)

## Task Structure (QnA example)

Each task folder contains:
- instruction.md — the question/task given to the agent
- task.toml — metadata (repo, base_commit, Docker image, resource limits, timeouts)
- environment/Dockerfile — Docker image spec
- solution/answer.txt + solve.sh — reference solution
- tests/evaluate_answer.py — evaluator script
- tests/rubrics.json — rubric for LLM judge
- tests/prompt.txt / system_prompt.txt / user_prompt_template.txt — judge prompts
- tests/test.sh — test runner

## Task Categories (QnA sample)

- category: "Code Onboarding" — agents answer deep codebase comprehension questions
- Repos covered: e.g. Automattic/wp-calypso, and many others
- Agent timeout: 10800s (3 hours) per task
- Verifier timeout: 900s
- Resources: 16 CPUs, 16GB RAM, 20GB storage, no GPU, internet allowed

## Evaluation

- Agent writes answer to /logs/agent/answer.txt wrapped in <<FINAL_ANSWER>> tags
- LLM judge (Claude Opus 4.5) grades using rubrics.json
- Scores aggregated per leaderboard

## Run Command

bash run_config/tw/opus-4p6_claude-code.sh

## Dataset on Harbor

- QnA dataset: scale-ai/swe-atlas-qna (496 tasks)
- TW dataset: scale-ai/swe-atlas-tw (360 tasks)
- Published via harbor CLI tool from laude-institute/harbor
