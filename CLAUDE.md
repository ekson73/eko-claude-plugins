# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

> **🔗 HERANÇA DE CONTEXTO GLOBAL**
> Antes de iniciar qualquer tarefa, leia e incorpore:
> - `~/.claude/CLAUDE.md` → Diretrizes C01/C02/C03 (Core Directive, Main Instructions, Iterative Loop)
> - `~/Projects/CLAUDE.md` → Contexto do workspace multi-projeto

## Repository Overview

**eko-claude-plugins** is a personal Claude Code plugin marketplace owned by [Emilson Moraes](https://github.com/ekson73).

**Purpose**: Centralized distribution of Claude Code plugins developed for AI agent workflows and multi-agent coordination.

**Type**: Plugin Marketplace (not a plugin itself)

---

## Architecture

```
eko-claude-plugins/                    # Marketplace root
├── .claude-plugin/
│   └── marketplace.json                 # Plugin registry (source of truth)
├── .gitignore                           # Git exclusions
├── CHANGELOG.md                         # Version history
├── CLAUDE.md                            # This file (AI guidance)
├── LICENSE                              # MIT License
└── README.md                            # Public documentation
```

### Key Distinction

| Concept | This Repo | Plugin Repo |
|---------|-----------|-------------|
| Purpose | **Marketplace** (index of plugins) | **Plugin** (actual functionality) |
| Key File | `marketplace.json` | `plugin.json` |
| Contains | Plugin references | Commands, agents, skills, hooks |
| Installation | `claude plugin marketplace add` | `claude plugin install` |

---

## Files Reference

| File | Purpose | Update Frequency |
|------|---------|------------------|
| `marketplace.json` | Plugin registry with versions | On plugin release |
| `CHANGELOG.md` | Version history | On every release |
| `README.md` | User-facing documentation | On feature changes |

---

## Registered Plugins

| Plugin | Source | Version | Status |
|--------|--------|---------|--------|
| [multi-agent-os](https://github.com/ekson73/multi-agent-os) | `ekson73/multi-agent-os` | 1.5.0 | Active |

---

## Workflows

### Adding a New Plugin

1. Ensure plugin repo has `.claude-plugin/plugin.json`
2. Add entry to `marketplace.json`:
   ```json
   {
     "name": "plugin-name",
     "description": "Short description",
     "version": "x.y.z",
     "author": { "name": "...", "email": "..." },
     "source": { "source": "github", "repo": "owner/repo" },
     "category": "category-slug",
     "repository": "https://github.com/owner/repo",
     "license": "MIT",
     "keywords": ["keyword1", "keyword2"]
   }
   ```
3. Update `README.md` plugin table
4. Add entry to `CHANGELOG.md`
5. Commit with message: `feat(marketplace): add {plugin-name} v{version}`

### Updating a Plugin Version

1. Update `version` in `marketplace.json`
2. Update version in `README.md` table
3. Add entry to `CHANGELOG.md`
4. Commit: `feat({plugin-name}): bump to v{version}`

### Removing a Plugin

1. Remove entry from `marketplace.json`
2. Update `README.md` table
3. Add `### Removed` section in `CHANGELOG.md`
4. Commit: `feat(marketplace): remove {plugin-name}`

---

## Quality Standards

### Plugin Requirements (for inclusion)

- [ ] Has `.claude-plugin/plugin.json` with valid schema
- [ ] Has `README.md` with installation instructions
- [ ] Has `LICENSE` file (MIT preferred)
- [ ] Public GitHub repository
- [ ] Semantic versioning (MAJOR.MINOR.PATCH)

### Marketplace Requirements

- [ ] All plugins in `marketplace.json` are accessible
- [ ] Versions match source repository tags
- [ ] Keywords are relevant and searchable
- [ ] Categories are consistent across plugins

---

## Conventions

### Versioning

- **Marketplace version**: Tracks structural changes to marketplace itself
- **Plugin versions**: Tracked independently per plugin in `marketplace.json`
- Follow [Semantic Versioning 2.0.0](https://semver.org/)

### Commit Messages

```
feat(marketplace): add {plugin-name} v{version}
feat({plugin-name}): bump to v{version}
fix(marketplace): correct {issue}
docs: update README with {change}
chore: {maintenance task}
```

### Branch Strategy

- `main`: Stable, published marketplace state
- `feat/*`: New plugins or features
- `fix/*`: Bug fixes
- `docs/*`: Documentation updates

---

## FAQs

### Q: How is this different from claude-plugins-official?

**A**: `claude-plugins-official` is Anthropic's curated directory. This is a personal marketplace for custom plugins, primarily focused on AI agent orchestration tools developed by Emilson Moraes / Vek.

### Q: Can others contribute plugins?

**A**: Currently personal use. For contributions, open an issue first to discuss inclusion criteria.

### Q: Why a separate marketplace instead of contributing to official?

**A**: Faster iteration on experimental features. Plugins may be proposed to official directory once stable.

### Q: How do I verify version consistency before commit?

**A**: Run these checks:
```bash
# 1. Validate JSON syntax
python3 -m json.tool .claude-plugin/marketplace.json > /dev/null

# 2. Compare versions
grep '"version"' .claude-plugin/marketplace.json
grep -E '^\[.+\]' CHANGELOG.md | head -2

# 3. Check plugin URLs (replace with actual URL)
curl -s -o /dev/null -w "%{http_code}" https://github.com/ekson73/multi-agent-os
```

### Q: What triggers a marketplace version bump?

**A**: Any change to marketplace structure (not plugin versions):
- **PATCH** (x.y.Z): Documentation fixes, typos, metadata updates
- **MINOR** (x.Y.z): New plugin added, new fields in schema
- **MAJOR** (X.y.z): Breaking schema changes, plugin removal

---

## NOT-TODOs (Scope Exclusions)

- Do NOT store plugin source code here (only references)
- Do NOT duplicate plugin documentation (link to source)
- Do NOT include pre-release/unstable plugins without marking them

---

## Related Repositories

| Repository | Purpose |
|------------|---------|
| [multi-agent-os](https://github.com/ekson73/multi-agent-os) | Multi-Agent Coordination Framework plugin |
| [claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | Anthropic's official plugin directory |

---

## Maintenance

### Health Checks (Monthly)

1. Verify all plugin URLs are accessible
2. Check if plugin versions are current
3. Review plugin.json schemas for breaking changes
4. Update keywords/categories if taxonomy changes

### Known Limitations

- No automated version sync with source repos
- Manual update required when plugins release new versions
- No automated validation of plugin.json schemas

---

*Last updated: 2026-01-08 (QA validated)*
*Maintained by: Emilson Moraes*

---

## Organizational Identity (MVV)

### Mission (A Práxis)

> **Prover um marketplace pessoal de plugins Claude Code para desenvolvedores e AI agents através de um registro centralizado e curado, resolvendo a fragmentação na distribuição de ferramentas de orquestração multi-agente.**

### Vision (A Teleologia)

> **Ser a referência pessoal em plugins de orquestração de agentes AI para Claude Code, com plugins maduros sendo promovidos para o marketplace oficial da Anthropic, influenciando o padrão da indústria em colaboração humano-AI.**

### Values (A Ética)

| Value | Description |
|-------|-------------|
| **Functional Minimalism** | Essence over ornament — only essential files, no redundancy |
| **Rigorous Traceability** | SemVer, CHANGELOG, Conventional Commits — every change is auditable |
| **Separation of Concerns** | Marketplace contains references, not code — plugins live in their own repos |
| **Experimental Iteration** | Fast iteration on experimental plugins before promoting to official |
| **Transparency of Limitations** | Explicitly declare known limitations and NOT-TODOs |

---

*MVV extracted via ontological analysis by Claude-Analyst-eed7-002 | 2026-01-08*

---

## QA Validation Report

### Validation Summary (2026-01-08)

| Item | Status | Notes |
|------|--------|-------|
| README.md exists | PASS | Complete with badges, usage, examples |
| CLAUDE.md exists | PASS | Comprehensive AI agent guidance |
| CHANGELOG.md format | PASS | Keep a Changelog compliant |
| LICENSE exists | PASS | MIT License |
| .gitignore coverage | PASS | Covers common cases |
| marketplace.json valid | PASS | JSON schema valid |
| Plugin references exist | PASS | multi-agent-os accessible (HTTP 200) |
| URLs functional | PASS | All URLs return 200 |
| Git clean | PASS | No uncommitted changes |
| Conventional commits | PASS | History follows convention |
| No sensitive files | PASS | No .env, credentials found |
| Worktrees clean | PASS | No stale worktrees |
| Version consistency | FIXED | marketplace.json 1.0.0 -> 1.0.1 |

**Final Score**: 92/100 (1 fix applied)

### Fixes Applied

1. **Version mismatch**: `marketplace.json` version updated from 1.0.0 to 1.0.1 to match CHANGELOG.md

### Insights from Validation

1. **Version sync is manual**: When CHANGELOG is updated with a new marketplace version, `marketplace.json` must be updated in the same commit. Consider adding this to the workflow checklist.

2. **Worktree infrastructure present**: The `.worktrees/` directory with README.md, tasks.md, and sessions.json shows proper multi-agent coordination setup.

3. **Architecture well-documented**: Clear separation between marketplace (registry) and plugins (functionality) is explicitly documented.

---

## MUST / MUST-NOT Rules

### MUST

| Rule | Rationale |
|------|-----------|
| Update `marketplace.json` version when releasing | Prevents version drift between CHANGELOG and registry |
| Run `python3 -m json.tool` on marketplace.json before commit | Validates JSON syntax |
| Check HTTP status of plugin URLs before merge | Ensures plugin repos are accessible |
| Use worktree for multi-file changes | Prevents conflicts in multi-agent scenarios |
| Add CHANGELOG entry for every release | Maintains audit trail |

### MUST-NOT

| Rule | Rationale |
|------|-----------|
| NEVER commit plugin source code | Marketplace contains references only |
| NEVER add plugins without valid plugin.json | Ensures plugin is properly structured |
| NEVER skip version bump in marketplace.json | Causes version inconsistency |
| NEVER work directly on main for structural changes | Use feature branches |
| NEVER add private repos to marketplace | All plugins must be publicly accessible |

---

## Pending Questions (for Human Decision)

1. **Automated version sync**: Should we implement a GitHub Action to sync plugin versions from source repos?

2. **Pre-release plugins**: What marking convention for experimental/alpha plugins? (e.g., `status: "beta"` in marketplace.json)

3. **Plugin deprecation**: What is the process for deprecating a plugin? (e.g., `deprecated: true` field, removal timeline)

---

*QA Validation by Claude-QA-c614-mkt-final | 2026-01-08T14:45:00-03:00*

---

## Deep QA Analysis Report (2026-01-08)

### Analysis Scope

This deep analysis was performed by `Claude-QA-c614-mkt-deep` to comprehensively validate the marketplace repository structure, schema integrity, documentation quality, and operational readiness.

### Validation Matrix

| Category | Check | Status | Notes |
|----------|-------|--------|-------|
| **Structure** | Directory layout | PASS | Follows marketplace conventions |
| **Structure** | File completeness | PASS | All required files present |
| **Schema** | marketplace.json syntax | PASS | Valid JSON |
| **Schema** | marketplace.json fields | PASS | All required fields present |
| **Schema** | Plugin schema match | PASS | Matches source plugin.json |
| **Links** | Multi-agent-os repo | PASS | HTTP 200 |
| **Links** | Marketplace repo | PASS | HTTP 200 |
| **Links** | Plugin.json at source | PASS | Fetched successfully |
| **Versions** | marketplace.json version | PASS | 1.0.1 |
| **Versions** | CHANGELOG sync | PASS | 1.0.1 in both |
| **Versions** | Plugin version sync | PASS | 1.0.0 matches source |
| **Security** | Sensitive files | PASS | None found |
| **License** | MIT License | PASS | Valid 2026 |
| **Git** | Conventional commits | PASS | History follows convention |
| **Worktrees** | Infrastructure | PASS | README, tasks.md, sessions.json |

### Issues Found and Fixed

| Issue | Severity | Fix Applied |
|-------|----------|-------------|
| sessions.json had stale "active" session (eed7) | LOW | Updated to "completed" with end timestamp |
| tasks.md "Active Tasks" was empty placeholder | LOW | Added current task registration |

### Insights and Learnings

1. **Session Lifecycle Management**: Sessions should be explicitly closed (status: "completed" + ended timestamp) when work concludes. The previous session (eed7) was left in "active" state.

2. **Worktree Enforcement**: The repository correctly requires worktrees for modifications. This analysis was performed in `.worktrees/qa-deep-mkt/` on branch `qa/deep-analysis-mkt`.

3. **Version Sync Chain**: Three levels must stay synchronized:
   - `marketplace.json` version (marketplace itself)
   - `CHANGELOG.md` version entries
   - `marketplace.json` plugin versions → source repo plugin.json versions

4. **Plugin Validation Pattern**: Before adding a plugin, always:
   ```bash
   curl -s https://raw.githubusercontent.com/{owner}/{repo}/main/.claude-plugin/plugin.json | python3 -m json.tool
   ```

### Automation Opportunities Identified

| Opportunity | Effort | Impact | Recommendation |
|-------------|--------|--------|----------------|
| GitHub Action for plugin URL checks | LOW | MEDIUM | Implement on PR |
| Schema validation with ajv/jsonschema | MEDIUM | HIGH | Add CI step |
| Version sync checker script | MEDIUM | HIGH | Pre-commit hook |
| Session auto-close on worktree removal | HIGH | MEDIUM | Future enhancement |

### Gaps Still Present (Documented in Known Limitations)

| Gap | Current State | Mitigation |
|-----|---------------|------------|
| No automated version sync | Manual updates required | Document in workflow |
| No schema validation | JSON syntax only | Manual field review |
| No pre-release marking | Not implemented | Add `status` field when needed |

### MUST-NOT Rules (Additional)

| Rule | Learned From |
|------|--------------|
| NEVER leave sessions in "active" state after work completes | Stale session found in this analysis |
| NEVER create worktree without registering in tasks.md | Traceability requirement |
| NEVER merge without closing active session | Session lifecycle integrity |

### Recommendations for Future Work

1. **Short-term**: Add `lastUpdated` with full ISO 8601 timestamp (include time)
2. **Medium-term**: Implement GitHub Action for automated checks on PR
3. **Long-term**: Build plugin submission workflow with automated validation

### Deep Analysis Score

| Dimension | Score | Max | Notes |
|-----------|-------|-----|-------|
| Schema Integrity | 10 | 10 | All validations pass |
| Documentation | 9 | 10 | Minor: README could link to CLAUDE.md |
| Version Consistency | 10 | 10 | All versions synchronized |
| Security | 10 | 10 | No sensitive files |
| Operational Readiness | 8 | 10 | Session management needed cleanup |
| Automation | 6 | 10 | Manual processes, room for CI |
| **TOTAL** | **88** | **100** | **Above threshold (80)** |

---

*Deep QA Analysis by Claude-QA-c614-mkt-deep | 2026-01-08T16:10:00-03:00*
