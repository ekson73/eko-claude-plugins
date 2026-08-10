# Naming lock — this distribution hub

| Field | Value |
|---|---|
| **Status** | **DECIDED** (operator accepted Anima default **A**, 2026-08-10) |
| **System-name (target repo)** | `eko-plugin-marketplace` |
| **GitHub today (BC)** | `eko-claude-plugins` |
| **Display** | Eko Plugin Marketplace |
| **Catalog id** | `eko-plugin-marketplace` (`registry/catalog.json`) |
| **Runner-up** | `eko-plugin-catalog` |
| **Rejected** | `eko-pack-index` (opaque) · `eko-plugins-marketplace` (EN plural; not chosen) · `eko-agent(s)-*` (ontology) |
| **Authority** | Anima councils R2–R3 + operator HITL A |

Do not reopen naming unless operator overrides B/C explicitly.

## RENAME_HOLD (active)

| Flag | **`RENAME_HOLD=active`** |
|---|---|
| Spec | [`P3-RENAME-HOLD.md`](./P3-RENAME-HOLD.md) |
| Meaning | **No GitHub rename** until deep-research cutover plan + operator GO |
| Reasons | Claude sessions/state drift risk; multi-harness consumer lockstep updates |
| Safe now | BC path `eko-claude-plugins`; identity name `eko-plugin-marketplace` |

**Do not** bulk-rewrite Claude sessions or `gh repo rename` under this hold.
