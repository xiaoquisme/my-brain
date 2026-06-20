---
title: "HarnessX: A Composable, Adaptive, and Evolvable Agent Harness Foundry"
source_url: https://arxiv.org/abs/2606.14249
ingested: 2026-06-20
type: paper
tags: [harness-engineering, agent, self-evolution, reinforcement-learning, benchmark]
sha256: 2f0c55acd1fbf10a6e54cb85e5f7dae6fbdf69d0528aac7ae94d29f896dd07f6
---

# HarnessX: A Composable, Adaptive, and Evolvable Agent Harness Foundry

arXiv:2606.14249v1 [cs.AI] 12 Jun 2026
Darwin Agent Team (小米)
License: CC BY 4.0

## Abstract

AI agent performance depends critically on the runtime harness, comprising the prompts, tools, memory, and control flow that mediate how a model observes, reasons, and acts. Yet today's harnesses remain largely hand-crafted and static: each new model or task still demands bespoke scaffolding, and the rich traces produced during execution are rarely distilled back into systematic improvement. We introduce HarnessX, a foundry for composable, adaptive, and evolvable agent harnesses. HarnessX assembles typed harness primitives via a substitution algebra, adapts them through AEGIS, a trace-driven multi-agent evolution engine grounded in an operational mirror between symbolic adaptation and reinforcement learning, and closes the harness–model loop by turning trajectories into both harness updates and model training signal. Across five benchmarks (ALFWorld, GAIA, WebShop, τ³-Bench, and SWE-bench Verified), HarnessX yields an average gain of +14.5% (up to +44.0%), with gains largest where baselines are lowest. These results suggest that agent progress need not come from model scaling alone: composing and evolving runtime interfaces from execution feedback is an actionable and complementary lever. The complete codebase will be open-sourced in a future release.

## 1 Introduction

Modern agent capacity depends on both the underlying model and the surrounding harness. The harness converts raw model outputs into structured agent behaviors. Three structural gaps persist:

1. **Hand-engineered and static**: no mechanism for experience-driven improvement
2. **Architecturally entangled**: changes to one component silently break others
3. **Decoupled from model training**: trajectory data discarded rather than incorporated into model training

HarnessX treats the harness as a first-class object that can be composed, adapted, and evolved alongside the model.

### Four Contributions

1. **Harness Composition (§3)**: Formalize harness as a first-class, typed object composed of processors attached to lifecycle hooks. Nine-dimensional taxonomy + substitution algebra.
2. **Harness Adaptation (§4)**: AEGIS — trace-driven, multi-agent evolution engine. Operational mirror maps harness adaptation onto RL constructs.
3. **Harness-Model Co-Evolution (§5)**: Close the optimization loop via cross-harness GRPO over shared replay buffer.
4. **Empirical Validation (§6)**: Average +14.5% gain (up to +44.0%) across 5 benchmarks, 3 model families, 15 evolution rounds.

## 2 Related Work

### 2.1 Harness Engineering

Existing infrastructure layers:
- **Primitives**: LangChain, LlamaIndex, Smolagents — typed building blocks but no harness-level composition
- **Orchestrators**: LangGraph, AutoGen, CrewAI, Letta — reusable patterns but fixed control loops
- **Product harnesses**: Claude Code, Cursor, Manus, DeerFlow — architecturally static

Two structural gaps: no substitutable entity composed of typed elements; no in-loop improvement mechanism.

### 2.2 Self-Evolving Agents

Evolution approaches by scope:
- **Prompt-only**: APE, OPRO, EvoPrompt, Promptbreeder, ProTeGi, TextGrad, DSPy, MIPRO
- **Memory-based**: Memento, MIA (Manager-Planner-Executor framework)
- **Workflow-level**: GPTSwarm, ADAS, AFlow, A²Flow, AgentSwift, ResMAS, EvoAgentX
- **Harness-level**: SICA, Darwin Gödel Machine, HyperAgents, Meta-Harness, AHE, Life-Harness

Gap: no unifying theoretical framework connecting observed failure modes to principled defenses.

## 3 Harness Composition

### 3.1 The Harness as a First-Class Object

Harness = tuple H = (c₁, c₂, ..., c₉), each cᵢ ∈ Cᵢ instantiates one of nine behavioral dimensions.

**Hook points**: task_start, step_start, before_model, after_model, before_tool, after_tool, step_end, task_end.

### 3.2 The Processor Abstraction

Processor = typed atomic component. Each processor:
- Attaches to exactly one hook point
- Declares an event type it consumes and produces
- Has a manifest (name, description, type signature)

### 3.3 The Nine-Dimensional Taxonomy

1. **Model Selection** — which model, sampling params
2. **Context Assembly** — prompt templates, system instructions
3. **Memory Management** — scratchpad, long-term memory, retrieval
4. **Tool Ecosystem** — tool definitions, wrappers, schemas
5. **Execution Environment** — sandbox, sandbox policy, resource limits
6. **Evaluation and Reward** — verifiers, scoring, reward shaping
7. **Control and Safety** — guardrails, approval gates, termination
8. **Observability** — logging, tracing, metrics
9. **Training Bridge** — replay buffer, training signal extraction

