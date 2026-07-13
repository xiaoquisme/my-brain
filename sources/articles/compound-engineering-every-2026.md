---
source_url: https://every.to/guides/compound-engineering
ingested: 2026-07-13
previous_ingested: 2026-06-07
type: article
author: Kieran Klaassen (Every)
sha256: f9115844a5308a0a0e3fd1c145ba490058c3ff4aa0c05d39e3aaac9717979e89
---

# Compound Engineering — The AI-native engineering philosophy

**Author:** Kieran Klaassen, Every (every.to)
**Updated:** ~July 2026 (significantly rewritten from May 2026 version)

Compound engineering emerged from building Cora, an AI chief of staff for your inbox, from scratch. As we battle-tested every pattern, agent, and workflow across many pull requests, we developed personal productivity hacks to make the work go faster. This, in turn, evolved into a systematic approach to AI-assisted development. We're sharing the details of this philosophy because we believe compound engineering will become the default way software gets built.

## The Philosophy

The core philosophy of compound engineering is that each unit of engineering work should make subsequent units easier—not harder.

Most codebases get harder to work with over time because each feature you add injects more complexity. After 10 years, teams spend more time fighting their system than building on it because each new feature is a negotiation with the old ones. Over time, the codebase becomes harder to understand, harder to modify, and harder to trust.

Compound engineering flips this on its head. Instead of features adding complexity and fragility, they teach the system new capabilities. Bug fixes eliminate entire categories of future bugs. When they are codified, patterns become tools for future work. Over time, the codebase becomes easier to understand, easier to modify, and easier to trust.

## The Main Loop

Every runs six products — Cora, Monologue, Proof, Sparkle, Spiral, and Every.to — with primarily single-person engineering teams. The system that makes this possible is a four-step loop that forms the basis of compound engineering:

**Plan → Work → Review → Compound → Repeat**

The first three steps—plan, work, and review—should be familiar to any developer. It's the fourth step that separates compound engineering from other engineering. This is where the gains accumulate. Skip it, and you've done traditional engineering with AI assistance.

The loop works the same whether you are fixing a bug in five minutes or building a feature over several days. You just spend more or less time on each step.

The plan and review steps should comprise 80 percent of an engineer's time, and work and compound the other 20 percent. In other words, most thinking happens before and after the code gets written.

### 1. Plan

Planning transforms an idea into a blueprint, and better plans produce better results. Here are the actions to take and questions to ask yourself at this step:

- **Understand:** What's being built? Why? What constraints exist?
- **Research:** How does similar functionality work? What patterns exist?
- **Framework docs:** What do the framework docs say? What are the established best practices?
- **Design:** What's the approach? Which files need changes?
- **Validate:** Does this hold together? Is it complete?

### 2. Work

Execution follows the plan. The agent implements while the developer monitors. Within this step, there are a few smaller tasks:

- **Set up:** Git worktrees (isolated copies of your repository) or branches keep work separate.
- **Implement:** The agent implements step by step.
- **Verify:** Run tests, linting (automated code checking), and type checking after each change.
- **Track:** Check what work has been done, and what remains.
- **Adapt:** When something breaks, adapt the plan.
- **Trust:** If you trust the plan, there's no need to watch every line of code.

### 3. Review

This step catches issues before they ship. More importantly, it captures learnings for the next cycle, which becomes the basis for compound engineering. Here are the actions that happen during review:

- **Review:** Have multiple agents review the output.
- **Analyze:** Multiple specialized reviewers examine the code in parallel.
- **Prioritize:** Mark findings as P1 (must fix), P2 (should fix), or P3 (nice to fix).
- **Resolve:** The agent fixes issues based on review feedback.
- **Verify fixes:** Confirm fixes are correct and complete.
- **Document:** Document what went wrong to prevent recurrence.

### 4. Compound (the most important step)

Traditional development stops at step three, but the compound step is where the gains are to be made. The first three steps (plan, work, review) produce a feature. The fourth step produces a system that builds features better each time.

In this final step, these are the actions you should take:

- **Capture the solution.** Ask yourself: What worked? What didn't? What's the reusable insight?
- **Make it findable.** Add YAML frontmatter to make sure it is tagged with the right metadata, tags, and categories for retrieval.
- **Update the system.** Add new patterns into CLAUDE.md, the file the agent reads at the start of every session. Create new agents when warranted.
- **Verify the learning.** Ask yourself: Would the system catch this automatically next time?

