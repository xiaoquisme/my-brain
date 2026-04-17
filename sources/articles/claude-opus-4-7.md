---
title: Introducing Claude Opus 4.7
url: https://www.anthropic.com/news/claude-opus-4-7
date_added: 2026-04-17
author: Anthropic
type: article
tags: [anthropic, claude, llm, coding-models, multimodal]
---

Our latest model, Claude Opus 4.7, is now generally available.

Opus 4.7 is a notable improvement on Opus 4.6 in advanced software engineering, with particular gains on the most difficult tasks. Users report being able to hand off their hardest coding work—the kind that previously needed close supervision—to Opus 4.7 with confidence. Opus 4.7 handles complex, long-running tasks with rigor and consistency, pays precise attention to instructions, and devises ways to verify its own outputs before reporting back.

The model also has substantially better vision: it can see images in greater resolution. It's more tasteful and creative when completing professional tasks, producing higher-quality interfaces, slides, and docs. And—although it is less broadly capable than our most powerful model, Claude Mythos Preview—it shows better results than Opus 4.6 across a range of benchmarks.

Last week we announced Project Glasswing, highlighting the risks—and benefits—of AI models for cybersecurity. We stated that we would keep Claude Mythos Preview's release limited and test new cyber safeguards on less capable models first. Opus 4.7 is the first such model: its cyber capabilities are not as advanced as those of Mythos Preview (indeed, during its training we experimented with efforts to differentially reduce these capabilities). We are releasing Opus 4.7 with safeguards that automatically detect and block requests that indicate prohibited or high-risk cybersecurity uses. What we learn from the real-world deployment of these safeguards will help us work towards our eventual goal of a broad release of Mythos-class models.

Security professionals who wish to use Opus 4.7 for legitimate cybersecurity purposes (such as vulnerability research, penetration testing, and red-teaming) are invited to join our new Cyber Verification Program.

Opus 4.7 is available today across all Claude products and our API, Amazon Bedrock, Google Cloud's Vertex AI, and Microsoft Foundry. Pricing remains the same as Opus 4.6: $5 per million input tokens and $25 per million output tokens.

## Testing Claude Opus 4.7 - Early Access Feedback

- **Hex**: Claude Opus 4.7 is the strongest model evaluated. It correctly reports when data is missing instead of providing plausible-but-incorrect fallbacks, and it resists dissonant-data traps.
- **Internal coding benchmark**: On 93-task coding benchmark, Opus 4.7 lifted resolution by 13% over Opus 4.6, including four tasks neither Opus 4.6 nor Sonnet 4.6 could solve.
- **Research-agent benchmark**: Tied for top overall score across six modules at 0.715, delivered most consistent long-context performance.
- **Devin**: Takes long-horizon autonomy to a new level, works coherently for hours, pushes through hard problems.
- **Replit**: Same quality at lower cost—more efficient and precise at analyzing logs/traces, finding bugs.
- **CursorBench**: Clears 70% versus Opus 4.6 at 58%.
- **Rakuten-SWE-Bench**: Resolves 3x more production tasks than Opus 4.6.

## Key Improvements

- **Instruction following**: Substantially better at following instructions. Prompts written for earlier models may produce unexpected results.
- **Multimodal support**: Accepts images up to 2,576 pixels on the long edge (~3.75 megapixels), more than three times prior models.
- **Effort control**: New xhigh effort level between high and max.
- **Higher resolution vision**: Model-level change, users' images processed at higher fidelity automatically.
- **Updated tokenizer**: Same input maps to roughly 1.0-1.35x more tokens depending on content type.
- **More thinking at higher effort**: Produces more output tokens but improves reliability on hard problems.

## Safety

Similar safety profile to Opus 4.6. Low rates of deception, sycophancy, and cooperation with misuse. On some measures like honesty and resistance to prompt injection attacks, Opus 4.7 is an improvement.
