---
title: Using Claude Code - session management and 1M context
url: https://claude.com/blog/using-claude-code-session-management-and-1m-context
date_added: 2026-04-17
author: Thariq Shihipar
type: article
tags: [claude-code, session-management, context-window, compaction, context-rot, coding-agents]
---

How you manage sessions, context, and compaction in Claude Code shapes your results more than you might expect.

## Context, Compaction and Context Rot

The context window is everything the model can "see" at once when generating its next response. It includes your system prompt, the conversation so far, every tool call and its output, and every file that's been read. Claude Code has a context window of one million tokens.

Unfortunately, using context has a slight impact on performance, which is often called **context rot**. Context rot is the observation that model performance degrades as context grows because attention gets spread across more tokens, and older, irrelevant content starts to distract from the current task.

Context windows are a hard cutoff, so when you're nearing the end of the context window, the task you've been working on is automatically summarized into a smaller description and the model continues the work in a new context window. We call this **compaction**.

## Context Management Options

- **Continue** — send another message in the same session
- **/rewind (esc esc)** — jump back to a previous message and try again from there
- **/clear** — start a new session, usually with a brief you've distilled from what you just learned
- **Compact** — summarize the session so far and keep going on top of the summary
- **Subagents** — delegate the next chunk of work to an agent with its own clean context

## When to Start a New Session

When do you keep a long running session vs starting a new one? Our general rule of thumb is **when you start a new task, you should also start a new session**.

While 1M context windows mean that you can now do longer tasks more reliably, context rot may occur.

## Rewinding Instead of Correcting

Rewind is often the better approach to correction. For example, Claude reads five files, tries an approach, and it doesn't work. Your instinct may be to type "that didn't work, try X instead." But the better move may be to rewind to just after the file reads, and re-prompt with what you learned.

## Compacting vs. Launching a Fresh Session

- **/compact**: Asks the model to summarize the conversation so far, then replaces the history with that summary. It's lossy, but Claude might be more thorough. You can steer it with instructions: `/compact focus on the auth refactor, drop the test debugging`
- **/clear**: You write down what matters and start clean. It's more work, but the resulting context is what you decided was relevant.

## What Causes a Bad Autocompact?

Bad compacts can happen when the model can't predict the direction your work is going. Autocompact fires after a long debugging session and summarizes the investigation, but your next message is "now fix that other warning"—the warning might have been dropped from the summary.

With one million context, you have more time to /compact proactively with a description of what you want to do.

## Subagents and Fresh Context Windows

Subagents tend to work well when you know in advance that a chunk of work will produce a lot of intermediate output you won't need again.

When Claude spawns a subagent, that subagent gets its own fresh context window. It can do as much work as it needs to, and then synthesize its results so only the final report comes back to the parent.

**The mental test**: will I need this tool output again, or just the conclusion?

## Decision Table

| Situation | Consider reaching for | Why |
|------------|----------------------|-----|
| Same task, context is still relevant | Continue | Everything in the window is still load-bearing; don't pay to rebuild it |
| Claude went down a wrong path | Rewind (double-Esc) | Keep the useful file reads, drop the failed attempt, re-prompt with what you learned |
| Mid-task but session is bloated | /compact | Low effort; Claude decides what mattered. Steer it with instructions |
| Starting a genuinely new task | /clear | Zero rot; you control exactly what carries forward |
| Next step will generate lots of output | Subagent | Intermediate tool noise stays in child's context; only result comes back |