**Substitution algebra**: type-safe insertion/removal of processors. Two processors are substitutable if they attach to the same hook and produce compatible event types.

## 4 Harness Adaptation

### 4.1 The Operational Mirror

Maps symbolic harness adaptation to RL constructs:

| Symbolic | RL |
|---|---|
| Harness config H | State |
| Harness edit e: H→H | Action |
| Task success rate | Reward |
| Edit sequence | Policy trajectory |
| Trace log | Experience |

**Definition 3 (Operational Mirror)**: A correspondence between symbolic harness evolution and standard RL where:
- Observable traces ↔ proper credit assignment
- Falsifiable change manifests ↔ reward shaping
- Proposal-critique cycles ↔ structured exploration

### 4.2 Pathologies in Symbolic Space

Three RL pathologies manifest as concrete harness design risks:

1. **Reward hacking**: edits exploit verifier regularities rather than solving tasks
2. **Catastrophic forgetting**: improving one task cluster degrades another
3. **Under-exploration**: repeated edits in same neighborhood (e.g., prompt-only) exhaust that space

### 4.3 AEGIS Architecture

Four-stage pipeline:

1. **Digester**: Compresses raw traces (~10M tokens) into structured summaries (~10K tokens). Identifies failure clusters, traces root causes to specific harness components.
2. **Planner**: Synthesizes failure analysis into adaptation hypotheses. Proposes targeted edits with explicit scope declarations.
3. **Evolver**: Implements proposed edits as concrete harness modifications. Generates change manifests with predicted impact.
4. **Critic**: Evaluates proposed edits against the seesaw constraint (no task regression). Gates shipping decisions.

**Design principle**: separation of concerns — each stage has a distinct role and produces auditable intermediate artifacts.

### 4.4 The Adaptation Loop

Per round:
1. Run task agent on adaptation batch
2. Collect traces into replay buffer
3. Digester compresses traces → failure diagnosis
4. Planner synthesizes diagnosis → edit proposals
5. Evolver implements proposals → candidate harness
6. Critic evaluates candidates → ship/reject decision
7. If shipped: new harness becomes default for next round

**Seesaw constraint**: an edit ships only if no task regresses from pass to fail (under pass@2). This is a binary per-task gate, not an aggregate metric gate.

### 4.5 Variant Isolation via Ensemble Routing

For heterogeneous task sets, maintain up to K harness variants. Each task routes to the variant with highest prior success rate. Edits proposed and evaluated per-variant, preventing cross-task interference.

## 5 Harness-Model Co-Evolution

### 5.1 The Co-evolution Iteration

1. Roll out current agent (model M_t, harness H_t) on task batch
2. Score traces via verifier → store in replay buffer B
3. AEGIS harness evolution over B → H_{t+1}
4. Compute cached log-probabilities π_old for each trace under its generating checkpoint
5. Cross-harness GRPO update → M_{t+1}
6. Advance to next round

Every trace serves as both AEGIS diagnostic evidence and GRPO training signal.

### 5.2 Optimization Substrates

**Harness side (non-parametric)**: discrete structural changes (adding tools, replacing processors, restructuring prompts) — cannot be expressed as parameter updates.

**Model side (parametric via GRPO)**: fine-grained behavioral adjustments (when to invoke which tool, how to phrase queries) — depend on high-dimensional in-context state.

**Complementarity**: harness defines coarse-grained strategy architecture; model learns to exploit it.

### 5.3 Cross-Harness GRPO

Key insight: all trajectories sharing a task identifier form one GRPO group regardless of which harness or model checkpoint produced them. Within-group variation reflects strategy differences rather than sampling noise.

Group-relative advantage:
```
A_hat(τᵢ) = (rᵢ - μ(Gₓ)) / (σ(Gₓ) + ε)
```

Cross-harness GRPO performs **task-level alignment** (not action-level) — harness versions with incompatible action spaces coexist in the same group without conflict.

### 5.4 Off-Policy Training over Mixed-Policy Buffer

- Behavior policy π_old materialized at buffer insertion via one forward pass, cached on disk
- FIFO eviction caps buffer at C trajectories; max model-version lag = ⌊C/s⌋ rounds
- **Replay reuse at no added rollout cost**: same traces drive both AEGIS and GRPO. GRPO consumes trajectories by replay, issues no rollouts of its own.

## 6 Experiments

### 6.1 Setup

**Benchmarks**:
| Benchmark | Domain | Tasks | Verifier |
|---|---|---|---|
| GAIA (L1-3) | Multi-step retrieval | 103 | Exact match |
| ALFWorld | Embodied planning | 134 | Goal completion |
| WebShop | Web interaction | 100 | Attribute match |
| τ³-Bench | Multi-turn dialogue | 3 domains | Rule compliance |
| SWE-bench Verified | Software engineering | 55 | Patch resolution |

**Models**: Meta-agent = Claude Opus 4.6. Task agents = Claude Sonnet 4.6, GPT-5.4, Qwen3.5-9B.

