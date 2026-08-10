# OpenCode

| Field | Value |
|---|---|
| **eko status** | `ready` |
| **Domain** | distribution pointer only |
| **Upstream** | https://github.com/ekson73/multi-agent-os |

## Install — thin plugin (local file)
```bash
mkdir -p ~/.config/opencode/plugins
curl -fsSL -o ~/.config/opencode/plugins/maos.js \
  https://raw.githubusercontent.com/ekson73/multi-agent-os/main/packaging/opencode-maos/index.js
```
Restart OpenCode. Package source: `packaging/opencode-maos/` (npm name `opencode-maos` when published).

## Skills (agentic-tools — upstream)
```bash
npx skills add ekson73/multi-agent-os -g -a opencode
```

## Tracking
- https://github.com/ekson73/multi-agent-os/issues/314 (done via PR #315)
