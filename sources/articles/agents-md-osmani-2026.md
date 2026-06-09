---
title: Stop Using /init for AGENTS.md
source_url: https://addyosmani.com/blog/agents-md/
ingested: 2026-06-09
type: article
tags: [agent, coding-agents, context-management, harness-engineering]
sha256: 8ac4cf48e3e6d26573b332cc29bb1f9cbbbbcb314747283c8eed67828fa83b89
---

# Stop Using /init for AGENTS.md

作者：Addy Osmani | 2026-02-23

**TL;DR: A good mental model is to treat AGENTS.md as a living list of codebase smells you haven't fixed yet, not a permanent configuration. Auto-generated AGENTS.md files hurt agent performance and inflate costs by 20%+ because they duplicate what agents can already discover. Human-written files help only when they contain non-discoverable information - tooling gotchas, non-obvious conventions, landmines. Every other line is noise.**

## What the research actually says

Lulla et al. (ICSE JAWs 2026) ran a paired experiment: 124 real GitHub pull requests, with and without AGENTS.md. Found that AGENTS.md reduced median wall-clock runtime by 28.64% and output token consumption by 16.58%.

A separate study from ETH Zurich tested four agents across SWE-bench. Finding: LLM-generated context files reduced task success by 2-3% while increasing cost by over 20%. Developer-written files improved success by about 4% - but also increased cost by up to 19%.

Key insight from ETH Zurich: when they stripped all documentation from repos and then tested with LLM-generated context files, those files improved performance by 2.7%. The auto-generated content isn't useless. It's redundant. The agent could find all of it anyway by reading the repo.

The Lulla paper used human-authored AGENTS.md files with real project-specific knowledge. Non-obvious tooling requirements. Actual gotchas. That's the context that saves the agent time.

## The pink elephant problem

If your AGENTS.md mentions tRPC - even as a passing note - the model has tRPC in context for every prompt. If tRPC is only used in legacy endpoints, you've biased your agent toward the wrong pattern. LLMs don't distinguish between "this is what we used to do" and "this is what you should do."

Research on LLM context shows: more context often degrades performance. Liu et al.'s "Lost in the Middle" (2024) showed LLMs struggle with information in the middle of long contexts. Levy et al. showed longer context degrades task performance even when content is perfectly relevant.

## What actually earns a line

When a developer-written context file mentioned uv, agents used it 1.6 times per task. When not mentioned: fewer than 0.01 times. The practical filter: can the agent discover this on its own by reading your code? If yes, delete it.

AGENTS.md should contain:
- Use `uv` for package management
- Always run tests with `--no-cache` or you'll get false positives from fixture setup
- The auth module uses a custom middleware pattern; do not refactor to standard Express middleware
- The `legacy/` directory is deprecated but imported by three production modules - don't delete anything

And almost nothing else.

## The static file problem

A flat instruction set can't condition on what kind of task is being run. An agent doing a documentation change faithfully runs the full test suite. Tokens burned, minutes wasted.

The ACE framework (Agentic Context Engineering, ICLR 2026) treats context as an evolving playbook through a generator/reflector/curator pipeline. Outperformed static approaches by 12.3%.

## The better architecture: 3-layer AGENTS.md

**Layer 1: Protocol file** — Not a codebase overview. A routing document. Available personas and when to invoke them. Available skills and task classes. Available MCP connections. Minimum essential repo facts the agent genuinely cannot discover.

**Layer 2: Focused persona/skill files** — Each loaded selectively based on task type. UX-focused agent loads different context than backend agent. Total context per task stays bounded.

**Layer 3: Maintenance subagent** — Keeps the protocol file accurate as the codebase evolves. Documentation rots.

## Automated optimization

Arize AI's prompt learning work: instead of manually writing CLAUDE.md, they used an automated optimization loop — run agent on training tasks, evaluate output, generate LLM feedback on why solutions failed, use meta-prompting to refine instructions. Results: +5.19% accuracy on cross-repo split, +10.87% on in-repo split.

What helps a human understand a codebase and what helps an LLM navigate it are often different things. The optimizer figures out the delta.

## AGENTS.md as diagnostic tool

Think of AGENTS.md as a living document of friction you haven't fixed yet. Every line signals something confusing enough to trip an AI agent — probably confusing to new human contributors too. The right response isn't to grow the context file. It's to fix the actual problem.

Start nearly empty with one instruction: "If you encounter something surprising or confusing, flag it as a comment." Fix the underlying issues. Keep the file minimal.

## Practical takeaways

- Stop running /init. Auto-generated output is redundant with existing documentation.
- Before adding any line: can the agent find this by reading the code? If yes, don't write it.
- When an agent struggles repeatedly, treat it as a codebase problem before a context problem.
- If running agents at scale in CI/CD, the 15-20% cost overhead from context files compounds across thousands of runs.
- Consider building a maintenance agent for keeping context files accurate.
- Hold your intuitions about what the agent needs loosely.

Coding agents aren't new hires. They can grep the entire codebase before you finish typing. What they need isn't a map. They need to know where the landmines are.
