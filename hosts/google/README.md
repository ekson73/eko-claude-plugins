# Google — Gemini CLI + Antigravity

| Field | Value |
|---|---|
| **Gemini eko status** | `docs` |
| **Antigravity eko status** | `docs` |
| **Domain** | distribution pointer only |
| **Upstream** | https://github.com/ekson73/multi-agent-os |
| **Compat matrix** | [MULTI-HARNESS-COMPAT.md](../../docs/MULTI-HARNESS-COMPAT.md) |

## Gemini CLI — portable skills path
```bash
npx skills add ekson73/multi-agent-os -g -a gemini-cli
```
Gemini also supports **extensions** (host-native). eko does **not** publish Gemini extensions; we document the portable skills discovery line. If `-a gemini-cli` is rejected by your skills CLI version, use `-a '*'`.

## Antigravity — best-effort
```bash
npx skills add ekson73/multi-agent-os -g -a '*' -y
```
No stable third-party pack registry comparable to Claude/Pi. Keep `docs` until an official install path can be pointer-locked as `ready`.

## Not in eko
Fabricated `marketplace.json` for Gemini · agentic-tool trees.
