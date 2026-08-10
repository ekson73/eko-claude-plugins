# P3 Rename Cutover Plan — deep research

| Field | Value |
|---|---|
| **Status** | **DRAFTED** (research complete; **execution blocked** on operator GO) |
| **HOLD** | [`../P3-RENAME-HOLD.md`](../P3-RENAME-HOLD.md) remains **`RENAME_HOLD=active`** until GO |
| **From** | GitHub `ekson73/eko-claude-plugins` + Claude marketplace id `eko-claude-plugins` |
| **To** | GitHub `ekson73/eko-plugin-marketplace` + marketplace id TBD (see §5) |
| **Ticket** | VKS-2620 |
| **Drafted** | 2026-08-10 |
| **Does NOT execute rename** | This file is the plan only |

---

## 1. Goal & non-goals

### Goal
Cut over the **distribution hub** identity so:
1. GitHub repo name = DECIDED system-name `eko-plugin-marketplace`
2. Consumer docs/install paths resolve without breakage
3. Claude marketplace install continues to work during dual-name window
4. No silent drift in operator harnesses or in-flight agent sessions

### Non-goals
- Moving agentic-tools into this repo
- Merging with multi-agent-os
- Bulk-rewriting Claude session **transcripts** (jsonl) for cosmetics
- Reopening the name decision (DECIDED HITL A)

---

## 2. Identity layers (critical distinction)

| Layer | Today | After P3 | Notes |
|---|---|---|---|
| **System-name / catalog id** | `eko-plugin-marketplace` | same | Already DECIDED in `registry/catalog.json` |
| **GitHub repo** | `eko-claude-plugins` | `eko-plugin-marketplace` | `gh repo rename`; GitHub 301 redirects |
| **Claude marketplace `name`** (`.claude-plugin/marketplace.json`) | `eko-claude-plugins` | **decision required** §5 | Used in `maos@eko-claude-plugins` and `enabledPlugins` |
| **Local clone path** | `~/Projects/eko-claude-plugins` | optional rename | Submodule / worktrees / sessions cwd |
| **Display** | Eko Plugin Marketplace | same | README |

**Insight:** GitHub rename ≠ Claude marketplace id rename. They can (and likely should) move on **different clocks**.

---

## 3. Inventory (operator machine + repos, 2026-08-10)

### 3.1 Live GitHub
| Item | Value |
|---|---|
| Repo | https://github.com/ekson73/eko-claude-plugins |
| Visibility | public |
| Default branch | main |
| Prior rename | `ekson-claude-plugins` → `eko-claude-plugins` (2026-04-10) — precedent that redirects work |