## The Plugin

The compound engineering workflow ships as a plugin. Install it, and the full system is ready to use.

### What's Included

- **Agents** — Each agent is trained for a specific job.
- **Commands** — These include the main loop plus utilities.
- **Skills** — These provide domain expertise, such as our agent-native architecture skill and style guide skill, on tap.

### Installation

Below are instructions for adding the plugin to some of the most common AI coding tools. Zero configuration is required.

**Claude Code:**
```
claude /plugin marketplace add https://github.com/EveryInc/every-marketplace
claude /plugin install compound-engineering
```

**OpenCode:**
```
bunx @every-env/compound-plugin install compound-engineering --to opencode
```

**Codex:**
```
bunx @every-env/compound-plugin install compound-engineering --to codex
```

### Where Things Live

```
your-project/
├── CLAUDE.md                      # Agent instructions, preferences, and patterns
├── docs/
│   ├── brainstorms/               # /workflows:brainstorm output
│   └── solutions/                 # /workflows:compound output (categorized)
│       └── 002-pending-p2-add-tests.md
└── triage.md                      # /triage and review findings
```

**CLAUDE.md** is the most important file that the agent reads every session. Put your preferences, patterns, and project context here. When something goes wrong, add a note so the agent learns.

**Solutions docs** builds your institutional knowledge because each solved problem becomes searchable documentation. Future sessions will find past solutions automatically.

**Triage** tracks work items with priority and status. When the review step turns up issues, use them to decide what's worth fixing, and then use resolution commands to work through them.

### What's in the Plugin

- # Codebase and documents researchers
- # 14 code review specialists
- # User interface and Figma sync agents
- # Domain expertise (14 skills)

### Key Commands

When you're not sure what to build, start here.

**/workflows:brainstorm** — Requirements brainstorming
```
/workflows:brainstorm Add user notifications
```
This command helps you brainstorm answers about what to build and plan answers for how to build them. Use this when requirements are fuzzy. The command runs lightweight repo research, then asks questions one at a time to clarify purpose, users, constraints, and edge cases. The AI then proposes approaches, and decisions are captured in a brainstorms doc.

**/workflows:plan** — Implementation planning
Describe what you want and get back a plan for how to build it.
```
/workflows:plan Add email notifications when users receive new comments
```
This command spawns three parallel research agents: repo-research-analyst (codebase patterns), framework-docs-researcher (documentation), and best-practices-researcher (industry standards). Then the spec-flow-analyzer agent analyzes user flows and edge cases. Results are merged into a structured plan with affected files and implementation steps.

Supports **ultrathink mode** (extended reasoning with deeper research) to automatically run `/workflows:deepen-plan` after plan creation—this spawns over 40 parallel research agents.

**/workflows:work** — Agent implementation
This is where the agent actually writes the code.
Runs in four phases: quick start (creates a git worktree—an isolated copy of your repo for parallel work—and sets up branch), execute (implements each task with progress tracking), quality check (optionally spawns over five reviewer agents—Rails, TypeScript, security, performance), and ship it (runs linting + type checks + tests, then creates a PR).

**/workflows:review** — Multi-agent PR review
Get your PR reviewed by a dozen specialized agents at once.

Spawns more than 14 specialized agents in parallel that run simultaneously: security-sentinel, performance-oracle, data-integrity-guardian, architecture-strategist, pattern-recognition-specialist, code-simplicity-reviewer, and framework-specific reviewers (DHH-rails, Kieran-rails, TypeScript, Python). Everything gets combined into a single, prioritized list.

The /review command spawns 14 specialized agents that analyze code in parallel. Each agent focuses on a specific domain and returns prioritized findings.

