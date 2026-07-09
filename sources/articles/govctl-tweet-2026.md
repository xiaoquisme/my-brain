---
title: "Governance-as-code CLI for AI-assisted software teams (Tom Dörr tweet)"
source_url: https://x.com/tom_doerr/status/2073089713771106703
ingested: 2026-07-08
type: article
tags: [swe-tool, governance, ai-coding, agent, governance-as-code]
sha256: e450400364547d6b61863a5fbca9b5f816196539abaab0e7489b9abd62fcbd7c
---

Tom Dörr @tom_doerr (2026-07-05)

Governance-as-code CLI for AI-assisted software teams

https://github.com/govctl-org/govctl

Stats: 268 likes, 26 retweets, 313 bookmarks, 17K views, 1 reply

---

## GitHub: govctl

https://github.com/govctl-org/govctl

**govctl** is a governance-as-code CLI for teams using AI to build software seriously.

It gives AI-assisted development a control plane that lives in your repo:

- **RFCs** say what must be true
- **ADRs** record why a design was chosen
- **Work items** track execution and acceptance criteria
- **Verification guards** enforce executable completion gates

### Why govctl

Most AI coding tools optimize for generation. govctl optimizes for delivery.

Without explicit governance, teams drift into the same pattern:
- ideas jump straight into implementation
- decisions live in chat history instead of artifacts
- code and specs diverge silently
- "done" means "the agent stopped typing", not "the work passed verification"

**Without govctl:** prompt → code → drift → arguments
**With govctl:** RFC / ADR → work item → guarded implementation → stable history

### What Makes It Different

1. **Spec-first by default** — implementation follows governed artifacts (RFCs, ADRs, work items)
2. **Artifacts are the control plane** — lives in `gov/` as TOML files with schema headers, diffable, PR-reviewable
3. **One CLI agents can reliably operate** — `list`, `show`, `get`, `edit` + resource-specific lifecycle verbs
4. **Works in brownfield repos** — `/migrate` workflow for incremental adoption

### Quick Start

```
cargo install govctl
# Or: cargo binstall govctl
govctl init
govctl status
govctl rfc new "Caching Strategy"
govctl adr new "..."
```
