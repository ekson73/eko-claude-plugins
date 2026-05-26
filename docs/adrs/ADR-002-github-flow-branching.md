# ADR-002: GitHub Flow branching model (Class B — marketplace)

- **Status**: Accepted
- **Date**: 2026-05-26
- **Deciders**: Operator (DevSecOps / AI-eng), via HITL directive
- **Scope**: This marketplace (Class B: **consumed, not deployed**). **Companion to ADR-001** (`float-marketplace-sources`): ADR-001 governs how *consumers* pin plugin sources (float `main`); **this ADR governs how *maintainers/agents* branch.**

## Context

Vek repos split into two classes:
- **Class A — apps that DEPLOY** (`vek-sales`, `vek-list`): GitLab-Flow-Lite + env-branches (`main`/`homolog`/`prod`) + canary ring.
- **Class B — libraries/marketplaces that are CONSUMED** (this repo): no environment to deploy to → env-branches meaningless.

The marketplace had a source-float decision (ADR-001) but **no NAMED branching model in an agent-facing SSOT**. There was also no `AGENTS.md` (created in this change).

## Decision

Adopt **GitHub Flow + SemVer** (Class B):
1. Single trunk `main`, always releasable.
2. Short-lived `feature/` · `fix/` · `hotfix/` · `docs/` · `chore/` branches → PR → **squash-merge** → **delete branch**.
3. **No environment branches** here.
4. Versioning + consumer source-pin governed by **companion ADR-001 (float, TTL'd)** — not re-decided here.
5. Agents MUST: never commit `main` directly · always PR · never create env-branches · tagging/release = human/operator gate.

## Consequences

- **Positive**: one named model across all Class-B repos → zero human/agent confusion; `AGENTS.md` now exists as discoverable SSOT.
- **Negative (mitigated)**: one more ADR — short, companion to ADR-001.

## References
- **Companion**: `ADR-001-float-marketplace-sources.md` + Jira ticket
- `AGENTS.md` §"Branching & Release Model"
- Class A counterpart: `vek-sales`/`vek-list` GitLab-Flow-Lite
