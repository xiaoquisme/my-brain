---
title: Arize AI & Alyx Agent
created: 2026-04-28
updated: 2026-04-28
tags: [company, agent]
sources: [../../sources/articles/aparna-context-management-agent-harnesses-2026.md]
related:
  - ../concepts/agent-context-management.md
  - ../projects/claude-code-harness.md
  - ../projects/openclaw.md
---

# Arize AI

Arize AI is an AI observability company founded by Aparna Dhinakaran and based in Berkeley, CA. It is a Y Combinator alum. Website: arize.com.

**Key people**: Aparna Dhinakaran ([@aparnadhinak](https://x.com/aparnadhinak)) — founder, posts about agents and evals.

## Alyx: Arize's In-Product Agent

Alyx is Arize's internal agent, built for **data exploration** (not code editing). Despite being in a different domain from the four coding harnesses analyzed, it independently converged on the same ../concepts/agent-context-management.md patterns:

| Pattern | Alyx implementation |
|---|---|
| Tool result cap | 10,000 tokens |
| Idempotent call deduplication | Prunes repeated previews from conversation history, keeps only the most recent |
| Large payload splitting | Binary search to find largest dataset slice that fits; JSON → LLM-visible preview + full server-side copy the model can drill into via jq |
| Truncation | Head+tail with back-references to full content |
| Token pressure estimation | char/4 heuristic |
| Checkpoint trigger | 50,000 tokens — model writes its own state summary before history is pruned |
| Subagent isolation | Same isolation pattern as the four coding harnesses |

This convergence — a data exploration agent arriving at the same context management playbook as four coding agents — is cited as evidence that these patterns are not domain-specific but fundamental to agent harness design.
