# Domain boundary: eko-pack-index vs multi-agent-os

| | **eko** (this repo) | **multi-agent-os** |
|---|---|---|
| Role | Distribution / discovery hub | Product `maos` |
| Contains | marketplace.json, catalog.json, host install docs | skills, agents, hooks, commands, mcp-tools, bin, protocols |
| Does not contain | agentic-tool trees | multi-host store UX (may be *listed* by eko) |
| Install Claude | `/plugin marketplace add ekson73/eko-claude-plugins` then `maos@eko-claude-plugins` | is the plugin source floated by marketplace |
| Version SSOT | catalog/marketplace metadata | `.claude-plugin/plugin.json` |

**Invariant:** eko points; MAOS is pointed-to.