**Baselines**: Static Harness; Claude Code SDK v0.0.25 (single-agent evolver).

**Protocol**: Up to T=15 evolution rounds, early stopping after P=3 consecutive rounds without shipped edit. Pass@2 metric.

### 6.2 Main Results

| Benchmark | Task Agent | Initial | Evolved | Δ |
|---|---|---|---|---|
| ALFWorld | Sonnet 4.6 | 83.6 | 94.8 | +11.2 |
| ALFWorld | GPT-5.4 | 76.9 | 97.8 | +20.9 |
| ALFWorld | Qwen3.5-9B | 53.0 | 97.0 | **+44.0** |
| WebShop | Sonnet 4.6 | 60.0 | 76.0 | +16.0 |
| WebShop | GPT-5.4 | 55.0 | 73.0 | +18.0 |
| WebShop | Qwen3.5-9B | 36.0 | 49.0 | +13.0 |
| GAIA | Sonnet 4.6 | 73.8 | 83.5 | +9.7 |
| GAIA | GPT-5.4 | 73.8 | 73.8 | 0.0 |
| GAIA | Qwen3.5-9B | 20.3 | 37.4 | +17.1 |
| SWE-bench | Sonnet 4.6 | 76.4 | 87.3 | +10.9 |
| SWE-bench | GPT-5.4 | 45.5 | 63.6 | +18.2 |
| SWE-bench | Qwen3.5-9B | 23.6 | 41.8 | +18.2 |
| τ³-Bench | Sonnet 4.6 | 89.6 | 95.0 | +5.4 |
| τ³-Bench | GPT-5.4 | 76.2 | 90.7 | +14.5 |
| τ³-Bench | Qwen3.5-9B | 93.5 | 94.6 | +1.1 |

**Key patterns**:
- 14/15 configurations improve; average +14.5%, max +44.0%
- **Inverse scaling**: weakest agent (Qwen3.5-9B) gains most where baseline is lowest
- Cross-model generalization: meta-agent (Opus 4.6) evolves effective harnesses across model families
- Convergence rate tracks failure-mode concentration

### 6.3 Evolution Strategy Comparison (GAIA, GPT-5.4)

| Strategy | Final | Peak | Final−Peak | Tokens |
|---|---|---|---|---|
| Ensemble (K variants) | 87.4% | 87.4% | 0.0 | 107.8M |
| Global (single harness) | 49.5% | 73.8% | −24.3 | 143.7M |

Global strategy collapses due to catastrophic forgetting. Ensemble routing prevents cross-variant forgetting.

### 6.4 Meta-Agent Effectiveness

| Evolver | Accuracy | Best Round | Tokens |
|---|---|---|---|
| AEGIS (4-stage) | 87.4% | R14 | 107.8M |
| CC SDK (single-agent) | 86.4% | R12 | 123.1M |

Accuracy comparable; AEGIS is ~14% more token-efficient due to Digester compression.

### 6.5 Co-Evolution

Co-evolution (harness + model GRPO) vs harness-only (model frozen):
- GAIA: 37.4% → 41.7% (+4.3%)
- WebShop: 49.0% → 54.0% (+5.0%)
- Average +4.7% over harness-only

Co-evolution breaks the scaffolding ceiling that limits harness-only adaptation.

### 6.6 Failure Analysis

Three case studies confirming operational mirror predictions:

1. **Reward hacking** (GAIA, Sonnet 4.6, R10): edit exploited verifier format regularities. Detected at R12, self-corrected.
2. **Catastrophic forgetting** (τ³-Bench Telecom, Sonnet 4.6, R7): 5 consecutive same-type prompt edits accumulated sub-threshold conflicts, causing −14.0% regression. Self-corrected by R9.
3. **Under-exploration** (ALFWorld, Sonnet 4.6, R4–R7): prompt-space exhaustion, ship-prediction accuracy dropped to 0%.

## 7 Discussion

### Key Insights

- **Compositional structure enables variant isolation** — typed components make edit scope explicit
- **Trace richness matters** — full execution traces enable diagnosis; summary-only traces lose causal information
- **Operational mirror is predictive but not complete** — all three pathologies appeared, but sub-threshold coupling evades per-edit gating
- **Cross-model generalization works** — gains track baseline performance, not meta-agent family proximity
- **Cost-performance tradeoff** — co-evolution adds marginal cost (one cached forward pass + gradient steps) with no extra rollouts

### Limitations

- No held-out generalization evaluation
- Small benchmarks (55–134 tasks)
- Meta-agent requires capable model (Opus 4.6)
- Per-edit gating has structural blind spot for accumulated sub-threshold coupling

## 8 Conclusion

HarnessX demonstrates that agent progress need not come from model scaling alone. By treating the harness as a composable, adaptive, and evolvable first-class interface, the system achieves significant gains through typed composition, trace-driven multi-agent evolution (AEGIS), and harness-model co-evolution via cross-harness GRPO. Average +14.5% gain across 5 benchmarks. Code to be open-sourced.
