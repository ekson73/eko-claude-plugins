# Eko Plugin Marketplace _(repo: `eko-claude-plugins`)_

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin%20Marketplace-blueviolet)](https://claude.ai/code)
[![Hub](https://img.shields.io/badge/role-distribution%20hub-green)](./docs/domain-boundary-eko-vs-maos.md)
[![Branching: GitHub Flow](https://img.shields.io/badge/branching-GitHub%20Flow%20(Class%20B)-0a7bbb)](./AGENTS.md)

> **Role:** multi-host **distribution / discovery hub** (marketplace + registry of pack pointers).  
> **Not a plugin. Not agentic-tools.** Product packs (e.g. `maos`) live in upstream repos such as [`multi-agent-os`](https://github.com/ekson73/multi-agent-os).  
> **Anima name (target rename):** [`eko-plugin-marketplace`](./docs/adrs/ADR-004-rename-eko-plugin-marketplace.md) · **ADR-003:** multi-host hub.

Personal hub by [Emilson Moraes](https://github.com/ekson73) — Claude marketplace entries float on upstream `main` per [ADR-001](./docs/adrs/ADR-001-float-marketplace-sources.md). Machine index: [`registry/catalog.json`](./registry/catalog.json).

### Domain boundary (do not blur)

| This repo (eko) | multi-agent-os |
|---|---|
| marketplace / registry / install pointers | skills, agents, hooks, commands, mcp-tools, product bins |
| discover & install | implement & version product |

See [domain-boundary-eko-vs-maos.md](./docs/domain-boundary-eko-vs-maos.md).

### Multi-host status (honest)

| Host | Status in catalog |
|---|---|
| Claude Code | **ready** |
| Pi / OpenCode | **pending-upstream** (need package scaffolds on MAOS) |
| Codex | **docs** (`npx skills add` → MAOS) |
| GH Copilot / Kiro / Warp / Gemini / Antigravity | **docs** |
| ChatGPT store / Grok / Muse / VS Code VSIX index | **n/a** |

---

## Install & use the plugins

Plugin management runs **inside a Claude Code session** via the `/plugin` command (there is **no** shell `claude plugins` subcommand):

```text
/plugin marketplace add ekson73/eko-claude-plugins
/plugin install maos@eko-claude-plugins
/reload-plugins
```

- `/plugin marketplace add` registers this catalog once per machine; afterwards `/plugin install <name>@eko-claude-plugins` for any listed plugin.
- Run `/plugin` (Installed tab) to confirm, and `/help` to see the new skills/commands.

> **Plugin name vs repo name**: the repository is `multi-agent-os`, but the **plugin is named `maos`** (see its `.claude-plugin/plugin.json`). Install and reference it as `maos`. Its skills/commands surface namespaced as **`/maos:<name>`** (e.g. `/maos:maos-concierge`, `/maos:agentic-status`).

### Keep plugins up to date

Sources **float on `main`** (ADR-001), so refreshing pulls each plugin's latest upstream commit:

```text
/plugin marketplace update eko-claude-plugins
```

Claude Code also auto-checks for marketplace updates at startup.

### Troubleshooting

| Symptom | Fix |
|---|---|
| `install` can't find the plugin | Use the **plugin name** `maos` (not the repo name `multi-agent-os`): `/plugin install maos@eko-claude-plugins`. |
| Commands missing after install | Restart the session, then `/plugin` (Manage tab) to confirm it's enabled. |
| Stuck on an old version | `/plugin marketplace update eko-claude-plugins` (float means update = latest upstream commit). |

---

## Registered Plugins

| Plugin | Description | Category | Source | License |
|--------|-------------|----------|--------|---------|
| [maos](https://github.com/ekson73/multi-agent-os) | Multi-Agent Coordination Framework — orchestration, Sentinel Protocol, worktree governance, the Forge meta-agent; ships `maos-concierge` | AI Agents | `github:ekson73/multi-agent-os` @ `main` (float, ADR-001) | MIT |

> Versions are **not pinned** at the marketplace layer (float, ADR-001) — each plugin's canonical semver lives in its own upstream `plugin.json`.

### maos — what's inside

Sentinel Protocol (anomaly detection / loop prevention) · Status Map observability · Anti-Conflict worktree coordination · Hierarchical Merge · GaaS (Governance-as-a-Service: deterministic hooks > probabilistic prompts).

| Type | Count (representative) | Examples |
|------|------------------------|----------|
| Agents | 20+ | `maos:orchestrator`, `maos:sentinel-monitor`, `maos:forge`, `maos:code-reviewer` |
| Skills | 40+ | context-prep, audit, find-docs (list with `/help`) |
| Commands | 12+ | `/maos:agentic-status`, `/maos:maos-concierge`, … |
| Hooks | 5 | SessionStart · PreToolUse[Task] · PreToolUse[Bash] · PostToolUse · Stop |
| MCP | maos-mcp-hub | 6 Atlassian gateways |

> Counts are a **representative subset** (the live surface evolves). Discover the current set with `/help`, `/agents`, and `/maos:maos-concierge`.

---

## Contributing

To suggest a plugin for this marketplace:

1. Ensure your plugin has a valid `.claude-plugin/plugin.json`.
2. Open an [issue](https://github.com/ekson73/eko-claude-plugins/issues) with plugin details, **or** submit a PR adding it to `marketplace.json` (float `github` source per ADR-001).

**Plugin requirements**: public GitHub repo · valid `plugin.json` · MIT-or-compatible license · `README.md`. Maintainers work via **worktree → branch → PR → squash-merge** per [`AGENTS.md`](./AGENTS.md) / ADR-002 (never commit `main` directly). Do **not** add a per-plugin `"version"` field to `marketplace.json` (it breaks `/plugin update`).

---

## Related Resources

- [Claude Code Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) · [Discover plugins](https://code.claude.com/docs/en/discover-plugins)
- [Official Anthropic plugins](https://github.com/anthropics/claude-plugins-official)
- AI-agent guidance: [`AGENTS.md`](./AGENTS.md) (vendor-neutral SSOT) + [`CLAUDE.md`](./CLAUDE.md)

---

## License

[MIT License](LICENSE)

---

*Maintained by [Emilson Moraes](https://github.com/ekson73) | Powered by Claude Code*
