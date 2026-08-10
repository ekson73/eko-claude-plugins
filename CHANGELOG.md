# Changelog

## [1.8.1] — 2026-08-10

### Changed
- Research dogfood PDCA: `npx skills -l` found 2 MAOS SKILL.md skipped → fixed upstream MAOS 1.22.1
- catalog **0.4.1** compat.dogfood + maos_version_floor
- ADR-003 addendum: Pi/OpenCode **ready** (no longer pending-upstream)
- MULTI-HARNESS: recommend MAOS ≥1.22.1


## [1.8.0] — 2026-08-10

### Added
- `docs/research/HOST-RESEARCH-2026-08.md` — version probes + last30days + **council** expand/defer/never (eko ⊥ MAOS)
- catalog provider `aws-kiro-crew` (docs feature-surface under Kiro)
- catalog `compat.research` + per-provider `research_as_of`

### Changed
- catalog **0.4.0** — Gemini/Antigravity transition notes; Copilot/Kiro honesty; hosts google/microsoft/kiro refreshed
- MULTI-HARNESS + HOST-MATRIX cross-links to research council


## [1.7.0] — 2026-08-10

### Added
- `docs/MULTI-HARNESS-COMPAT.md` — multi-AI-provider harness install matrix (native + skills.sh bridge)
- catalog `compat` block + install lines for docs-tier providers (codex, gemini, copilot, kiro, warp, antigravity)
- CI/script: require install on `ready` + `docs` skills-cli pointers; require MULTI-HARNESS-COMPAT.md

