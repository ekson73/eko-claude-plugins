# Claude Code

| Field | Value |
|---|---|
| **eko status** | `ready` |
| **Domain** | distribution pointer only — **no** agentic-tools in eko |
| **Upstream product example** | `maos` → https://github.com/ekson73/multi-agent-os |
| **Catalog** | `registry/catalog.json` → `providers.claude` (or mapped key) |

## Why in eko
First-class **plugin marketplace** (Anthropic). This hub *is* a Claude marketplace.

## Install (BC path until GitHub rename P3)
```text
/plugin marketplace add ekson73/eko-claude-plugins
/plugin install maos@eko-claude-plugins
```
Update: `/plugin marketplace update eko-claude-plugins`

## Evidence (≈2026-08)
Claude Code ~2.1.x; official docs heavily document marketplace/plugin; repo anthropics/claude-code very active.
