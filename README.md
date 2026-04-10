# Eko Claude Plugins

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin%20Marketplace-blueviolet)](https://claude.ai/code)
[![Plugins](https://img.shields.io/badge/Plugins-1-green)](https://github.com/ekson73/eko-claude-plugins)

Personal Claude Code plugin marketplace by [Emilson Moraes](https://github.com/ekson73).

## Quick Start

```bash
# Add marketplace
claude plugin marketplace add ekson73/eko-claude-plugins

# List available plugins
claude plugin marketplace list

# Install a plugin
claude plugin install multi-agent-os
```

## Available Plugins

| Plugin | Description | Version | Category |
|--------|-------------|---------|----------|
| [multi-agent-os](https://github.com/ekson73/multi-agent-os) | Multi-Agent Coordination Framework | 1.5.0 | AI Agents |

## Plugin Details

### multi-agent-os

A comprehensive Claude Code plugin for orchestrating AI agents in software development workflows.

**Features:**
- Sentinel Protocol (anomaly detection, loop prevention, 10 rules)
- Status Map System (human-centric observability, 9 templates)
- Anti-Conflict Protocol (git worktree coordination, 7 phases)
- Hierarchical Merge Protocol (branch convergence)
- TTL Policy (content freshness management)
- Response Compression (output verbosity control, GaaS enforcement)
- GaaS (Governance-as-a-Service: deterministic hooks > probabilistic prompts)

**Components:**

| Type | Count | Examples |
|------|-------|----------|
| Skills | 12+ | context-prep, agent-select, response-compression, audit, find-docs |
| Commands | 6 | `/sync`, `/audit`, `/status`, `/worktree`, `/delegate`, `/mvv` |
| Agents | 14+ | orchestrator, sentinel-monitor, forge, governance-auditor, code-reviewer |
| Hooks | 5 | SessionStart, PreToolUse[Task], PreToolUse[Bash], PostToolUse, Stop |
| MCP Tools | 1 | maos-mcp-hub (6 Atlassian gateways, 96 actions) |

**Installation:**
```bash
# From marketplace (recommended)
claude plugin marketplace add ekson73/eko-claude-plugins
claude plugin install multi-agent-os

# From source
git clone https://github.com/ekson73/multi-agent-os.git
claude plugins install /path/to/multi-agent-os
```

## Contributing

To suggest a plugin for this marketplace:

1. Ensure your plugin has `.claude-plugin/plugin.json`
2. Open an [issue](https://github.com/ekson73/eko-claude-plugins/issues) with plugin details
3. Or submit a PR adding your plugin to `marketplace.json`

### Plugin Requirements

- Public GitHub repository
- Valid `plugin.json` with required fields
- MIT or compatible license
- Documentation (README.md)

## Related Resources

- [Claude Code Plugin Documentation](https://code.claude.com/docs/en/plugin-marketplaces)
- [Official Claude Plugins](https://github.com/anthropics/claude-plugins-official)

## License

[MIT License](LICENSE)

---

*Maintained by [Emilson Moraes](https://github.com/ekson73) | Powered by Claude Code*