**Review agents:**
- **security-sentinel** — Scans for top 10 vulnerabilities as defined by OWASP, injection attacks, authentication flaws, and authorization bypasses
- **performance-oracle** — Detects N+1 queries, missing indexes, caching opportunities, and algorithmic bottlenecks
- **architecture-strategist** — Evaluates system design decisions, component boundaries, and dependency directions
- **pattern-recognition-specialist** — Identifies design patterns, anti-patterns, and code smells across the changeset
- **data-integrity-guardian** — Validates migrations, transaction boundaries, and referential integrity
- **data-migration-reviewer** — Checks ID mappings, rollback safety, and production data validation
- **code-simplicity-reviewer** — Enforces YAGNI, flags unnecessary complexity, and checks readability
- **kieran-rails-reviewer** — Rails conventions, Turbo Streams patterns, model/controller responsibilities
- **python-reviewer** — PEP 8 compliance, type hints, Pythonic idioms
- **kieran-typescript-reviewer** — Type safety, modern ES patterns, clean architecture
- **37signals-conventions** — 37signals conventions: simplicity over abstraction, Omakase stack
- **deployment-verification-agent** — Generates pre-deploy checklists, post-deploy verification steps, and rollback plans
- **julik-frontend-races-reviewer** — Detects race conditions in JavaScript and Stimulus controllers
- **agent-native-reviewer** — Ensures features are accessible to agents, not just humans

**Example findings:**
```
[ ] SQL injection vulnerability in search query (security-sentinel)
[ ] Missing transaction around user creation (data-integrity-guardian)
[ ] N+1 query in comments loading (performance-oracle)
[ ] Controller doing business logic (kieran-rails-reviewer)
[ ] Unused variable (code-simplicity-reviewer)
[ ] Could use guard clause (pattern-recognition-specialist)
```

**/workflows:resolve** — Auto-resolve findings
`/workflows:resolve` command processes all findings automatically. P1 issues are fixed first, then P2s. Each fix runs in isolation so they don't step on each other, but you still manually review the generated fixes at the end.

**/workflows:triage** — Human-in-the-loop triage
This command presents each finding one by one for human decision: approve (add to to-do list), skip (delete), or customize (modify priority/details). Approved items get added to triage.md. Use this when you want to filter findings before committing to fixes.

**/workflows:compound** — Document solved problems
This command documents a solved problem for future reference.

This command spawns six parallel subagents: context analyzer (understands the problem), solution extractor (captures what worked), related docs finder (links to existing knowledge), prevention strategist (documents how to avoid recurrence), category classifier (tags for discovery), and documentation writer (formats the final doc). It creates a searchable markdown with YAML frontmatter that future sessions will find automatically.

**/lfg** — Full pipeline
With this command, you describe the feature, and the agent does the rest—planning, building, reviewing, and handing you a PR ready to merge.
```
/lfg Add dark mode toggle to settings page
```
This chains the full pipeline: plan → deepen-plan → work → review → resolve findings → browser tests → feature video → compound. It pauses for plan approval, then runs autonomously, and spawns more than 50 agents across all stages. With one command, you have a complete feature.

## Beliefs to Let Go

We have all been trained to believe certain things about software development. With improvements in AI tools, some of those beliefs are now obstacles. Here are eight of them to unlearn:

1. **"The code must be written by hand"** — The actual requirement for you to do your job well as a software engineer is simply to write good code, which can be defined as maintainable code that solves the right problem. Who types—a human or an agent—doesn't matter.

2. **"Every line must be manually reviewed"** — Again, a core requirement to be a good engineer is to write quality code. Manual line-by-line review is one method to get there, but so are automated systems that catch the same issues. If you don't trust the results, fix the system, instead of compensating by doing everything yourself.

3. **"Solutions must originate from the engineer"** — When AI can research approaches, analyze tradeoffs, and recommend options, the engineer's job becomes to add taste—knowing which solution fits this codebase, this team, and this context.

4. **"Code is the primary artifact"** — A system that produces code is more valuable than any individual piece of code. A single brilliant implementation matters less than a process that consistently produces good implementations.

5. **"Writing code is the core job function"** — A developer's job is ship value. Code is just one input in that job—planning, reviewing, and teaching the system all count too. Effective compound engineers write less code than before and ship more.

6. **"First attempts should be good"** — In our experience, first attempts have a 95 percent garbage rate. Second attempts are still 50 percent. This isn't failure—it's the process. Make it your goal to get it right the first time. Focus on iterating fast enough that your third attempt lands in less time than attempt one.

7. **"Code is self-expression"** — Developers subconsciously see AI-assisted development as an attack on their identity. It feels like a blow to the ego. But the code was never really yours. It belongs to the team, the product, and the users. Letting go of code as self-expression is liberating. No attachment means you take feedback better, refactor without flinching, and skip the arguments about whether the code is good enough.

