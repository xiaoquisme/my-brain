---
title: Building Effective Agents
url: https://www.anthropic.com/engineering/building-effective-agents
date_added: 2026-04-07
type: article
author: [Erik Schluntz, Barry Zhang]
tags: [ai-agents, agentic-patterns, software-engineering]
---

# Building Effective Agents

Published: 2024-12-19
Authors: Erik Schluntz, Barry Zhang (Anthropic)

## Overview

Anthropic shares insights from working with dozens of teams building LLM agents across industries. The key finding: the most successful implementations use simple, composable patterns rather than complex frameworks.

## Key Distinction: Workflows vs Agents

- **Workflows**: LLMs and tools orchestrated through predefined code paths
- **Agents**: Systems where LLMs dynamically direct their own processes and tool usage

## When to Use Agents

Start with the simplest solution possible. Agentic systems trade increased latency and cost for better task performance. Workflows suit well-defined tasks, while agents excel when flexibility and model-driven decision-making are needed at scale.

## Six Core Agentic Patterns

### 1. Augmented LLM
Enhanced with retrieval, tools, and memory capabilities. The basic building block — an LLM with access to external capabilities.

### 2. Prompt Chaining
Decomposing tasks into sequential steps with programmatic checks between them. Each step processes the output of the previous one. Good for tasks that can be cleanly decomposed into fixed subtasks.

### 3. Routing
Classifying inputs and directing them to specialized follow-up tasks. A single LLM decides which path to take, then routes to specialized handlers.

### 4. Parallelization
Running LLM tasks simultaneously through:
- **Sectioning**: Breaking a task into independent subtasks run in parallel
- **Voting**: Running the same task multiple times for diverse outputs or consensus

### 5. Orchestrator-Workers
A central LLM dynamically breaks down tasks and delegates to worker LLMs. Unlike prompt chaining, the subtasks are not predetermined — the orchestrator decides based on the input.

### 6. Evaluator-Optimizer
One LLM generates responses while another provides evaluation and feedback in a loop. Similar to the GAN pattern. The loop continues until the evaluator is satisfied or a max iteration count is reached.

## Agent Implementation

True agents operate autonomously based on environmental feedback loops. They require:
- Clear success criteria
- Feedback loops for course correction
- Meaningful human oversight at appropriate checkpoints

## Three Core Principles

1. **Simplicity** — maintain simplicity in agent design
2. **Transparency** — show planning steps explicitly
3. **Agent-Computer Interface (ACI)** — craft thorough tool documentation and testing

## Tool Design Best Practices

Tool definitions deserve equal prompt engineering attention as overall prompts. Effective tool formats should:
- Provide sufficient tokens for model reasoning
- Mirror natural language patterns
- Eliminate unnecessary formatting overhead
- Include example usage and clear boundaries

Anthropic spent more optimization time on tools than overall prompts when building their SWE-bench agent.

## Practical Applications

### Customer Support
Combines chatbot interfaces with tool integration for data retrieval, ticket updates, and refund processing with measurable resolution metrics.

### Coding Agents
Leverage automated testing for verification and iteration. Agents now solve GitHub issues in SWE-bench, though human review remains essential.
