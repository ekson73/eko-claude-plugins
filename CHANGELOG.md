# Changelog

All notable changes to this marketplace will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
| 1.3.0 | 2026-04-10 | Sync maos plugin to v1.5.0, harmonize with multi-agent-os |
| 1.2.1 | 2026-04-10 | Rename ekson-claude-plugins → eko-claude-plugins |
| 1.0.1 | 2026-01-08 | CLAUDE.md, README badges, schema fixes |
| 1.0.0 | 2026-01-07 | Initial release with multi-agent-os |

---

*Maintained by [Emilson Moraes](https://github.com/ekson73)*
