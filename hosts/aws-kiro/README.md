# AWS Kiro

| Field | Value |
|---|---|
| **eko status** | `docs` |
| **Domain** | distribution pointer only |
| **Upstream** | https://github.com/ekson73/multi-agent-os |
| **Compat matrix** | [MULTI-HARNESS-COMPAT.md](../../docs/MULTI-HARNESS-COMPAT.md) |

## Discovery install
```bash
npx skills add ekson73/multi-agent-os -g -a kiro
```
Kiro surfaces: **ACP**, **AGENTS.md**, **Skills**, **MCP**, **Open VSX**.

eko does **not** become an Open VSX publisher. Catalog line = find upstream packs (MAOS skills/MCP docs).

Fallback: `npx skills add ekson73/multi-agent-os -g -a '*' -y`.
