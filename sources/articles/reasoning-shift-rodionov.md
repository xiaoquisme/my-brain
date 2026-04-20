---
title: "Reasoning Shift: How Context Silently Shortens LLM Reasoning"
url: https://arxiv.org/abs/2604.01161
date_added: 2026-04-20
type: paper
tags: [reasoning, llm, context-management, test-time-scaling]
author: Gleb Rodionov (Yandex)
---

# Reasoning Shift: How Context Silently Shortens LLM Reasoning

**Authors:** Gleb Rodionov (Yandex)
**Date:** 2026-04-01
**arXiv:** 2604.01161 [cs.LG]
**Status:** Preprint, work in progress

## Abstract

Large language models (LLMs) exhibiting test-time scaling behavior, such as extended reasoning traces and self-verification, have demonstrated remarkable performance on complex, long-term reasoning tasks. However, the robustness of these reasoning behaviors remains underexplored. The authors conduct a systematic evaluation of multiple reasoning models across three scenarios: (1) problems augmented with lengthy, irrelevant context; (2) multi-turn conversational settings with independent tasks; and (3) problems presented as a subtask within a complex task.

Key finding: reasoning models tend to produce much shorter reasoning traces (up to 50%) for the same problem under different context conditions compared to isolation. This compression is associated with a decrease in self-verification and uncertainty management behaviors.

## Key Findings

### The Reasoning Shift Phenomenon

- Same problem, different context → reasoning traces shrink up to 50%
- Models produce significantly fewer reasoning tokens under non-isolated conditions
- Even short distractions (hundreds of tokens) reduce average reasoning length by 18%
- Further increasing prompt size reduces reasoning by 50%

### Three Experimental Scenarios

1. **Long input**: Problem augmented with lengthy, irrelevant context
2. **Multi-turn**: Multi-turn conversational settings with independent tasks
3. **Subtask**: Problem presented as a subtask within a complex task

### Models Tested (IMOAnswerBench)

| Model | Baseline Acc | Subtask Acc | Long Input Acc | Multi-turn Acc |
|-------|-------------|-------------|----------------|----------------|
| Qwen-3.5-27B | 74.5% | 62.4% | 67.8% | 67.0% |
| GPT-OSS-120B | 73.8% | 64.0% | 64.0% | 69.3% |
| Gemini 3 Flash Preview | 82.8% | 67.0% | 80.3% | 82.5% |
| Kimi K2 Thinking | 74.8% | 65.0% | 70.8% | 72.8% |

### Reasoning Token Reduction

| Model | Baseline Tokens | Subtask Tokens | Long Input Tokens | Multi-turn Tokens |
|-------|----------------|----------------|-------------------|-------------------|
| Qwen-3.5-27B | 28,771 | 20,165 | 16,415 | 17,404 |
| GPT-OSS-120B | 24,180 | 17,408 | 11,876 | 19,831 |
| Gemini 3 Flash Preview | 23,090 | 13,653 | 19,879 | 21,693 |
| Kimi K2 Thinking | 29,615 | 19,630 | 23,380 | 30,421 |

### Analysis of WHY

- Models don't get confused by irrelevant context — they dismiss it immediately
- First answer candidate position is nearly identical (925 vs 939 tokens on average)
- The difference is in **post-answer verification**: models stop checking sooner
- Transition from "final answer emission → end of thinking" increases from 57% (Baseline) to 68% (Long input)
- Self-verification words ("wait", "alternatively", "but", "maybe") all decrease significantly

### Resampling Experiment

Same reasoning prefixes, different context conditions:
- </think> end ratio: Baseline 21% vs Long input (64k tokens) 46%
- "Wait": 11% vs 5%
- "Alternatively": 17% vs 5%
- "But": 46% vs 20%
- "Maybe": 23% vs 9%

### Thinking vs Non-Thinking Mode

Qwen3.5-27B on MATH500:
- Non-thinking mode: 19% response length reduction
- Thinking mode: 53% reasoning length reduction
- The phenomenon is markedly more pronounced in thinking mode

### Post-Training Stage Analysis (Olmo3)

The reasoning shift phenomenon observed across all reasoning checkpoints (SFT, DPO, and final Think model). The instruct (non-thinking) model shows minimal effect.

## Implications

1. **For agent systems**: Long-running agents accumulate context → reasoning quality degrades silently
2. **For context management**: Context compaction and subagent delegation become even more important
3. **For benchmarks**: Evaluating reasoning models in isolation may overestimate real-world performance
4. **For RL training**: The self-verification behavior learned through RL is fragile and context-dependent
