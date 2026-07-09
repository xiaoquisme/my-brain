---
title: "Harness Engineering for Self-Improvement"
source_url: https://lilianweng.github.io/posts/2026-07-04-harness/
ingested: 2026-07-08
type: article
tags: [harness, self-improvement, agent, auto-research, evolutionary-search, context-engineering, recursive-self-improvement]
sha256: 761d3ab3ded9bf88ccf4ad2dcd69f5f771421e22f58ccd79e1283b6bd8ea2307
---

# Harness Engineering for Self-Improvement

**Author:** Lilian Weng
**Date:** July 4, 2026
**Reading Time:** 28 min
**Tags:** language-model, agent, auto-research, self-improvement, prompting

## Abstract

The concept of recursive self-improvement (RSI) dates back to I. J. Good (1965). This post focuses on research around harness engineering and how it contributes to RSI. A **harness** is the system surrounding a base model that orchestrates execution and decides how the model thinks and plans, calls tools and acts, perceives and manages context, stores artifacts, and evaluates results.

## Harness Design Patterns

Compared with early agent frameworks ("agent = LLM + memory + tools + planning + action"), harness engineering additionally includes workflow design (e.g. loop engineering), evaluation, permission controls, and persistent state management.

### Pattern 1: Workflow Automation
- Goal-oriented loop: plan → execute → observe/test → improve → execute again
- Example: Karpathy's autoresearch repo
- Model analyzes its own trajectories and failure cases via "agent runtime"

### Pattern 2: File System as Persistent Memory
- Harness should keep durable state in files, not carry everything in context
- File read/write/edit via bash is a foundation skill for LLMs

### Pattern 3: Sub-agent and Backend Jobs
- Spawn multiple subagents in parallel, monitor backend jobs
- Key: make parallelism explicit and inspectable (store as files/logs)

### Case Study: Coding Agent Harness
- Stabilized across Claude Code, Codex, OpenCode, Cursor
- Tool groups: File system, Shell, IO (lsp, git), External context (MCP, Skills), Web search, Artifacts, Backend processes, Agent delegation

### Harness Layer vs Core Intelligence?
- Near-term RSI unlikely to start as model rewriting weights directly
- Prediction: harness engineering evolves toward meta-methodology
- Harness improvements may eventually be internalized into model behavior, but external interface remains

## Harness Optimization

Progression: instruction prompts → structured context → workflow → harness code → optimizer code

### Context Engineering
- **ACE (Agentic Context Engineering; Zhang et al. 2025)**: context as evolving playbook with Generator, Reflector, Curator; structured bullets merged deterministically
- **MCE (Meta Context Engineering; Ye et al. 2026)**: separates mechanism (how to manage context) from artifact content; bi-level optimization — inner optimizes context given skill, outer optimizes skill; uses free-form skills stored as files
- **Meta-Harness (Lee et al. 2026)**: optimized object is the code that determines what info to store/retrieve; proposer is itself a coding agent; Pareto frontier of harness candidates

### Workflow Design
- **AI Scientist (Lu et al. 2026)**: pipeline for idea generation → code → experiments → paper → peer review
- **ScientistOne (Meng et al. 2026)**: verifiability as central design, Chain-of-Evidence checks
- **Autodata (Kulikov et al. 2026)**: challenger/weak solver/strong solver/verifier roles for synthetic data
- **ADAS (Hu et al. 2025)**: meta-agent search, agent design as optimization problem
- **AFlow (Zhang et al. 2025)**: workflow as graph, MCTS optimization

### Self-Improving Harness
- Code is universal language for defining programs/systems
- **STOP (Zelikman et al. 2023)**: recursive scaffolding improvement — improve the improver itself; discovered strategies like genetic algorithms, simulated annealing; caution: only works with capable base models
- **Self-Harness (Zhang et al. 2026)**: propose-evaluate-accept loop; learns model-specific harness instructions

### Evolutionary Search
- **Promptbreeder (Fernando et al. 2023)**: optimize prompts through mutation, mutation prompts also evolve
- **GEPA (Agrawal et al. 2025)**: reflection + evolutionary search
- **AlphaEvolve (Novikov et al. 2025)**: coding-agent evolutionary search, EVOLVE-BLOCK markers, meta-prompt co-evolution
- **ThetaEvolve (Wang et al. 2025)**: evolutionary search + RL + ICL
- **ShinkaEvolve (Lange et al. 2025)**: sample-efficient exploration, code-novelty rejection, meta-scratchpad
- **Darwin Gödel Machine (Zhang et al. 2025)**: evolution of editable harness-code; agent modifies its own harness
- **Hyperagents (Zhang et al. 2026)**: meta-agent controls how to modify task agents

### Joint Optimization with Model Weights
- **SIA (Hebbar et al. 2026)**: Meta-Agent + Task-Specific Agent + Feedback-Agent; combines harness improvement and model-parameter updates

## Future Challenges
- AI Scientist can write papers but not necessarily do real science
- Paper production ≠ scientific discovery
- Reward hacking remains open
- Permission control and security layers needed outside self-improvement loops
- Compute efficiency of evolutionary methods

## Key Benchmarks
- PaperBench, RE-Bench, MLE-bench, ScienceAgentBench, CORE-Bench, KernelBench, TerminalBench, AIDE/Kaggle