8. **"More typing equals more learning"** — Many developers fear that by not typing it, they are not learning it. However, the reality is that understanding matters more than muscle memory today. You learn and build understanding by reviewing, by catching mistakes, and by knowing when the AI is wrong. The developer who reviews 10 AI implementations understands more patterns than the one who hand-typed two.

### Emotional Reactions to Expect

- **Less typing feels like less work.** It isn't. Directing an agent requires more thinking than implementation because you are spending less time on keystrokes and more time thinking about important decisions.
- **Letting go feels risky.** Autonomous execution—handing things over to agents—triggers anxiety in many developers. This fades once they recognize they're not ceding control. Instead, they're encoding it into constraints, conventions, and review processes that scale better than manual oversight.
- **Not coding feels like cheating.** Features shipping without directly writing the code can feel like cheating. But planning, reviewing, and ensuring quality standards is the work. You did the thinking. All the AI did was the writing.

These reactions indicate a fundamental shift in how work gets done, and they're expected. By talking about them openly at Every, we hope to make it easier for others to speak about their experiences.

## Beliefs to Adopt

### Extract your taste into the system

Every codebase reflects the taste of the developers who built it, from naming conventions to error handling patterns and testing approaches. That taste usually isn't documented anywhere. It lives in senior engineers' heads and is transferred through code review. This neither scales nor lets others on the team learn.

The solution is to extract and document these choices. Write these preferences down in CLAUDE.md or AGENTS.md so the agent reads it every session. Build specialized agents for reviewing, testing, and deploying, as well as skills that reflect your taste. Add slash commands that encode your preferred approaches. Point the agent at your existing style guides, architecture docs, and decision records.

Once the AI understands how you like to write code, it'll produce code you actually approve instead of code you have to fix.

### The 50/50 rule

Previously, I suggested an 80/20 rule for building features: 80 percent of time planning and review, 20 percent on working and compounding. When you look at your broader responsibilities as a developer, you should allocate 50 percent of engineering time to building features, and 50 percent to improving the system—in other words, any work that helps build institutional knowledge rather than shipping features.

In traditional engineering, teams put 90 percent of their time into features and 10 percent into everything else. Work that isn't a feature feels like a distraction—something you do when you have spare time, which you never do. But that "everything else" is what makes future features easier: things like creating review agents, documenting patterns, and building test generators. When you treat system improvement as investment instead of overhead, the returns compound.

An hour spent creating a review agent saves 10 hours of review over the next year. You can spend time building a test generator that saves weeks of manual test writing. System improvements make work progressively faster and easier, but feature work doesn't.

### Trust the process, build safety nets

AI assistance doesn't scale if every line requires human review. You need to trust the AI.

Trust doesn't mean blind faith. It means setting up guardrails such as tests, automatic review, and monitoring that flag issues so you don't have to watch every step.

When you feel as if you can't trust the output, don't compensate by switching to manually reviewing the code. Add a system that makes that step trustworthy, such as creating a review agent that flags issues.

### Make your environment agent-native

If a developer can see or do something, the agent should be allowed to see or do it too.

Anything that you don't let the agent handle, you have to do yourself manually. The goal should be full environmental parity between human and AI developers.

### Parallelization is your friend

You used to be the bottleneck because human attention only allows one task at a time. The new bottleneck is compute—how many agents you can run at once.

Run multiple agents and multiple features at the same time. Perform review, testing, and documentation all at once. When you are stuck on one task, start another, and let agents work while planning the next step.

### Plans are the new code

The plan document is now the most important thing you produce. Instead of coding first and documenting later, as you might have traditionally, start with a plan. This becomes the source of truth your agents use to generate, test, and validate code.

Having a plan helps capture decisions before they become bugs. Fixing ideas on paper is cheaper than fixing code later.

## Core Principles

In summary, the beliefs that underpin this new approach to software development are:

