# ADR-004: Rename eko-claude-plugins → eko-plugin-marketplace

- **Status**: **DECIDED** — operator accepted Anima default **A** (2026-08-10); GitHub rename still Phase P3
- **Date**: 2026-08-10 (revised same-day — overturned interim `eko-pack-index`)
- **Name authority**: Anima council re-run after operator gloss-independence critique

## Name decision

| Rank | Name | Verdict |
|---|---|---|
| **Winner** | **`eko-plugin-marketplace`** | Self-explanatory: Eko marketplace of plugins (multi-host catalog) |
| Runner-up | `eko-plugin-catalog` | Also clear; slightly less “store” |
| Rejected interim | `eko-pack-index` | Opaque — fails gloss-independence |
| Legacy | `eko-claude-plugins` | Host-locked (`claude`) |

## Why not eko-pack-index
Operator: feels disconnected unless explained. “pack-index” is insider jargon (double abstract noun) and drops both high-signal tokens from the legacy name (`plugin`, marketplace role).

## Why eko-plugin-marketplace
- Elevator: “Eko’s marketplace/catalog of installable plugins for AI coding harnesses.”
- Keeps **plugin** continuity from `eko-claude-plugins`.
- Drops only the **claude** host lock.
- “Marketplace” is the industry word for this distribution role (Claude MP, VS Marketplace, plain English).
- Pi “package” / OpenCode “plugin” remain provider-specific *kinds* inside `registry/catalog.json`, not a reason to use opaque umbrella jargon.

## BC plan
1. Land catalog under current GitHub name `eko-claude-plugins`.
2. README dual-identity: *target name eko-plugin-marketplace; formerly eko-claude-plugins; interim reject eko-pack-index*.
3. GitHub rename when consumers notified.
4. Claude `/plugin marketplace add` path updates.

## Non-goals
Does not move agentic-tools into this repo. Does not merge with multi-agent-os.

## Council R3 (same day) — expanded matrix

Operator asked to include `eko-plugins-marketplace` and `eko-{agent,agents,agentic}-{plugins,marketplace,registry,…}`.

| Result | Name |
|---|---|
| **Confirmed winner** | `eko-plugin-marketplace` |
| Operator form (not default) | `eko-plugins-marketplace` — marked EN plural attributive; HITL override only |
| Hard reject | `eko-agent(s)-*` — ontology bleed (marketplace *of agents*) |
| Soft reject | bare `eko-agentic-marketplace` — jargon, drops plugin continuity |
| Long OK-but-heavy | `eko-agentic-plugin-marketplace` |

Full table: akasha `docs/decisions/ADR-eko-plugin-marketplace-naming-council-r3-2026-08-10.md`.

## Operator acceptance
- **2026-08-10:** Operator chose **A)** `eko-plugin-marketplace` (Anima default).  
- Not B (`eko-plugins-marketplace`) · not C (`eko-agentic-plugin-marketplace`).  
- Naming closed; remaining work is implementation roadmap (P2/P3), not re-litigation.
