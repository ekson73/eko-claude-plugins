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
| **Agent Skills** | Document `npx skills add … -a kiro` |
| **MCP** | Link only; servers live upstream if any |
| **ACP / AGENTS.md** | Repo-native; MAOS ships AGENTS.md upstream |
| **Open VSX extensions** | **Not** published by eko |
| **Crew** | In-product multi-agent orchestration — configure inside Kiro after skills land |

## Install
```bash
npx skills add ekson73/multi-agent-os -g -a kiro
# fallback
npx skills add ekson73/multi-agent-os -g -a '*' -y
```

## Kiro Crew
Crew is **not** a third-party plugin marketplace. Catalog key `aws-kiro-crew` exists so amnesic agents do not invent a separate eko “crew registry”. Same skills install as Kiro; wire crews in the Kiro product UI/CLI.

## Verdict
| Build Open VSX maos? | **No** (unless operator product GO) |
| Separate eko crew mall? | **No** |