1. **Every unit of work makes subsequent work easier.** Code, documentation, and tooling should build on each other and make future work faster, not slower.
2. **Taste belongs in systems, not in review.** Bake your judgment into configuration, schemas, and automated checks. If you don't you'll be spending time manually checking, which does not scale.
3. **Teach the system, don't do the work yourself.** Time spent giving agents more context pays exponential dividends, but time spent typing code only solves the task in front of you.
4. **Build safety nets, not review processes.** The way to build trust in building with AI is by building verification infrastructure, not by gatekeeping manually at every step.
5. **Make environments agent-native.** Structure projects so AI agents can navigate and modify them autonomously.
6. **Apply compound thinking everywhere.** Every artifact—code, docs, tests, prompts—should enable the next iteration to move faster.
7. **Embrace the discomfort of letting go.** When you delegate to AI tools, you have to be okay with imperfect results that scale, rather than perfect results that don't.
8. **Ship more value. Type less code.** Your output should be measured by the number of problems solved, not the number of keystrokes you logged.

The principles extend beyond engineering to design, research, or even writing—any discipline where codifying taste and context help make future work go faster and easier. The steps are the same: Plan, execute, review, compound.

## Getting Started

### Skip Permissions

"I always run with skip permissions:
```
alias cc='claude --dangerously-skip-permissions'
```
I do this in a specific setup that helps avoid risk. I'm on my laptop, not a production server. I'm working in a branch that's completely separate from the main codebase. I have tests. I can revert anything. Real users will never see this code until I'm ready. The 'dangerous' flag isn't actually dangerous here—it just helps me go faster."

If you're not using permission prompts, you need other safety mechanisms:
- Everything the agent does is in git.
- Before merging, run your tests. If the agent broke something, tests will catch it.
- Skip permissions skips implementation prompts, not final review. Always review the PR.
- Use git worktrees for risky work. Experiments happen in an isolated directory.

Your decision to skip permissions or not also depends on how much faster you want to build. Without skip permissions, you may see a prompt every 30 seconds. Each time you have to type "y," and lose focus. Imagine this multiplied hundreds of times each session.

With skip permissions, you can maintain a flow state because you are not being interrupted by requests for permission. Watch the work happen (or do something else, like jumping in the Pacific Ocean for a swim). This will unlock five to 10 times faster iteration, and the time saved can dramatically exceed the risk of occasionally having to roll something back.

`--dangerously-skip-permissions` is named that on purpose. It's meant to make you pause the first time. But once you are more experienced, you can make an informed decision about your risk tolerance and choose to skip it.

### Design in Code

Design is easier to iterate on in code than in mockups—you can click through it and feel the interactions. But you don't want to experiment in your production codebase. This section covers how to prototype designs in throwaway projects, test them with users, and capture your design taste so the AI can replicate it.

**Baby apps:** Create a throwaway project—a "baby app"—where you can iterate freely without worrying about tests, architecture, or breaking anything. Once the design feels right, extract the patterns and bring them back to the real project.

```
mkdir baby-myapp && cd baby-myapp
```
"Create a settings page with dark mode toggle. Make it look modern."
"More spacing. Toggle more prominent. Inline, not stacked."

Once you have something you are pleased with, extract colors, spacing, typography, and component patterns. Use the prototype as reference when building the real feature.

**Vibe coding for exploration:** When you don't know what to build, vibe coding is great for exploring:
- Generate multiple versions. Tell the agent to come up with five different versions of the settings page and see what it comes up with.
- Click through each one. Use them and see what feels right.
- Share with users. Show them the prototype and ask: "Would this flow confuse you?"
- Delete everything and start over with a proper plan.
- The prototype is for learning only, not shipping.

**Designer collaboration:** Collaboration between designers and developers usually looks like this: The designer creates a mockup. The developer interprets it and builds something. The designer says, "That's not quite right." Back and forth until it eventually matches—maybe.

With compound engineering, the back-and-forth shrinks:
1. The designer creates a mockup in Figma
2. You paste the Figma link and tell the AI to implement it exactly.
3. An agent checks if the implementation matches the mockup.
4. The designer reviews the live version, not a screenshot.

Once you've worked with a designer on a few features, you'll notice patterns such as their preferred colors and how they like forms laid out. Write those down in a skill file. Using this, the AI can now produce designs that match the designer's taste—even when the designer isn't involved.

**Design agents:**
- **design-iterato** — Takes a screenshot of the current design, analyzes what's not working, makes improvements, and repeats. Each pass refines the design further.
- **figma-sync** — Pulls the design from Figma, compares to what's built, identifies differences, and fixes them automatically.
- **design-implementation-reviewer** — Checks that the implementations match the Figma specifications. It catches visual bugs before they reach users.

