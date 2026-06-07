---
source_url: https://x.com/alokbishoyi97/status/2063193533930942605
ingested: 2026-06-07
type: article
tags: [autoresearch, harness, fine-tuning, benchmark, open-source]
sha256: 057e27d9b46c693bd10956a953aa82393e3256361f84e94b45c83b660493bfbf
---

Every agentic system is two things stacked together: a model, and the harness around it - the prompts, the scaffold, the skills, the way an answer gets pulled out and checked. Both are parameter spaces. Both decide how well the system does its job.

A lot of autoresearch systems, until recently, moved one or the other - but not both. Some tune the harness: the prompts and skills, the markdown layer wrapped around the model. Others train the model: RL or fine-tuning on the weights. Almost none do both in the same loop, against the same objective. Which means you were always optimizing half the system and hoping the other half wasn't where the real gain was hiding

## what evo is

evo is an opensource autoresearch orchestrator. You give it a system, a definition of "better," and a budget. It generates hypotheses, runs each one in its own isolated workspace, scores the result, and keeps a tree of attempts - extending what works, pruning what doesn't while an auditor checks every accepted change so the optimizer can't game the metric.

Teams already point it at their own systems - improving system code for performance, latency, and cost, and updating agentic harnesses, prompts, and skills - and let it run until the metric they care about moves. Its opensource and works across Claude Code, Codex, Cursor, and other hosts.

## where evo is headed

A couple of weeks ago I posted where evo was going next:

Now it's true. With evo v0.5, the loop does both - it can fine-tune the model weights and rewrite the harness in one run, against one objective, deciding for itself what to spend the budget on.

Concretely: evo can now fine-tune any open-source model you're using in your system — SFT, LoRA, RL — as one of the moves on the table, right alongside everything it already did to the prompts, scaffold, and skills.

## why you would want both

The model and the harness cover for each other. A failure you might chase with a training run is often cheaper to fix with a better prompt or a retrieval step — and just as often it's the other way around. You rarely know which ahead of time.

Here's how we think about the leverage of an agentic system:

> base model × harness × a verifiable loop

Three factors, multiplied. For years only the first one moved on any cadence — a new model dropped and everything downstream shifted with it. The other two were yours, but hard to move systematically. A self-improving loop is what makes them move: point it at the harness and the weights, against an objective you can actually verify, and it works the whole product instead of one factor of it. Move only one lever and you're optimizing half the system, hoping the other half wasn't where the score was hiding.

To make that concrete, we wanted a hard target where someone had already planted a flag.

## a claim to test (LawBench)

Recently, a well funded startup's launch went viral on X for their self improving systems and their reported scores on LawBench. The task is simple to state: read a Chinese criminal case and pick the right charge, one out of 191. They reported 0.701, and they got there by training the weights of a 120B open model. For comparison, the previous best was 0.450, and a plain agent scores 0.173.

We based our setup on the exact one the other org published — same benchmark, same train/test split, same grader, and the same 120B model available to train. No head start for evo: just the cases, the grader, and one instruction - get the highest score, any way you can.

## what evo did

We handed evo the task and walked away. It ran the whole thing itself: pick an approach, build it, score it, branch off whatever worked, repeat. Forty experiments later it had fine-tuned the 120B model, built and tuned a series of classifiers, and raced them against each other in a search tree - keeping winners, pruning the rest.

It came back with a new best on the benchmark: **0.7766**.

- **0.173** : a plain agent, no tuning
- **0.450** : the previous record
- **0.701** : the viral launch from another system (after training a 120B model)
- **0.776** : evo - new best

That clears the other viral launch's numbers of 0.701, and beats it -- start to finish, with no one steering it

## occam's razor

evo did try the expensive end of the space. It fine-tuned the 120B model - multiple LoRA runs. The gains weren't there: the fine-tuned model on its own scored low and every attempt to lean on it just fell back to the rest of the pipeline. So evo pruned it.

The solution evo eventually landed on has no LLM in it at all -- a lean classical pipeline that runs in a low end machine with no GPU. It tried the expensive end of the space, found it didn't pay, and settled on the simplest thing that fit the data.

Occam's razor, found by search instead of assumed up front. The loop's job isn't to build the most powerful system you can imagine - it's to find the simplest one that wins, and to prove the rest wasn't worth it.

## why this matters

evo doesn't decide up front where the score will come from. It searches across the whole space -- model and harness -- and returns the best solution it finds, not the flashiest. Here that meant skipping the 120B fine-tune everyone reaches for first, and shipping a simple classifier that scored higher.

## it's all open

The whole thing is open source - evo itself, the benchmark and its grader, the winning harness, and the full run. We're putting the entire run up on a shared evo page: every experiment, every hypothesis the loop tried, the scores, and the live dashboard, the same way we shared the last one. You can re-run the winning solution and check the number yourself.

Point the loop at your own stack - prompts, harness, weights - and let it find the leverage. That's the objective for evo : to be the best open source platform for anyone to build a self-improving system.

[evo (open source)](https://github.com/evo-hq/evo) · [the LawBench benchmark](https://github.com/evo-hq/evo-posttrainbench/tree/evo-variant/src/eval/tasks/lawbench) · [the full run](https://evo-hq.com/shared/x/2jlp466ok9/)

Special thanks to @vishnuvig and jarvislabs.ai for helping with compute needed for the experiment runs. For folks interested in setting up similar autoresearch loops in your organization with the best practices, reach out at hello@evo-hq.com
