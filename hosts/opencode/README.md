# OpenCode

| Field | Value |
|---|---|
| **eko status** | `pending-upstream` |
| **Domain** | distribution pointer only — **no** agentic-tools in eko |
| **Upstream product example** | `maos` → https://github.com/ekson73/multi-agent-os |
| **Catalog** | `registry/catalog.json` → `providers.opencode` (or mapped key) |

## Why in eko
OpenCode documents **Plugins** (npm/local) + Agent Skills + MCP. eko lists a **pointer**, does not vendor plugin code.

## Planned install (when upstream ships OpenCode plugin package)
See OpenCode docs: plugins from npm or local path. Exact package name TBD on `multi-agent-os`.

## Blocker
MAOS (or another upstream) must publish an OpenCode-shaped plugin. eko flips to `ready` only then.

## Evidence (≈2026-08)
anomalyco/opencode ~196k★, pushed 2026-08-10; HN “Yet Another OpenCode Plugin”; npm `opencode` ~1.18.x.

## Tracking
- https://github.com/ekson73/multi-agent-os/issues/314
