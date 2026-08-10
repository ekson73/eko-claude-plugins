# Roadmap — eko-plugin-marketplace (distribution hub)

## Done
- [x] Domain split eko ⊥ MAOS
- [x] ADR-001–004 + naming **DECIDED** `eko-plugin-marketplace` (operator HITL A)
- [x] `registry/catalog.json` + schema + CI path-deny
- [x] hosts/claude + multi-host stubs (pi, opencode, openai, google, microsoft, aws-kiro, warp, _out-of-scope)
- [x] Host matrix research ≈2026-08 (`docs/HOST-MATRIX-2026-08.md`)
- [x] NAMING.md + domain-boundary lock

## Next (VKS-2620)
| Phase | Tasks | Owner | Status |
|---|---|---|---|
| **P2b** | GitHub issues on `multi-agent-os`: (1) pi-package manifest (2) OpenCode plugin package; paste issue URLs into catalog notes | MAOS + eko catalog note | ⬜ |
| **P2c** | Optional: CI job render hosts table from catalog.json | eko | ⬜ |
| **P3** | GitHub rename `eko-claude-plugins` → `eko-plugin-marketplace` + consumer BC (MAOS README, vek-claude-plugins, plugins-provenance, install snippets) | eko + consumers | ⬜ |
| **P3b** | Post-rename dual-name note 1 cycle; then drop BC paths | eko | ⬜ |

## Effort priority (Aug 2026, honest)
1. **Claude** — keep marketplace green (only full `ready` mall eko owns)
2. **Pi + OpenCode** — after MAOS scaffolds (`pending-upstream` → `ready`)
3. **Codex** — docs via skills.sh pointer only
4. **Copilot / Kiro / Warp / Gemini / Antigravity** — docs-only
5. **Never as eko marketplace:** Grok, Muse, ChatGPT store, VS Code VSIX-as-eko-product

## Never
- Agentic-tools inside this repo
- Vendored `plugins/` copies of upstreams (use marketplace sources)
- Merge with multi-agent-os
- `ready` without working install
- Reopen naming without explicit operator B/C override
