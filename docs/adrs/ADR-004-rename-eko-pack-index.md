# ADR-004: Rename eko-claude-plugins → eko-pack-index

- **Status**: Accepted (execution deferred to Phase P3)
- **Date**: 2026-08-10
- **Name authority**: Anima (`[[anima]]`) — decided `eko-pack-index`; runner-up `eko-harness-catalog`

## Why
`-claude-plugins` locks epistemology to one harness. Hub role is multi-host pack **index**.

## BC plan
1. Land catalog + docs under current repo name first (P0–P2).
2. Document dual identity in README (`formerly eko-claude-plugins`).
3. GitHub rename `ekson73/eko-pack-index` when consumers notified.
4. Claude marketplace add path updates; keep `"name"` field migration notes (MAJOR consumer docs).
5. Optional: temporary stub repo or README redirect at old name if GH allows.

## Non-goals
Rename does not move agentic-tools into this repo.