### Changed
- hosts/* concrete discovery recipes; hosts/README pi/opencode → ready (drift fix)
- catalog version **0.3.0**


## [1.6.10] — 2026-08-10

### Fixed
- `.gitignore`: stop ignoring `scripts/*.sh` (was `*.sh` global — blocked #21/#22)


## [1.6.9] — 2026-08-10

### Fixed
- Ship `scripts/p3-rename-inventory.sh` + `scripts/validate-catalog.sh` (missed in #21 tree)


## [1.6.8] — 2026-08-10

### Added
- `docs/plans/P3-rename-cutover-plan.md` — two-phase cutover (GitHub vs marketplace id); session policy; checklists
- `scripts/p3-rename-inventory.sh` — read-only blast radius
- `scripts/validate-catalog.sh` — local dogfood of CI rules

### Changed
- ROADMAP: P3-PLAN drafted; execution = P3-GO HITL
- P3-RENAME-HOLD + ADR-004 link to plan; CI requires plan file while HOLD active


## [1.6.7] — 2026-08-10

### Added
- `docs/P3-RENAME-HOLD.md` — **RENAME_HOLD=active**; deep-research DoR before GitHub rename
- CI enforces HOLD file + catalog↔hosts alignment

### Changed
- NAMING/ROADMAP/README: P3 frozen pending plan+GO (sessions + multi-harness consumers)


## [1.6.5] — 2026-08-10

### Changed
- catalog: **pi** + **opencode** → `ready` (multi-agent-os packaging PR #315; issues #313/#314)
- hosts/pi + hosts/opencode install docs updated
- ROADMAP P2b complete


## [1.6.4] — 2026-08-10

### Added
- `hosts/README.md` index table

### Changed
- ROADMAP: mark multi-host stubs done; clarify P2b/P3 remaining
- .gitignore: refuse accidental `/plugins/` vendoring


## [1.6.3] — 2026-08-10

### Added
- `docs/HOST-MATRIX-2026-08.md` — research-backed host matrix (Aug 2026)
- `hosts/{pi,opencode,openai,google,microsoft,aws-kiro,warp,_out-of-scope}/` install/discovery stubs
- Roadmap refined priorities (Claude maintain · Pi/OpenCode after MAOS · docs-only tier · never tier)

### Changed
- README multi-host status table expanded with links to host docs


## [1.6.2] — 2026-08-10

### Changed
- **DECIDED:** operator accepted Anima default **A** → target name **`eko-plugin-marketplace`** (closed).
- `docs/NAMING.md` lock · `docs/ROADMAP.md` P2/P3 · domain-boundary title fix · catalog.schema title · ADR-004 stamp.


## [1.6.1] — 2026-08-10

### Changed
- **Naming:** target rename **`eko-plugin-marketplace`** (Anima council). Interim `eko-pack-index` **rejected** (gloss-independence / opaque-correctness).
- ADR-004 revised; `registry/catalog.json` catalog id + naming metadata; README identity line.


All notable changes to this marketplace will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **`maos` ships `maos-concierge`** (upstream `ekson73/multi-agent-os` v1.6.0, PR #97, merged) — onboarding/guide/router/governance-anchor skill over the whole MAOS framework (6 modes). Delivered automatically via the `ref:main` float (ADR-001); README plugin table refreshed to upstream v1.6.0. No `marketplace.json` change required (float + upstream `plugin.json` version SSOT).

- **docs(branching)**: documented GitHub Flow (Class B) in new `AGENTS.md` (SSOT) + `ADR-002`; added GEMINI.md / Copilot pointers; README badge. Companion to ADR-001 (source float).

### Fixed
- **docs(readme)**: harmonize install/config/usage to the cross-repo SSOT structure (mirrors `vek-im/vek-claude-plugins#9` + `ekson73/multi-agent-os#108`). Two real fixes for humans **and** agents: (1) invalid `claude plugin install multi-agent-os` → in-session `/plugin install maos@eko-claude-plugins` (correct **plugin name** `maos` ≠ repo `multi-agent-os`); (2) removed the **SHA-pin self-contradiction** — the Installation block claimed "pinned SHA / `source.sha`" while the plugin table + ADR-001 say float (`ref: main`). Added plugin-name-vs-repo + `/maos:<name>` namespace note, Use/Update/Troubleshooting sections, and marked component counts **representative** (+ `/maos:maos-concierge` discovery pointer) to resist re-drift. Also harmonized **`CLAUDE.md`** (agent-facing doc, per Qodo review): `claude plugin …` shell installs → in-session `/plugin`; removed pinned-SHA + per-plugin-`version` guidance → float (ADR-001) consistency (it was contradicting README/AGENTS.md/ADR-001). MIT/community/cross-vendor (AAIF) preserved. Docs-only, zero behavior change.

## [1.5.1] - 2026-07-01

### Fixed
- **fix(windows/transport): `maos` source `github` → `url` (explicit HTTPS).** Windows devs (VS Code + claude-code extension) failed to install with `No ED25519 host key is known for github.com … Host key verification failed`. Root cause: Claude Code clones the `github` source type over **SSH** (`git@github.com:`); fresh Windows has an empty `~/.ssh/known_hosts` and Claude Code suppresses the host-key prompt → the clone hard-fails before auth (macOS unaffected — key cached). Fix: `maos` source converted to `{"source":"url","url":"https://github.com/ekson73/multi-agent-os.git","ref":"main"}`, forcing HTTPS transport. ADR-001 float preserved (`url` supports `ref:main`). `CLAUDE.md` source-policy updated to prefer `url`+`https://` and mark `github` shorthand ⚠️ AVOID. Empirical: 44/44 `github`-source clones in a real cache used `git@github.com:`; all `url`-source clones used `https://`. Sibling: `vek-im/vek-claude-plugins` v1.5.1 (same fix).

## [1.4.0] - 2026-05-12

### Changed
- **BREAKING (internal architecture)**: migrated `maos` plugin from git submodule + relative path source to official Anthropic [`github` source type](https://code.claude.com/docs/en/plugin-marketplaces#plugin-sources) with explicit SHA pin.
  - Eliminates 273 vendored/submodule files from working tree.
  - Eliminates the need to recurse submodules on clone.
  - Aligns with the same pattern adopted by sibling marketplace `vek-im/vek-claude-plugins` v1.3.0+.
- `maos` SHA pin: `be1737b9521653d6b09f7ff84c907e2a07f8f1eb` (upstream HEAD 2026-05-11; captures converge v1.1.1 with Invariant 6 audit-not-persuasion + provider-matrix vek-servicos→vek-im rename).

### Removed
- `.gitmodules` (no submodules anymore).
- `plugins/multi-agent-os` submodule entry (content now fetched fresh by Claude Code from upstream at pinned SHA).
- `plugins/` directory (was sole holder of the submodule).

### Refs
- Anthropic plugin-marketplaces docs: https://code.claude.com/docs/en/plugin-marketplaces#plugin-sources
- Sibling migration: https://github.com/vek-im/vek-claude-plugins/pull/1 (v1.3.0) + https://github.com/vek-im/vek-claude-plugins/pull/2 (v1.3.1)
- Plugin Provenance Standard [C12] (user-scope `~/.claude/CLAUDE.md`)
- External-Repo Integration Pattern [C14] — submodules retired for live-watched plugin dirs

## [1.3.0] - 2026-04-10

### Changed
- Sync maos plugin version: 1.4.0 → 1.5.0 (matches multi-agent-os v1.5.0)
- README title: "Ekson Claude Plugins" → "Eko Claude Plugins"
- CLAUDE.md: Registered Plugins table updated to v1.5.0
- Submodule `plugins/multi-agent-os` initialized and updated to latest commit

### Added
- Marketplace Versions table in CHANGELOG with full history

## [1.2.1] - 2026-04-10

### Changed
- Repository renamed from `ekson-claude-plugins` to `eko-claude-plugins` (GitHub repo rename)
- Updated all internal references: `marketplace.json`, `README.md`, `CLAUDE.md`, `CHANGELOG.md`
- New install command: `claude plugin marketplace add ekson73/eko-claude-plugins`

## [1.0.1] - 2026-01-08

### Added
- `CLAUDE.md` - AI agent guidance documentation
- README badges (License, Claude Code, Plugin count)

### Fixed
- `marketplace.json`: Fixed duplicate `source.source` field to `source.type`

### Improved
- `README.md`: Added Quick Start section, structured component tables, contribution guidelines
- `marketplace.json`: Added `$schema`, `version`, `owner.url`, `metadata.homepage`, `metadata.lastUpdated`, `minClaudeCodeVersion`, `releaseDate` fields

## [1.0.0] - 2026-01-07

### Added
- Initial marketplace release
- Plugin: `multi-agent-os` v1.0.0
  - Sentinel Protocol (anomaly detection, loop prevention)
  - Status Map System (human-centric observability)
  - Anti-Conflict Protocol (git worktree coordination)
  - Hierarchical Merge Protocol (branch convergence)
  - TTL Policy (content freshness management)
  - 8 Skills, 5 Commands, 4 Agents, 4 Hooks
- `.gitignore` to prevent accidental commits of temporary files
- MIT License

### Infrastructure
- Marketplace structure following Claude Code plugin standards
- GitHub repository: `ekson73/eko-claude-plugins`
- Plugin source: `ekson73/multi-agent-os`

---

## Plugin Versions

| Plugin | Current Version | Last Updated |
|--------|-----------------|--------------|
| multi-agent-os | 1.5.0 | 2026-04-10 |

## Marketplace Versions

| Version | Date | Changes |
|---------|------|---------|
| 1.4.0 | 2026-05-12 | Migrate maos from submodule to `github` source type (official Anthropic pattern), SHA pin |
| 1.3.0 | 2026-04-10 | Sync maos plugin to v1.5.0, harmonize with multi-agent-os |
| 1.2.1 | 2026-04-10 | Rename ekson-claude-plugins → eko-claude-plugins |
| 1.0.1 | 2026-01-08 | CLAUDE.md, README badges, schema fixes |
| 1.0.0 | 2026-01-07 | Initial release with multi-agent-os |

---

*Maintained by [Emilson Moraes](https://github.com/ekson73)*
