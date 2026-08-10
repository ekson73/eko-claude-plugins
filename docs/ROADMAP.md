# Roadmap — eko-plugin-marketplace (distribution hub)

## Done
- [x] Domain split eko ⊥ MAOS
- [x] ADR-001–004 + naming **DECIDED** `eko-plugin-marketplace`
- [x] `registry/catalog.json` + schema + CI path-deny
- [x] hosts/claude
- [x] Host matrix research ≈2026-08 (`docs/HOST-MATRIX-2026-08.md`)
- [x] hosts stubs: pi, opencode, openai, google, microsoft, aws-kiro, warp, _out-of-scope

## In progress / next (VKS-2620)
| Phase | Tasks | Owner repo | Status |
|---|---|---|---|
| **P2b** | Open MAOS issues: pi-package manifest; OpenCode plugin package; link issue URLs in catalog notes | multi-agent-os + eko catalog note | ⬜ |
| **P2c** | Optional: generate `hosts/index` table from catalog.json in CI | eko | ⬜ |
| **P3** | GitHub rename → `eko-plugin-marketplace` + BC (MAOS README, vek-claude-plugins refs, plugins-provenance, install snippets) | eko + consumers | ⬜ |
| **P3b** | Post-rename: dual-name note 1 cycle; then drop BC paths | eko | ⬜ |

## Priority effort (refined Aug 2026)
1. **Claude** — maintain (only full `ready` pack mall eko owns)
2. **Pi + OpenCode** — highest leverage *after* MAOS scaffolds (real package/plugin systems)
3. **Codex** — docs via skills.sh pointer (no fake plugin marketplace)
4. **Copilot / Kiro / Warp / Gemini / Antigravity** — docs-only until ROI clear
5. **Never invest as marketplace:** Grok, Muse, ChatGPT store, VS Code VSIX-as-eko-product

## Never
- Agentic-tools inside this repo
- Merge with multi-agent-os
- `ready` without working install
- Reopen naming (DECIDED A) without explicit operator override
