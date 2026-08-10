# P3 RENAME HOLD — `eko-claude-plugins` → `eko-plugin-marketplace`

| Field | Value |
|---|---|
| **Flag** | **`RENAME_HOLD=active`** |
| **Date** | 2026-08-10 |
| **Operator** | Hold rename: pending Claude sessions + multi-harness consumer updates |
| **Target name** | `eko-plugin-marketplace` (**DECIDED** — see `NAMING.md`) |
| **GitHub today** | `eko-claude-plugins` (**do not rename**) |
| **Ticket** | VKS-2620 |

## Why hold (not cancel)

1. **Claude sessions / local state** reference the path and marketplace id `eko-claude-plugins` (project memories, plans, plugin cache paths, install history). Blind GitHub rename risks **session drift** and broken `/plugin marketplace` resolution mid-flight. Efficient/safe bulk rewrite of all sessions is **not** available as a one-shot guarantee.
2. **Multi-harness consumers** must be updated in lockstep (remove old pointer, add new): Claude marketplace add path, MAOS README, vek-claude-plugins, akasha provenance, host install snippets.
3. Rename is **efficient only after** a written cutover plan with inventory + dual-name window + verification. **Not** a drive-by `gh repo rename`.

### Blast-radius snapshot (operator machine, 2026-08-10, indicative)

| Surface | Approx hits |
|---|---|
| Claude project memories citing name | ~25 files |
| multi-agent-os tree refs | ~11 files |
| vek-claude-plugins refs | ~2 files |
| akasha docs | ~3 files |
| Live marketplace BC path | `ekson73/eko-claude-plugins` |

## Hard rules while HOLD is active

- Do **not** run `gh repo rename` / transfer.
- Do **not** break Claude marketplace `"name"` / install paths without the plan.
- Keep documenting **target name** `eko-plugin-marketplace` as DECIDED identity.
- Keep install BC on `ekson73/eko-claude-plugins`.
- Advance non-rename work (catalog, hosts, CI).

## Required before lifting HOLD: deep-research plan (DoR)

**Plan status:** DRAFTED → [`plans/P3-rename-cutover-plan.md`](./plans/P3-rename-cutover-plan.md). Execution still requires operator GO.

Plan MUST cover at least:

1. Claude local state (`known_marketplaces`, `installed_plugins`, cache dirs)
2. In-flight sessions/plans/memories strategy (dual-read vs freeze vs migrate)
3. GitHub rename + URL redirects
4. Consumer docs (MAOS, eko, vek, akasha)
5. Pi/OpenCode/skills.sh paths (usually MAOS git — verify no eko path break)
6. Dual-name window + rollback + verification checklist

**Exit:** plan reviewed + operator **GO** + off-peak window.

## Non-goals
- Does not undecide `eko-plugin-marketplace`
- Does not migrate sessions in this change
- Does not implement rename under HOLD
