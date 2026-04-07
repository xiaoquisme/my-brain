---
title: Coding Agents
created: 2026-04-07
updated: 2026-04-07
tags: [ai-agents, software-engineering, tools]
sources:
  - ../../sources/articles/martin-fowler-harness-engineering.md
  - ../../sources/articles/openai-harness-engineering.md
  - ../../sources/articles/anthropic-harness-design-long-running.md
  - ../../sources/articles/anthropic-effective-harnesses-long-running.md
related:
  - harness-engineering.md
  - llm-wiki-pattern.md
---

## Summary

AI agents that autonomously write, modify, and test code. Their effectiveness depends heavily on the "harness" — the controls, guides, and sensors surrounding the model. Key examples: Claude Code, Cursor, GitHub Copilot agent mode.

## Key Points

- Agents need both **feedforward** (guides like CLAUDE.md, architecture docs) and **feedback** (tests, linters, code review) controls
- **Harnessability** of a codebase matters: strong types, clear modules, framework abstractions make it easier for agents
- Agents provide **computational** (deterministic) and **inferential** (AI-based, probabilistic) execution
- Human developers still provide "implicit harness" — absorbed conventions, organizational alignment, experienced judgment
- The role of developers shifts from writing code to engineering the harness and validating high-level decisions
- **OpenAI Codex case study**: 3 engineers, 5 months, 1M lines, zero handwritten code — proof point for agent-first development at scale
- **Anthropic multi-agent harness**: Generator-Evaluator separation (GAN-inspired) for long-running tasks; self-evaluation bias is a real problem — agents overpaise their own work
- **Context anxiety**: Claude Sonnet 4.5 prematurely wraps work as context limits approach — context resets outperform compaction for long tasks
- **Harness simplification**: As models improve (Opus 4.6), harness scaffolding can be reduced — sprint decomposition removed when model handles longer coherence
- **Two failure modes for long tasks**: Over-ambition (context exhaustion mid-feature) and premature completion (sees progress, declares done)
- **Session continuity via files**: progress.txt + feature list JSON + init.sh = structured handoff between agent sessions

## Open Questions

- What's the right level of autonomy for different types of tasks?
- How to build reliable behaviour validation beyond test suites?
- How do coding agents change team structures and skill requirements?

---
## Evidence Timeline

- **2026-04-07**: Initial compilation from Böckeler's harness engineering article
- **2026-04-07**: Updated with OpenAI Codex case study data (1M lines, zero handwritten code)
- **2026-04-07**: Updated with Anthropic's multi-agent harness, context anxiety finding, and harness simplification insight
- **2026-04-07**: Updated with Justin Young's session continuity patterns — two failure modes and file-based handoff
