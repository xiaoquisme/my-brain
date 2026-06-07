---
source_url: https://every.to/guides/compound-engineering
ingested: 2026-06-07
type: article
author: Kieran Klaassen (Every)
sha256: b7c9cbfc7a7589f31af83fc28152782caba159eb59382744aaff7686b73c23bf
---

# Compound Engineering — The AI-native engineering philosophy

**Author:** Kieran Klaassen, Every (every.to)
**Updated:** May 2026

Compound engineering emerged from building Cora, an AI chief of staff for your inbox, from scratch. As we battle-tested every pattern, agent, and workflow across many pull requests, we developed personal productivity hacks to make the work go faster. This, in turn, evolved into a systematic approach to AI-assisted development.

## The Philosophy

The core philosophy of compound engineering is that each unit of engineering work should make subsequent units easier — not harder.

Most codebases get harder to work with over time because each feature you add injects more complexity. After 10 years, teams spend more time fighting their system than building on it.

Compound engineering flips this on its head. Instead of features adding complexity and fragility, they teach the system new capabilities. Bug fixes eliminate entire categories of future bugs. When they are codified, patterns become tools for future work.

## The Main Loop

Every runs six products — Cora, Monologue, Proof, Sparkle, Spiral, and Every.to — with primarily single-person engineering teams. The system is a seven-step loop:

**Ideate → Brainstorm → Plan → Work → Review → Polish → Compound → Repeat**

Three phases:
1. **Beginning:** Human decides what is worth building
2. **Middle:** Agent plans, codes, tests, reviews, prepares the PR
3. **End:** Human judges whether result is good enough and whether the system learned anything reusable

### 1. Ideate (/ce-ideate)
Turns ambiguity into a shortlist of product options. Frame the search, point at sources (repo, issues, support tickets, Slack, usage data), generate broadly, score candidates, choose survivors.

### 2. Brainstorm (/ce-brainstorm)
Turns a promising idea into concrete requirements. Define the user, name the problem, set constraints, identify edge cases, define success, write the artifact.

### 3. Plan (/ce-plan)
Transforms an idea into a blueprint. Spawns three parallel research agents: repo-research-analyst, framework-docs-researcher, best-practices-researcher. Then spec-flow-analyzer merges results into a structured plan.

### 4. Work (/ce-work)
Agent implements the plan. Four phases: quick start (git worktree), execute (step-by-step), quality check (5+ reviewer agents), ship it (linting + PR).

### 5. Review (/ce-code-review)
Multiple specialized reviewers examine code in parallel. Findings marked P1/P2/P3. Captures patterns to prevent recurrence.

**Always-on reviewers:** Correctness, Testing, Maintainability, Project Standards, Agent-native, Learnings researcher

**Conditional reviewers:** Security, Performance, API contract, Data migrations, Reliability, Adversarial, CLI readiness, Previous comments

**Stack-specific:** Rails, Python, TypeScript, Frontend races, Swift/iOS

**Migration-specific:** Schema drift detector, Deployment verification agent

### 6. Polish (/ce-polish-beta)
Hands-on evaluation: start the app, click through the flow, look for what feels wrong (speed, animation, copy, empty states, visual glitches), queue fixes, judge readiness.

### 7. Compound (/ce-compound) — The Most Important Step
Traditional development stops before this step. The compound step produces a system that builds features better each time.

- **Capture the solution:** What worked? What didn't? What's the reusable insight?
- **Make it findable:** YAML frontmatter, tags, categories for retrieval
- **Update the system:** Add new patterns into CLAUDE.md, create new agents
- **Verify the learning:** Would the system catch this automatically next time?

## The Plugin

40+ specialized agents, 30+ slash entry points, 35+ skills. Works with Claude Code, Cursor, Codex, and others.

### Key Commands
- `/ce-ideate` — Ideation room full of agents
- `/ce-brainstorm` — Requirements brainstorming
- `/ce-plan` — Implementation planning with parallel research
- `/ce-work` — Agent implementation
- `/ce-code-review` — Multi-agent PR review
- `/ce-compound` — Document solved problems for future reference
- `/ce-compound-refresh` — Clean up stale CLAUDE.md learnings
- `/lfg` — "Let's fucking go" — chains plan → work → review → autofix → PR

### Where Things Live
```
your-project/
├── AGENTS.md or CLAUDE.md          # Agent instructions
├── .compound-engineering/           # Project config
├── .claude/launch.json             # Dev-server config
└── docs/
    ├── brainstorms/                 # Requirements docs
    ├── plans/                       # Implementation plans
    └── solutions/                   # Institutional knowledge
```

## Beliefs to Let Go

1. **"The code must be written by hand"** — Who types doesn't matter; clean tested code does
2. **"Every line must be manually reviewed"** — Fix the system, don't compensate by doing everything yourself
3. **"Solutions must originate from the engineer"** — Engineer's job is to add taste
4. **"Code is the primary artifact"** — A system that produces code > any individual piece of code
5. **"Writing code is the core job function"** — Ship value; code is just one input
6. **"First attempts should be good"** — 95% garbage rate on first attempts, 50% on second
7. **"Code is self-expression"** — The code was never really yours
8. **"More typing equals more learning"** — Understanding > muscle memory
9. **"The code is what matters"** — The system that produces it matters more
10. **"Engineering thinking is separate from product thinking"** — AI brings them closer together

## Beliefs to Adopt

- **Extract your taste into the system** — Write preferences in CLAUDE.md/AGENTS.md
- **The 50/50 rule** — 50% building features, 50% improving the system
- **Trust the process, build safety nets** — Guardrails > manual review
- **Make your environment agent-native** — If a developer can see/do something, the agent should too
- **Parallelization is your friend** — New bottleneck is compute, not attention
- **Plans are the new code** — Plan document is now the most important artifact
- **Engineers are product people now** — Choosing what to build > building
- **Let agents work while you are away** — Long-running orchestration

## Core Principles

1. Every unit of work makes subsequent work easier
2. Taste belongs in systems, not in review
3. Teach the system, don't do the work yourself
4. Build safety nets, not review processes
5. Make environments agent-native
6. Apply compound thinking everywhere
7. Embrace the discomfort of letting go
8. Ship more value. Type less code.
9. Assign outcomes, not tasks
10. Use long-running orchestration
11. Capture golden user data

## The 5 Stages

- **Stage 0:** Manual development — no AI
- **Stage 1:** Chat-based assistance — AI as smart reference
- **Stage 2:** Agentic tools with line-by-line review — gatekeeper mode
- **Stage 3:** Plan-first, PR-only review — compound engineering begins here
- **Stage 4:** Idea to PR (single machine) — involvement shrinks to ideation, PR review, merge
- **Stage 5:** Parallel cloud execution — commanding a fleet from anywhere

## Three Questions Without Tooling

1. "What was the hardest decision you made here?"
2. "What alternatives did you reject, and why?"
3. "What are you least confident about?"
