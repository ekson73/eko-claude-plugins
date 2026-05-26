# ADR-001: Float plugin sources to default branch; version SSOT in plugin.json

- **Status**: Accepted (⏳ re-validate by **2026-11-26** — 6-month TTL)
- **Date**: 2026-05-26
- **Deciders**: Operator (DevSecOps / AI-eng), via HITL directive
- **Scope**: This marketplace (`eko-claude-plugins`) + all listed plugins — part of a cross-repo decision (companion ADRs in `vek-claude-plugins`, `vek-ai-toolkit`, `multi-agent-os`)

## Context

Pinning each plugin to a commit `sha` (plus a duplicated per-entry `version`) created recurring friction:

1. **Agents forget to bump the pin** when the plugin repo changes (caused a version/SHA desync fixed in `vek-claude-plugins` PR #5).
2. **Mandatory marketplace maintenance** on every plugin release (a second PR just to bump the pin).
3. **Latency** green-PR → user-visible.

`maos` is listed in **two** marketplaces (`eko-claude-plugins` + `vek-claude-plugins`), and the pins had drifted across them. Phase reality: **MVP / expansion, lean team, agility-critical, no production environment yet.**

Anthropic's plugin-marketplace docs support unpinned sources: `source.ref` defaults to the repo default branch; omitting `version` makes "every commit count as a new version."

## Decision

1. **Marketplace entries float**: `source = { "source": "github", "repo": "…", "ref": "main" }` — no `sha`, no per-entry `version`.
2. **Version SSOT lives in each plugin's own `plugin.json`** (e.g. `maos` → `multi-agent-os/.claude-plugin/plugin.json`).
3. Applies to **all** listed plugins. Marketplace becomes *set-and-forget*; the cross-marketplace `maos` SHA divergence auto-resolves (both track `main`).

## Consequences

**Positive**: zero marketplace maintenance; faster propagation; divergence auto-resolved.

**Negative / risks (accepted for MVP, TTL-boxed)**: reproducibility loss (users on different commits per refresh); supply-chain blast-radius from a tracked `main`.

**Mitigations**: own repos' `main` is PR-gated + branch-protected (`[C18]`); user-side `/plugin marketplace update` + startup auto-update still gate propagation; **re-validate by 2026-11-26**; re-pin on any incident.

## Re-validation trigger (TTL)

| When | Action |
|---|---|
| **2026-11-26** (6 months) | Re-assess float vs re-pin; reconsider once production exists |
| Any supply-chain incident | Re-pin the affected plugin immediately |

## References

- Anthropic plugin-marketplaces docs (version resolution)
- `vek-claude-plugins` PR #5 + ADR-001 (companion)
- `[C12]` Plugin Provenance, `[C14]` External-Repo Integration (conscious MVP deviation, time-boxed)
- Companion ADRs: `vek-ai-toolkit`, `multi-agent-os`
