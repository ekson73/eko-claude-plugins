# Pi

| Field | Value |
|---|---|
| **eko status** | `pending-upstream` |
| **Domain** | distribution pointer only — **no** agentic-tools in eko |
| **Upstream product example** | `maos` → https://github.com/ekson73/multi-agent-os |
| **Catalog** | `registry/catalog.json` → `providers.pi` (or mapped key) |

## Why in eko
Pi has a real **package** system (`pi install npm:|git:`) + [Package Catalog](https://pi.dev/packages). eko can only **point**.

## Planned install (when MAOS exposes pi-package)
```bash
pi install git:github.com/ekson73/multi-agent-os@main
```

## Blocker (not eko work)
`multi-agent-os` needs a valid **pi-package** manifest (`package.json` `pi` key / conventional dirs). Until then status stays `pending-upstream`.

## Evidence (≈2026-08)
`@earendil-works/pi-coding-agent` **0.84.1**; catalog is npm-backed packages (extensions/skills/prompts/themes).
