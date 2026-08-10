#!/usr/bin/env bash
# Read-only blast-radius inventory for P3 rename. Does not modify anything.
set -euo pipefail
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
MAOS="${MAOS:-$HOME/Projects/multi-agent-os}"
VEK_MP="${VEK_MP:-$HOME/Projects/vek-claude-plugins}"
EKO="${EKO:-$HOME/Projects/eko-claude-plugins}"

echo "## GitHub (BC or new)"
gh repo view ekson73/eko-claude-plugins --json name,url 2>/dev/null \
  || gh repo view ekson73/eko-plugin-marketplace --json name,url 2>/dev/null \
  || echo "repo not visible with current auth"

echo "## multi-agent-os file hits: $(rg -l 'eko-claude-plugins|eko-plugin-marketplace' "$MAOS" --glob '!**/.git/**' 2>/dev/null | wc -l | tr -d ' ')"
echo "## vek-claude-plugins file hits: $(rg -l 'eko-claude-plugins' "$VEK_MP" --glob '!**/.git/**' 2>/dev/null | wc -l | tr -d ' ')"
echo "## eko hub internal hits: $(rg -l 'eko-claude-plugins|eko-plugin-marketplace' "$EKO" --glob '!**/.git/**' 2>/dev/null | wc -l | tr -d ' ')"
echo "## akasha (non-projects) hits: $(rg -l 'eko-claude-plugins' "$CLAUDE_HOME" --glob '!**/projects/**' --glob '!**/.git/**' 2>/dev/null | wc -l | tr -d ' ')"
echo "## session jsonl hits: $(rg -l 'eko-claude-plugins' "$CLAUDE_HOME/projects" --glob '**/*.jsonl' 2>/dev/null | wc -l | tr -d ' ')"
echo "## memory md hits: $(rg -l 'eko-claude-plugins' "$CLAUDE_HOME/projects" --glob '**/memory/**' 2>/dev/null | wc -l | tr -d ' ')"
echo "## plugin marketplaces dir:"; ls "$CLAUDE_HOME/plugins/marketplaces" 2>/dev/null | rg -i eko || echo "(none)"
echo "## plugin cache dir:"; ls "$CLAUDE_HOME/plugins/cache" 2>/dev/null | rg -i 'eko|maos' || echo "(none)"
echo "DONE read-only inventory"
