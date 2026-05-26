# AGENTS.md — Agent Instructions (AAIF SSOT)

> Vendor-neutral single source of truth for AI agents working in this repo. Vendor-specific files (`CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`) are **thin pointers** to this file. For marketplace-specific guidance see [`CLAUDE.md`](./CLAUDE.md).

This repo is a **Claude Code plugin marketplace** — **Class B** (consumed by users, **not** deployed to environments).

## Branching & Release Model — GitHub Flow (Class B: library/marketplace)

> Model = **GitHub Flow + SemVer**. See [`docs/adrs/ADR-002-github-flow-branching.md`](./docs/adrs/ADR-002-github-flow-branching.md).

- **Trunk**: `main` is always releasable. **No environment branches** (no `homolog`/`ppe`/`prd` here — those exist only in Class A *deployed apps* like `vek-sales`/`vek-list`).
- **Work**: branch `feature/<id>-slug` · `fix/<id>-slug` · `hotfix/<id>-slug` · `docs/` · `chore/` off `main` → PR → **squash-merge** → **delete branch**.
- **Agents MUST**: never commit to `main` directly · always open a PR · never create env-branches here · treat tagging/release as a human/operator gate.
- **Versioning & consumer source-pin**: governed by the companion **ADR-001** (`float-marketplace-sources`) + Jira — plugin `source.ref = main` during MVP (TTL'd 2026-11-26), version SSOT in each plugin's `plugin.json`. Do **not** re-decide it here. Do **not** add per-plugin `version` to `marketplace.json` (breaks `/plugin update`).