### Vibe Coding

Vibe coding is for people who don't care about the code itself—they want results.

Maybe you're a product manager prototyping ideas. Maybe you're a designer testing how an interaction feels. Maybe you're building a personal project, and you'll never look at the code anyway. You just want to make sure the thing works—this is the vibe coder's philosophy.

This section is about skipping the ladder and going straight to stage four, where you describe what you want and let the agents build it.

Skip the ladder. Go straight to Stage 4.

The agent figures out what to build, creates the code, runs tests, reviews itself, makes a PR.
If yes, done. If no, say what's wrong. Let the agent fix it.

**What you don't need to care about:**
- Architecture — The agent makes reasonable choices
- Testing — Tests are written automatically
- "Can this even work?" investigations

Vibe coding can actually make your planning better. When you don't know what you want to build, generate prototypes. Share them with users, and collect feedback. Click through them. Then delete everything and start over with a proper plan.

The optimal split: Vibe code to discover what you want, then spec to build it properly. The spec always wins for final implementation, but vibe coding accelerates discovery.

## How to Level Up

### The 5 Stages

The principles extend beyond engineering to design, research, or even writing—any discipline where codifying taste and context help make future work go faster and easier. The steps are the same: Plan, execute, review, compound.

- **Stage 0:** Manual development — no AI
- **Stage 1:** Chat-based assistance — AI as smart reference
- **Stage 2:** Agentic tools with line-by-line review — gatekeeper mode
- **Stage 3:** Plan-first, PR-only review — compound engineering begins here
- **Stage 4:** Idea to PR (single machine) — involvement shrinks to ideation, PR review, merge

**3 → 4: Describe, don't plan** — At Stage 4, agents have access to ticket systems, have deployment capabilities, and can run autonomously.

## Team Collaboration

When AI handles implementation, the team dynamics shift. You need new agreements: who approves plans, who owns PRs, and what humans should review when agents have done the first pass.

**Traditional:** Person A writes code → Person B reviews → Discussion in PR comments → Merge after approval

**Compound engineering:** Person A creates plan → AI implements → AI agents review → Person B reviews the AI review → Merge after human approval

**Plan approval:** Reading a plan and agreeing with it is a decision. Silence is not approval—it's the absence of a decision. The standard should require explicit sign-off before implementation, whether that's a comment, a tag in the commit message, or some other approval marker.

**PR ownership:** The person who initiated the work owns the PR, regardless of who (or what) wrote the code. You're responsible for the quality of the plan, reviewing the work, fixing any issues, and the impact after merge.

**Human review focus:** When AI review agents have already analyzed a PR, human reviewers focus on intent, not implementation. Ask yourself: Does this match what we agreed to build? Does the approach make sense? Are there business logic issues? Don't bother checking for syntax errors, security vulnerabilities, performance issues, or style—that's what the review agents already did.

**Async by default:** Compound engineering works well asynchronously. Plans can be created, reviewed, and approved without scheduling a meeting. Instead of telling your colleague, "Let's meet to discuss the approach," try, "I've created a plan document—please comment by end of day."

**Handoffs:** When handing off work to someone else, include everything they need: status, what's done, what's left, context, and how to continue:
```
## Handoff: Email Notifications
Status: Plan approved, implementation 50%
What's left: User preference settings, unsubscribe flow
How to continue: Run /work in the feature branch
```

**Clear ownership + async updates:** Each major feature should have one owner. That person creates the plan, monitors the AI implementation, reviews the findings, merges when it's ready, and updates the team asynchronously.

When everyone ships faster, merge conflicts increase. Ship small pieces, use feature flags, merge to main frequently, and resolve conflicts immediately.

**Compound docs = tribal knowledge:** You shouldn't need to ask a colleague for knowledge that could be baked into the system. Instead of saying, "Ask Sarah, she knows how auth works," Sarah runs `/workflows:compound` after implementing the feature. Now the solution is documented, and anyone can find it.

## User Research

Structure research so AI can use it. Build persona documents, link insights to features, close the loop between research and implementation.

**Traditional:** Researcher conducts interviews → Writes report → Report sits in Google Drive → Developer builds feature → Developer never reads report → Feature doesn't match user needs

