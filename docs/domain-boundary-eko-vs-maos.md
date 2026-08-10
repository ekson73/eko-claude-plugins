# Domain boundary: eko-plugin-marketplace vs multi-agent-os

| | **eko-plugin-marketplace** (repo today: `eko-claude-plugins`) | **multi-agent-os** |
|---|---|---|
| Role | Distribution / discovery hub | Product `maos` |
| Contains | marketplace.json, catalog.json, host install docs | skills, agents, hooks, commands, mcp-tools, bin, protocols |
| Does not contain | agentic-tool trees | multi-host store UX (may be *listed* by eko) |
| Install Claude | `/plugin marketplace add ekson73/eko-claude-plugins` then `maos@eko-claude-plugins` | is the plugin source floated by marketplace |
| Version SSOT | catalog/marketplace metadata | `.claude-plugin/plugin.json` |
| Target GitHub name | **`eko-plugin-marketplace`** (Anima + operator HITL **A** accepted 2026-08-10) | unchanged |

**Invariant:** eko points; MAOS is pointed-to.
