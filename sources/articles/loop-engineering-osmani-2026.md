---
title: Loop Engineering
source_url: https://addyosmani.com/blog/loop-engineering/
ingested: 2026-06-09
type: article
tags: [agent, coding-agents, harness-engineering, workflow]
sha256: 2b270c2a3973e8d40fbf155cc4b41cb7035110cc933878b8707aab69f2b2b27e
---

# Loop Engineering

作者：Addy Osmani | 2026-06-07

**Loop engineering is replacing yourself as the person who prompts the agent. You design the system that does it instead.** A loop here can be thought of a recursive goal where you define a purpose and the AI iterates until complete.

Peter Steinberger recently said: "You shouldn't be prompting coding agents anymore. You should be designing loops that prompt your agents." Similarly, Boris Cherny, head of Claude Code at Anthropic, said "I don't prompt Claude anymore. I have loops running that prompt Claude and figuring out what to do. My job is to write loops".

For like two years the way you got something out of a coding agent was you wrote a good prompt and shared enough context. You type a thing, you read what came back, you type the next thing. The agent is a tool and you are holding it the entire time, one turn after the other. That part is kind of over, or at least some think it's going to be.

Now you build a small system that finds the work, hands it out, checks it, writes down what is done and then decides the next thing, and you let that system poke the agents instead of you. I wrote before about the cousin of this, agent harness engineering, which is making the environment one single agent runs inside and the factory model - the system that builds the software. Loop engineering sits one floor above the harness. The harness but it runs on a timer, it spawns little helpers, and it feeds itself.

## The five pieces, and then notes

A loop needs five things and then one place to remember stuff.

- **Automations** that go off on a schedule and do discovery and triage by themselves.
- **Worktrees** so two agents working in parallel don't step on each other.
- **Skills** to write down the project knowledge the agent would otherwise just guess.
- **Plugins and connectors** to plug the agent into the tools you already use.
- **Sub-agents** so one of them has the idea and a different one checks it.

Then the sixth thing, the memory. A markdown file, or a Linear board, anything that lives outside the single conversation and holds what's done and what is next. The model forgets everything between runs so the memory has to be on disk and not in the context. The agent forgets, the repo doesn't.

Both products (Codex app and Claude Code) have all five now.

| Primitive | Job in the loop | Codex app | Claude Code |
|-----------|----------------|-----------|-------------|
| **Automations** | discovery + triage on a schedule | Automations tab: pick project, prompt, cadence, environment; results land in Triage inbox; /goal for run-until-done | Scheduled tasks and cron, /loop, /goal, hooks, GitHub Actions |
| **Worktrees** | isolate parallel features | Built-in worktree per thread | git worktree, --worktree, isolation: worktree on a subagent |
| **Skills** | codify project knowledge | Agent Skills (SKILL.md), invoked with $name or implicitly | Agent Skills (SKILL.md) |
| **Plugins / connectors** | connect your tools | Connectors (MCP) plus plugins for distribution | MCP servers plus plugins |
| **Sub-agents** | ideate and verify | Subagents defined as TOML in .codex/agents/ | Task subagents in .claude/agents/, agent teams |
| **State** | track what's done | Markdown or Linear via a connector | Markdown (AGENTS.md, progress files) or Linear via MCP |

## Automations, this is the heartbeat

Automations are what make a loop an actual loop and not just one run you did once. In the Codex app you make one in the Automations tab and you pick the project, the prompt it will run, how often, and if it runs on your local checkout or on a background worktree. The runs that find something go to a Triage inbox, and the runs that find nothing just archive themselves. OpenAI uses them internally for daily issue triage, summarising CI failures, writing commit briefings, hunting bugs. An automation can call a skill, so you fire $skill-name instead of pasting a giant wall of instructions into a schedule.

Claude Code gets to the same place through scheduling and hooks. You can run a prompt or a command on an interval with /loop, schedule a cron task, fire shell commands at certain points in the agent lifecycle with hooks, or push to GitHub Actions.

/re-run on a cadence. /goal keeps going until a condition you wrote is actually true, and after every turn a separate small model checks whether you are done, so the agent that wrote the code isn't the one grading it. Codex has the same thing, also called /goal.

## Worktrees so parallel doesn't turn into chaos

Two agents writing the same file is the exact same headache as two engineers committing to the same lines. A git worktree fixes it: a separate working directory on its own branch sharing the same repo history. Codex builds worktree support right in. Claude Code gives you git worktree, a --worktree flag, and isolation: worktree on a subagent.

## Skills, so you stop explaining your project every single time

A skill is how you stop re-explaining the same project context every session. Both tools use the same format: a folder with a SKILL.md inside holding instructions and metadata, then optional scripts, references, assets. Skills are also where intent stops costing you over and over — an agent starts every session cold and fills any hole in intent with a confident guess. A skill is that intent written down.

The skill is the authoring format and a plugin is how you ship it.

## Plugins and connectors, the loop touches your real tools

Connectors (built on MCP) let the agent read your issue tracker, query a database, hit a staging API, drop a message in Slack. Codex and Claude Code both speak MCP. Plugins bundle connectors and skills together.

## Sub-agents, keep the maker away from the checker

The most useful structural thing in a loop: splitting the one who writes from the one who checks. The model that wrote the code is way too nice grading its own homework. A second agent catches the stuff the first one talked itself into.

Codex: define agents as TOML in .codex/agents/. Claude Code: subagents in .claude/agents/ and agent teams. The usual split: one agent explores, one implements, one verifies.

## What one loop looks like

An automation runs every morning on the repo. Its prompt calls a triage skill that reads yesterday's CI failures, the open issues, the recent commits, and writes findings into a markdown file or Linear board. For each finding that is worth doing, the thread opens an isolated worktree and sends a sub-agent to draft the fix, and a second sub-agent reviews that draft against the project skills and existing tests. Connectors let the loop open the PR and update the ticket. Anything the loop can not handle lands in the triage inbox.

## What the loop still does not do for you

The loop changes the work, it does not delete you from it. Three problems get sharper as the loop gets better:

1. **Verification is still on you.** A loop running unattended is also a loop making mistakes unattended.
2. **Your understanding still rots if you allow it.** That's comprehension debt — the faster the loop ships code you did not write, the bigger the gap between what exists and what you actually get.
3. **The comfortable posture is the dangerous one.** Cognitive surrender: when the loop runs itself it's tempting to stop having an opinion.

## Build the loop. Stay the engineer.

Two people can build the exact same loop and get completely opposite results. One uses it to move faster on work they understand deeply. The other uses it to avoid understanding the work at all. The loop doesn't know the difference. You do.

That's what makes loop design harder than prompt engineering, not easier. Cherny's point isn't that the work got easier. It's that the leverage point moved.
