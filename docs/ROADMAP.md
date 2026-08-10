# Roadmap — eko-plugin-marketplace (distribution hub)

## Done
- [x] Domain split eko ⊥ MAOS
- [x] ADR-001 float · ADR-002 GitHub Flow · ADR-003 multi-host hub · ADR-004 rename target
- [x] `registry/catalog.json` + schema + CI path-deny
- [x] Naming **DECIDED**: `eko-plugin-marketplace` (operator A)
- [x] hosts/claude install docs

## Next (VKS-2620)
| Phase | Tasks | Status |
|---|---|---|
| **P2** | `hosts/{pi,opencode,openai,google,microsoft,aws-kiro,warp}/README.md` stubs aligned to catalog statuses | ⬜ |
| **P2** | Issues on `multi-agent-os`: pi-package + OpenCode plugin scaffolds; link keys in catalog | ⬜ |
| **P3** | GitHub rename `eko-claude-plugins` → `eko-plugin-marketplace` + consumer BC (MAOS README, vek marketplace refs, plugins-provenance) | ⬜ |
| **P3** | Update Claude install paths post-rename; keep alias notes 1 cycle | ⬜ |

## Never
- Agentic-tools inside this repo
- Merge with multi-agent-os
- Fake ready for Pi/OpenCode without upstream
