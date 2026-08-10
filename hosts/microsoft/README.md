# Microsoft — VS Code + GitHub Copilot

| Field | Value |
|---|---|
| **VS Code eko status** | `n/a` |
| **GH Copilot eko status** | `docs` |
| **Domain** | distribution pointer only |
| **Upstream** | https://github.com/ekson73/multi-agent-os |
| **Compat matrix** | [MULTI-HARNESS-COMPAT.md](../../docs/MULTI-HARNESS-COMPAT.md) |

## GitHub Copilot — portable skills path
```bash
npx skills add ekson73/multi-agent-os -g -a github-copilot
```
Copilot also documents native **Plugins, Skills, MCP, Hooks**. Formats ≠ Claude `marketplace.json`. skills.sh is the **eko discovery bridge** into MAOS content.

If agent id differs in your CLI: `npx skills add ekson73/multi-agent-os -g -a '*' -y`.

## VS Code Marketplace — `n/a`
Editor extension marketplace is the wrong abstraction for eko-as-agent-pack-index. No VSIX product in scope.

## Not in eko
VSIX that pretends to be a universal agent marketplace.
