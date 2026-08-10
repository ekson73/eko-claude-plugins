# Microsoft — VS Code + GitHub Copilot

| Field | Value |
|---|---|
| **eko status** | `docs / n/a` |
| **Domain** | distribution pointer only — **no** agentic-tools in eko |
| **Upstream product example** | `maos` → https://github.com/ekson73/multi-agent-os |
| **Catalog** | `registry/catalog.json` → `providers.microsoft` (or mapped key) |

## VS Code — status `n/a`
Has a real **Extension Marketplace** (MS) + Open VSX. That is for **editor extensions**, not eko’s role as an agent pack index.

eko will **not** publish a VSIX that pretends to be a universal agent marketplace unless a deliberate product decision creates one (out of current scope).

## GitHub Copilot — status `docs`
Copilot agent surface documents **Plugins, Skills, MCP, Hooks** (enterprise plugin standards). Formats ≠ Claude `marketplace.json`.

eko action: docs pointer to how to consume **upstream** skills/packs (e.g. MAOS via skills CLI / Copilot skill install docs). No Claude marketplace clone inside Copilot.