### 3.2 Claude local / harness (indicative)
| Surface | Count / note |
|---|---|
| Project trees containing string | ~25 encoded project dirs |
| Session **jsonl** containing string | ~55 files (historical prompts/context — **do not bulk-edit**) |
| Project **memory/** md | ~25 files (may update opportunistically; not blocking) |
| `~/.claude/plugins/cache` / `marketplaces` | inspect at GO time (`ls` for eko*) |
| `known_marketplaces.json` / `installed_plugins.json` | must be snapshotted at GO; keys use marketplace **name** |
| Akasha user rules / CLAUDE.md / provenance | live refs to repo name + T1 marketplace |
| Anima dogfood artifacts | already use target name `eko-plugin-marketplace` |

### 3.3 Consumer repos (must update in PRs)

#### multi-agent-os (high)
| Path | Kind |
|---|---|
| `README.md` | `/plugin marketplace add ekson73/eko-claude-plugins`, `maos@eko-claude-plugins`, settings JSON |
| `install/DEPRECATED.md` | same install recipe |
| `CONTRIBUTING.md` | marketplace link + SHA pin note |
| `docs/multi-host-packaging.md` | discovery hub BC note |
| `packaging/README.md` | Claude install path |
| `packaging/opencode-maos/index.js` | comment only |
| Historical docs/ADRs/CHANGELOG | leave or footnote — low priority |

#### vek-claude-plugins (medium)
| Path | Kind |
|---|---|
| `INSTALL-WINDOWS.md` | optional public marketplace add URL |
| `docs/adrs/ADR-001-float-marketplace-sources.md` | name mention |

#### akasha / ~/.claude (operator harness — medium/high)
| Path | Kind |
|---|---|
| `docs/plugins-provenance.md` | T1 inventory row |
| `CLAUDE.md` / `AGENTS.md` ecosystem list | repo name |
| rules citing path probes (`multi-identity…`) | local path `~/Projects/eko-claude-plugins` |
| `EKO-SYSTEM-MANIFESTO.md` | marketplace list |

#### eko-claude-plugins itself
| Path | Kind |
|---|---|
| `.claude-plugin/marketplace.json` `name` | Claude id |
| All install snippets in README/hosts | BC paths |
| CI assert `mp.name == eko-claude-plugins` | must flip with marketplace id |
| `docs/P3-RENAME-HOLD.md` | lift HOLD after verification |

### 3.4 What does **not** break on GitHub-only rename
- Pi: `pi install git:github.com/ekson73/multi-agent-os@main` (MAOS, not eko)
- OpenCode thin plugin: raw.githubusercontent MAOS path
- `npx skills add ekson73/multi-agent-os`
- Catalog `catalog: eko-plugin-marketplace` (already)

### 3.5 What **does** break if done wrong
- Claude `maos@eko-claude-plugins` if marketplace **name** changes without dual-register
- `enabledPlugins` / `extraKnownMarketplaces` keys in project settings
- Local cache dir names keyed by marketplace name
- Operator muscle memory + agent prompts mid-session

---

## 4. Recommended strategy: **two-phase cutover**

### Phase A — GitHub repo rename only (lower risk)
1. Preflight inventory refresh (re-run §3 counts + `gh api` open PRs/issues).
2. Ensure no open PRs that hardcode full clone URLs in CI secrets (none expected).
3. `gh repo rename eko-plugin-marketplace` from `eko-claude-plugins` (or GitHub UI).
4. Verify GitHub 301: old URL → new.
5. Update **git remote** on operator clones + submodule pointer if any.
6. Update **docs URLs** that say `github.com/ekson73/eko-claude-plugins` → new (consumer PRs).
7. **Keep** Claude marketplace.json `"name": "eko-claude-plugins"` during Phase A.
8. Install recipe becomes:
   ```text
   /plugin marketplace add ekson73/eko-plugin-marketplace
   /plugin install maos@eko-claude-plugins
   ```
   (repo path new; **plugin@marketplace-id** still old name)

### Phase B — Claude marketplace id rename (higher risk; optional later)
Only after Phase A is stable ≥1 dogfood cycle:

1. Decide target marketplace id (recommendation: **`eko-plugin-marketplace`** to match system-name).
2. Dual-publish window if Claude supports two marketplace names for same source — **verify against current Claude Code docs at GO time** (behavior changes). If dual not supported:
   - Document one-time operator action: remove old marketplace, add new, re-enable `maos@eko-plugin-marketplace`.
3. Flip `marketplace.json` `name`.
4. Update all `maos@…` and `enabledPlugins` strings.
5. CI assertions + provenance + MAOS README.
6. Lift dual-name notes after window (P3b).

### Why two phases
- GitHub redirects absorb most URL debt.
- Marketplace **id** is a local string key with no automatic redirect in Claude settings.
- Sessions/jsonl can keep historical `eko-claude-plugins` forever without functional break if id stays stable in Phase A.

---

## 5. Marketplace id decision matrix (Phase B)

| Option | Pros | Cons | Recommendation |
|---|---|---|---|
| **B1** Keep id `eko-claude-plugins` forever after GitHub rename | Zero settings migration | Id ≠ system-name; residual claude-lock | Acceptable long-term if fatigue high |
| **B2** Rename id → `eko-plugin-marketplace` | Aligns all layers | One-time break of `@eko-claude-plugins` | **Preferred** after dual window research |
| **B3** Alias both ids | Best UX if platform allows | May be unsupported | Research at GO |

**Default recommendation:** Phase A soon after GO; Phase B only with B2 + verified migration steps.

---

## 6. Session / local-state policy

| Asset | Policy |
|---|---|
| Transcript **jsonl** | **Leave untouched** — historical; no bulk rewrite |
| Project **memory/** | Opportunistic fix when file is edited for other reasons; optional sweep script **after** Phase A |
| `known_marketplaces` / cache | Snapshot JSON before Phase B; after add new marketplace, confirm `maos` still enabled; remove old only when green |
| Local folder `~/Projects/eko-claude-plugins` | Rename optional; if renamed, update gitdir includeIf probes + submodule path in parent Projects repo |
| In-flight agent sessions | **Drain or finish** before Phase B; Phase A OK with notice in VKS-2620 |

**Explicit:** There is no efficient guaranteed bulk session rewrite that preserves integrity. Plan assumes **coexistence of old strings in history**.

---

## 7. Execution checklist (only after operator GO)

### T−1 Preflight
- [ ] Re-run inventory script (below) → attach output to VKS-2620
- [ ] Confirm no critical open PRs on eko repo
- [ ] Confirm MAOS/vek/akasha branches free for consumer PRs
- [ ] Read current Claude Code marketplace docs (add/remove/rename behavior)
- [ ] Backup: `cp -a ~/.claude/plugins ~/.claude/plugins.bak-p3-$(date +%Y%m%d)`
- [ ] Operator GO comment on VKS-2620 + this plan status → **APPROVED**

### T0 Phase A (GitHub)
- [ ] `gh repo rename eko-plugin-marketplace` (from eko-claude-plugins dir)
- [ ] `git remote set-url origin git@github.com:ekson73/eko-plugin-marketplace.git`
- [ ] Parent Projects submodule path/url update if applicable
- [ ] Consumer PRs: URL-only updates (MAOS, vek, akasha provenance)
- [ ] eko README: “formerly eko-claude-plugins” dual note
- [ ] Verify: browser old URL redirects; `gh repo view ekson73/eko-plugin-marketplace`
- [ ] Verify Claude still installs via **new** github path + **old** marketplace id

### T1 Soak
- [ ] ≥1 dogfood: `/plugin marketplace update` + use `maos` skill
- [ ] Pi/OpenCode unchanged smoke
- [ ] No broken CI on eko (HOLD file still active until Phase B done or B1 chosen)

### T2 Phase B (optional)
- [ ] Marketplace id migration per §5
- [ ] Flip CI assert on `mp.name`
- [ ] Update `maos@…` everywhere
- [ ] Remove old marketplace from local Claude
- [ ] P3b: drop dual-name after N days (suggest 14)

### T3 Close
- [ ] Set `RENAME_HOLD=lifted` in P3-RENAME-HOLD.md with date + evidence links
- [ ] Close VKS-2620 or move residual to P3b ticket
- [ ] Master changelog / session note

---

## 8. Inventory refresh script (run at GO)

```bash
#!/usr/bin/env bash
# scripts/p3-rename-inventory.sh — read-only blast radius
set -euo pipefail
echo "## GitHub"; gh repo view ekson73/eko-claude-plugins --json name,url 2>/dev/null || gh repo view ekson73/eko-plugin-marketplace --json name,url
echo "## MAOS files"; rg -l 'eko-claude-plugins|eko-plugin-marketplace' "${MAOS:-$HOME/Projects/multi-agent-os}" --glob '!**/.git/**' | wc -l
echo "## vek-claude-plugins"; rg -l 'eko-claude-plugins' "${VEK_MP:-$HOME/Projects/vek-claude-plugins}" --glob '!**/.git/**' | wc -l
echo "## akasha docs/rules"; rg -l 'eko-claude-plugins' "${CLAUDE_HOME:-$HOME/.claude}" --glob '!**/projects/**' --glob '!**/.git/**' | wc -l
echo "## session jsonl"; rg -l 'eko-claude-plugins' "${CLAUDE_HOME:-$HOME/.claude}/projects" --glob '**/*.jsonl' | wc -l
echo "## memory md"; rg -l 'eko-claude-plugins' "${CLAUDE_HOME:-$HOME/.claude}/projects" --glob '**/memory/**' | wc -l
echo "## plugin dirs"; ls "${CLAUDE_HOME:-$HOME/.claude}/plugins/marketplaces" 2>/dev/null | rg -i eko || true
ls "${CLAUDE_HOME:-$HOME/.claude}/plugins/cache" 2>/dev/null | rg -i 'eko|maos' || true
```

Checked into repo as `scripts/p3-rename-inventory.sh`.

---

## 9. Rollback

| Phase | Rollback |
|---|---|
| A (GitHub) | Rename back to `eko-claude-plugins` (GitHub allows reverse rename if name free); revert consumer URL PRs |
| B (marketplace id) | Restore `marketplace.json` name; re-add old marketplace; re-enable `maos@eko-claude-plugins` from plugins.bak |

---

## 10. Decision log (fill at GO)

| Decision | Choice | Who | When |
|---|---|---|---|
| Lift HOLD / start Phase A | _pending_ | operator | |
| Phase B marketplace id | B1 / B2 / B3 | operator | |
| Local folder rename | yes / no | operator | |
| Dual-name window days | _e.g. 14_ | operator | |

---

## 11. Related
- [`../P3-RENAME-HOLD.md`](../P3-RENAME-HOLD.md)
- [`../NAMING.md`](../NAMING.md)
- [`../ROADMAP.md`](../ROADMAP.md)
- [`../adrs/ADR-004-rename-eko-plugin-marketplace.md`](../adrs/ADR-004-rename-eko-plugin-marketplace.md)
- VKS-2620