**Compound engineering:** Research generates structured insights → Insights become planning context → AI references insights when planning → Features are informed by research → Usage data validates insights → Insights compound

Raw interview notes are hard for AI to use. Structure them:
```markdown
# research/interviews/user-123.md
participant: Marketing Manager, B2B SaaS
focus: Dashboard usage patterns

### Insight: Morning dashboard ritual
**Quote**: "First thing every morning, I check for red flags."
**Implication**: Dashboard needs to surface problems quickly.
**Confidence** (4/5 participants)
```

Create persona documents that the AI can reference:
```markdown
# personas/marketing-manager.md
Goals:
1. Prove marketing ROI to leadership
2. Identify underperforming campaigns quickly

Pain points:
1. Too much data, hard to find what matters
2. Exporting for reports is tedious

Key quotes:
- "I need to see problems, not everything."
- "My boss wants a PDF, not a link."

Data:
- 3/5 interviewed users mentioned exporting weekly
- The marketing-manager persona exports every Friday
- Current pain: manual export process
- Design for: Automated weekly exports to email
```

**Capture user data:** Your users are already telling you what to build through how they use your product. Each click is a clue. You just have to pay attention.

- **Power features:** Features that are used way more than expected. Another signal could be users returning to the same page repeatedly.
- **Workarounds:** Look for high dwell time on simple pages or repeated attempts at the same action. Error → retry → error loops.
- **Data shuffling:** This is where users invent their own solutions because your product doesn't do what they need. Look for users who export data from one place and reimport it somewhere else. Users might be copying and pasting between screens, or keeping multiple tabs open to compare things side by side.
- **Drop-off points:** This is where users drop off in flows. Features have been started but not completed.

**Turning patterns into decisions:**
- You notice users copying data from one table and pasting it into another 50 times a week. → They need automation between tables.
- You notice users creating "template" projects and duplicating them for new work. → They want project templates but don't have them.

## Copy

Most teams treat copy as an afterthought—something to fill in after the feature is built. But copy is part of the user experience. It deserves the same attention as the code.

Include copy in your plans from the start, codify your voice so the AI can follow it, and review it like you'd review any other output:

```markdown
## Feature: Password Reset Flow
Copy:
- Email subject: "Reset your password"
- Success message: "Check your email. We sent a reset link."
- Error (not found): "We couldn't find an account with that email."
```

Now when the AI implements, the copy is already there.

Create a skill that defines your copy voice, such as the following:
1. Talk to users like humans, not robots
2. Error messages should help, not blame
3. Short sentences. Clear words.

Replace:
- "Error" → describe what happened
- "Successfully" → just say what happened
- "Please" → just ask directly

Bad: "Invalid credentials. Please try again."
Good: "That password isn't right. Try again or reset it."

**Copy checklist:**
- Can a non-technical user understand this?
- Does this help the user succeed?
- Does this match our voice guide?
- Does this match similar text elsewhere?

## Marketing

Congratulations, you've shipped something. Now it's time to tell the world. The same system that builds features can announce them. Generate release notes from plans, create social posts, and capture screenshots automatically.

**Flow:**
1. An engineer creates a plan that includes the product value proposition.
2. The AI generates release notes from the plan.
3. The AI generates social posts from the release notes.
4. The AI generates screenshots using Playwright.
5. The engineer reviews and ships everything together.

It all flows from one place. No one has to hand anything off, and nothing slips through the cracks.

**Release notes prompt:**
```
Based on the plan and implementation for [feature], write release notes:
1. Lead with the user benefit (what can they do now?)
2. Include one concrete example
3. Mention any breaking changes
```

The AI has the plan, the code changes, and the tests. It knows exactly what was built.

**Changelog:** Looks at recent merges to main, reads the plans/PRs for each, generates an engaging changelog.

**Screenshots:** Use Playwright to capture screenshots for marketing:
```
Take screenshots showing the new notification settings:
1. The settings page with notifications section
2. An example notification email
3. The in-app notification badge
```
No more asking engineering for screenshots, and no more out-of-date screenshots.

## Three Questions Without Tooling

1. "What was the hardest decision you made here?"
2. "What alternatives did you reject, and why?"
3. "What are you least confident about?"
