# Multi-harness compatibility — eko-plugin-marketplace

| Field | Value |
|---|---|
| **Role of this repo** | **Distribution index** (discovery + install pointers) |
| **Product / agentic-tools** | Always **upstream** — default `ekson73/multi-agent-os` (`maos`) |
| **SSOT statuses** | [`../registry/catalog.json`](../registry/catalog.json) |
| **Host detail** | [`../hosts/`](../hosts/) |
| **Rename** | [`P3-RENAME-HOLD.md`](./P3-RENAME-HOLD.md) — BC GitHub name `eko-claude-plugins` |
| **Research (2026-08)** | [`research/HOST-RESEARCH-2026-08.md`](./research/HOST-RESEARCH-2026-08.md) — council expand/defer/never |
| **Spine** | [Agent Skills](https://agentskills.io) + `npx skills` → MAOS |

## Mental model

```text
┌─────────────────────────────────────────────────────────┐
│  eko-plugin-marketplace (this repo)                     │
│  catalog + hosts/*  = WHERE / HOW to install            │
└───────────────────────────┬─────────────────────────────┘
                            │ pointers only
                            ▼
┌─────────────────────────────────────────────────────────┐
│  multi-agent-os (maos)                                  │
│  skills · agents · commands · packaging/*  = WHAT       │
└─────────────────────────────────────────────────────────┘
```

**Portable bridge across many AI coding harnesses:** [Agent Skills](https://agentskills.io) via `npx skills` (skills.sh). MAOS **≥1.22.1** recommended (skill frontmatter gate for skills.sh).  
**Native deep integrations** (Claude marketplace, Pi package, OpenCode plugin) when the host has a first-class pack system.

## Install matrix (honest)

| Harness | catalog status | Primary install (copy/paste) | Secondary / notes |
|---|---|---|---|
| **Claude Code** | `ready` | `/plugin marketplace add ekson73/eko-claude-plugins` then `/plugin install maos@eko-claude-plugins` | Optional: `npx skills add ekson73/multi-agent-os -g -a claude-code` |
| **Pi** | `ready` | `pi install git:github.com/ekson73/multi-agent-os@main` | Skills CLI optional |
| **OpenCode** | `ready` | Thin plugin file → see [hosts/opencode](../hosts/opencode/); **and/or** `npx skills add ekson73/multi-agent-os -g -a opencode` | Plugin ≠ full skill corpus |
| **Codex** | `docs` | `npx skills add ekson73/multi-agent-os -g -a codex` | No Claude-style marketplace in eko |
| **Gemini CLI** | `docs` | `npx skills add ekson73/multi-agent-os -g -a gemini-cli` | Also **Extensions** (Google-owned); eko docs only. See Antigravity transition |
| **Antigravity** | `docs` | `npx skills add ekson73/multi-agent-os -g -a '*'` | Sibling/successor CLI to Gemini (2026 transition messaging); not a separate eko mall |
| **GitHub Copilot** | `docs` | `npx skills add ekson73/multi-agent-os -g -a github-copilot` | Native Copilot plugins/MCP exist; skills = discovery bridge |
| **AWS Kiro** | `docs` | `npx skills add ekson73/multi-agent-os -g -a kiro` | Skills+MCP+ACP+Open VSX — eko ≠ Open VSX publisher |
| **Kiro Crew** | `docs` | same as Kiro skills line | In-product multi-agent; **not** a 3p marketplace |
| **Warp** | `docs` | `npx skills add ekson73/multi-agent-os -g -a '*'` | Thin 3p pack mall |
| **ChatGPT store** | `n/a` | — | OpenAI-controlled |
| **VS Code Marketplace** | `n/a` | — | Editor extensions ≠ agent pack index |
| **Grok / Muse** | `n/a` | — | Not pack hosts for eko |

### Universal one-liner (when unsure of agent id)

```bash
npx skills add ekson73/multi-agent-os -g -a '*' -y
```

Installs skills into **all agents the skills CLI detects** on the machine. Prefer explicit `-a <id>` when known.

### Agent id caveat

skills CLI agent identifiers **evolve**. If `-a gemini-cli` / `github-copilot` / `kiro` fails:

```bash
npx skills add ekson73/multi-agent-os -l          # list skills in repo
npx skills add ekson73/multi-agent-os -g -a '*' -y  # all detected agents
```

eko documents **intent**; the CLI is the runtime authority for supported `-a` values.

## Dual-path hosts (native + skills)

| Host | Native path | Skills path |
|---|---|---|
| Claude | eko marketplace plugin | skills CLI |
| Pi | `package.json` `pi.skills` | skills CLI |
| OpenCode | `packaging/opencode-maos` thin plugin | skills CLI (full corpus) |

Native path = deepest host integration. Skills path = **cross-harness portability**.

## What eko will not do

- Host `skills/`, `agents/`, `commands/`, `hooks/`, `mcp-tools/` trees
- Publish VS Code VSIX / Open VSX / ChatGPT store entries as “the eko marketplace”
- Mark `ready` without a working install line
- Pretend Grok is a pack host

## Operator / agent quick path

1. Read this matrix → pick harness row  
2. Run **Primary install**  
3. If product bugs: file on **multi-agent-os**, not eko  
4. If discovery/docs wrong: PR on **eko-claude-plugins**  
5. GitHub rename: only per [P3 cutover plan](./plans/P3-rename-cutover-plan.md) after GO  

## Related

- Domain boundary: [`domain-boundary-eko-vs-maos.md`](./domain-boundary-eko-vs-maos.md)  
- Host research: [`HOST-MATRIX-2026-08.md`](./HOST-MATRIX-2026-08.md)  
- Catalog: [`../registry/catalog.json`](../registry/catalog.json)
