# Microsoft — VS Code + GitHub Copilot

| Field | Value |
|---|---|
| **VS Code** | `n/a` |
| **GH Copilot** | `docs` |
| **Research** | [HOST-RESEARCH-2026-08.md](../../docs/research/HOST-RESEARCH-2026-08.md) |

## GitHub Copilot (2026)
Official extensibility (cloud agent / agents docs):
- **Agent Skills** (instructions, scripts, resources)
- **Custom agents**
- **Hooks**
- **MCP servers**

eko does **not** clone the Claude marketplace into Copilot. Discovery bridge:

```bash
npx skills add ekson73/multi-agent-os -g -a github-copilot
# or
npx skills add ekson73/multi-agent-os -g -a '*' -y
```

Docs: [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills).

## VS Code Marketplace
Editor extensions. **n/a** for eko-as-agent-pack-index. No VSIX product.

## Verdict
| eko Copilot “marketplace.json” | **No** |
| skills.sh pointer | **Yes** |
