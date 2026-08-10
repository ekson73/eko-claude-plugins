# Host matrix — eko-plugin-marketplace (research ≈2026-08)

> **Domain:** distribution only (marketplace / registry / package / plugin **pointers**).  
> **Not:** agentic-tools content (skills, agents, commands, hooks, mcp servers).  
> **Product SSOT:** upstreams e.g. `multi-agent-os` (`maos`).  
> **Name:** DECIDED `eko-plugin-marketplace` (repo BC `eko-claude-plugins`).

## Snapshot signals (Aug 2026)

| Host | Version / signal | Packaging surface | eko action |
|---|---|---|---|
| **Claude Code** | CLI ~2.1.224; anthropics/claude-code ~141k★ | **Marketplace + plugin** first-class | **MUST ready** — this repo *is* the Claude marketplace |
| **OpenCode** | npm ~1.18.x; ~196k★; plugins docs | **Plugin** npm/local + skills + MCP | **ready** — `packaging/opencode-maos` + skills via npx skills (MAOS #315) |
| **Pi** | pi-coding-agent **0.84.1**; pi.dev packages | **Package** npm/git | **ready** — root `package.json` pi.skills (MAOS #315) |
| **Codex** | ~105k★; Skills docs | Skills + MCP (not Claude MP) | **SHOULD docs** — `npx skills add` → upstream |
| **ChatGPT** | Plugins/GPT store | OpenAI-owned store | **N/A** |
| **Gemini CLI** | ~106k★ | Extensions | **COULD docs** |
| **Antigravity** | community IDE ecosystem | unstable extension story | **COULD docs** |
| **VS Code** | MS Marketplace + Open VSX | Editor extensions | **N/A** for eko-as-VSIX-index |
| **GH Copilot** | Plugins/Skills/MCP/Hooks docs | Copilot formats | **COULD docs** |
| **AWS Kiro** | Open VSX + Skills/MCP/ACP | IDE + Open VSX | **COULD docs** |
| **Warp** | ~64k★ ADE | thin 3p pack mall | **COULD docs** |
| **Grok** | model/API | provider | **N/A** |
| **Meta Muse Code** | community dumps | no stable 3p registry | **N/A** |

### Cross-cutting (not eko ownership, but related)
| Layer | Role | Relation to eko |
|---|---|---|
| **skills.sh** (`npx skills` ~1.5.22) | Multi-agent **skill** install (70+ agents) | eko may **document** skills install lines; skills content stays upstream |
| **MCP** | Portable tools | eko does **not** host MCP servers; may link docs only |

## Decision rules (honest)

| Create in eko? | When |
|---|---|
| **Claude marketplace entry** | Always for listed packs |
| **catalog provider row `ready`** | Only if install command works **today** without lying |
| **catalog `pending-upstream`** | Host has real pack system; upstream lacks scaffold |
| **catalog `docs`** | Host exists; only human/agent docs pointer is honest |
| **catalog `n/a`** | Not a pack host, or store not controllable, or wrong abstraction |

## Priority for eko engineering effort

| Priority | Work | Depends on |
|---|---|---|
| **P0** | Keep Claude marketplace green | eko only |
| **P1** | Maintain `registry/catalog.json` truthfulness | eko only |
| **P2** | Host README stubs (this doc’s folders) | eko only |
| **P2b** | MAOS issues: pi-package + OpenCode plugin | **multi-agent-os** |
| **P3** | Rename GitHub → `eko-plugin-marketplace` | consumers BC |
| **Defer** | Deep Copilot/Kiro/Warp/Gemini automation | low ROI until P2b |
| **Never** | Grok/Muse/ChatGPT-store as eko marketplaces; agentic-tools in eko |

## Domain firewall
```text
eko-plugin-marketplace  = INDEX
multi-agent-os          = PRODUCT (maos)
vek-claude-plugins      = CORP INDEX (sibling type)
```
