# ADR-003: Multi-host distribution hub (catalog only)

- **Status**: Accepted
- **Date**: 2026-08-10
- **Deciders**: Operator (Pi session final round)
- **Scope**: This repo only (`eko-claude-plugins` → future `eko-plugin-marketplace`). **Not** multi-agent-os content.

## Context
Claude-only marketplace name/epistemology is too narrow. Multiple harnesses need discover/install pointers. Agentic-tools must not live in the index repo. Universal single plugin/marketplace format across hosts is impossible; multi-adapter catalog in one git-repo is possible.

## Decision
1. This repo is a **distribution hub**: Claude marketplace + multi-host **registry/catalog of pointers**.
2. **Forbidden content trees:** `skills/`, `agents/`, `commands/`, `hooks/` (logic), `mcp-tools/`, product `bin/` clones.
3. Upstream products (e.g. `maos` @ `ekson73/multi-agent-os`) remain separate repos; entries float per ADR-001.
4. Add `registry/catalog.json` with per-provider status: `ready | pending-upstream | docs | n/a`.
5. Host folders under `hosts/*` hold install docs only.
6. Rename to **`eko-plugin-marketplace`** (Anima; overturned opaque `eko-pack-index`) is planned (ADR-004); not blocking P0–P1 structure.

## Host policy (honest, ~2026-08)
| Priority | Hosts | Action in this repo |
|---|---|---|
| MUST | Claude Code | keep marketplace.json green |
| SHOULD | Pi, OpenCode, Codex | pointer/docs; pending-upstream until product scaffolds exist |
| COULD | GH Copilot, Kiro, Warp, Gemini/Antigravity | docs-only pointers |
| N/A | ChatGPT store, Grok, Muse Code, VS Code VSIX index | explicit n/a |

## Consequences
+ Clear domain vs MAOS; multi-host discoverability without god-repo.
− Pi/OpenCode `ready` blocked on MAOS packaging work (tracked as upstream issues, not implemented here).

## Addendum 2026-08-10 (status, non-breaking)

| Host | ADR-003 original | Actual (post MAOS #315 + research) |
|---|---|---|
| Pi | pending-upstream | **ready** (MAOS `package.json` pi.skills) |
| OpenCode | pending-upstream | **ready** (MAOS `packaging/opencode-maos`) |
| Codex | docs | **docs** (skills.sh) |

Council artifact: `docs/research/HOST-RESEARCH-2026-08.md`. Rename still ADR-004 + RENAME_HOLD.
