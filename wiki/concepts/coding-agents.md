---
title: Coding Agents
created: 2026-04-07
updated: 2026-04-07
tags: [ai-agents, software-engineering, tools]
sources:
  - ../../sources/articles/martin-fowler-harness-engineering.md
  - ../../sources/articles/openai-harness-engineering.md
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

## Open Questions

- What's the right level of autonomy for different types of tasks?
- How to build reliable behaviour validation beyond test suites?
- How do coding agents change team structures and skill requirements?

---
## Evidence Timeline

- **2026-04-07**: Initial compilation from Böckeler's harness engineering article
- **2026-04-07**: Updated with OpenAI Codex case study data (1M lines, zero handwritten code)
