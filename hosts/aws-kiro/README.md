# AWS Kiro (+ Crew)

| Field | Value |
|---|---|
| **Kiro eko status** | `docs` |
| **Kiro Crew eko status** | `docs` (feature surface, not separate mall) |
| **Domain** | distribution pointer only |
| **Upstream** | https://github.com/ekson73/multi-agent-os |
| **Research** | [HOST-RESEARCH-2026-08.md](../../docs/research/HOST-RESEARCH-2026-08.md) |

## Kiro packaging surfaces (honest)
| Surface | eko role |
|---|---|
| **Agent Skills** | Document `npx skills add … -a kiro-cli` (→ `~/.kiro/skills`, auto `/slash`) |
| **MCP** | Link only; servers live upstream if any |
| **ACP / AGENTS.md** | Repo-native; MAOS ships AGENTS.md upstream |
| **Open VSX extensions** | **Not** published by eko |
| **Crew** | In-product multi-agent orchestration — configure inside Kiro after skills land |

## Install

Kiro has **two independent skill loaders**, so a complete install is two steps.
Step 1 alone leaves Kiro Crew with none of the skills.

```bash
# 1 — kiro-cli AND the Kiro IDE default agent (both read ~/.kiro/skills).
#     Skills landing here are automatically available as /slash commands.
npx skills add ekson73/multi-agent-os -g -a kiro-cli

# 2 — Kiro Crew reads ~/.kiro/crew/skills + skills.extra_paths and is NOT
#     covered by the skills CLI. Point it at what step 1 just installed.
kirocrew config set skills.extra_paths '["~/.kiro/skills"]'
```

Verify: `kirocrew config get skills.extra_paths`, then ask Kiro to search its
skills — `extra_paths` is watched, so step 2 applies without a restart.

The agent id is **`kiro-cli`**. There is no `kiro`, `kiro-ide` or `kiro-crew`
id — the skills CLI rejects them with `Invalid agents: <id>` and writes nothing.

## Kiro Crew
Crew is **not** a third-party plugin marketplace. Catalog key `aws-kiro-crew` exists so amnesic agents do not invent a separate eko “crew registry”.

It is, however, a **separate skill loader** — earlier revisions of this file said
“same skills install as Kiro”, which was wrong. Crew reads
`~/.kiro/crew/skills` plus the `skills.extra_paths` config key; the skills CLI
writes only to `~/.kiro/skills` and has no `kiro-crew` agent id. Step 2 of the
install above is what makes the corpus reachable from Crew. Wire the crews
themselves in the Kiro product UI/CLI.

## Verdict
| Build Open VSX maos? | **No** (unless operator product GO) |
| Separate eko crew mall? | **No** |
