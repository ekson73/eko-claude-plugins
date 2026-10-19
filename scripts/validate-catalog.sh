#!/usr/bin/env bash
# Local + CI dogfood of catalog/marketplace/hosts/HOLD rules
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

for d in skills agents commands mcp-tools; do
  if [ -d "$d" ]; then echo "FORBIDDEN: $d"; exit 1; fi
done
if [ -d plugins ] && find plugins -type f | grep -q .; then
  echo "FORBIDDEN: vendored plugins/"; exit 1
fi

python3 <<'PY'
import json
import sys
from pathlib import Path

root = Path(".")
mp = json.loads((root / ".claude-plugin/marketplace.json").read_text())
cat = json.loads((root / "registry/catalog.json").read_text())
assert cat.get("domain") == "distribution"
assert cat.get("catalog") == "eko-plugin-marketplace"
naming = cat.get("naming") or {}
assert naming.get("status") == "DECIDED"
assert naming.get("system_name") == "eko-plugin-marketplace"
assert mp.get("name") == "eko-claude-plugins", "BC marketplace name until Phase B of cutover plan"

key_to_host = {
    "claude": "claude",
    "pi": "pi",
    "opencode": "opencode",
    "codex": "openai",
    "chatgpt": "openai",
    "gemini": "google",
    "antigravity": "google",
    "vscode": "microsoft",
    "gh-copilot": "microsoft",
    "aws-kiro": "aws-kiro",
    "aws-kiro-crew": "aws-kiro",
    "warp": "warp",
    "grok": "_out-of-scope",
    "meta-muse-code": "_out-of-scope",
}
missing = []
for entry in cat["entries"]:
    for key, meta in entry["providers"].items():
        st = meta.get("status")
        assert st in ("ready", "pending-upstream", "docs", "n/a"), key
        if st == "ready":
            assert meta.get("install"), f"ready {key} missing install"
        if st == "docs" and meta.get("kind") == "skills-cli-pointer":
            assert meta.get("install"), f"docs {key} missing install"
        host = key_to_host.get(key)
        if host and not (root / "hosts" / host / "README.md").is_file():
            missing.append(f"hosts/{host}/README.md (for {key})")
assert not missing, missing

hold = (root / "docs/P3-RENAME-HOLD.md").read_text()
assert "RENAME_HOLD=active" in hold
assert (root / "docs/plans/P3-rename-cutover-plan.md").is_file()
assert (root / "docs/MULTI-HARNESS-COMPAT.md").is_file()
assert (root / "docs/research/HOST-RESEARCH-2026-08.md").is_file()
print("OK validate-catalog", mp["version"], cat.get("version"), "HOLD+PLAN+COMPAT present")
PY

# Workflow supply-chain floor: every external action pinned to a full commit
# SHA, and every workflow declares a top-level `permissions:` block so the
# token is not left at the repository default.
python3 <<'PY'
import re
import sys
from pathlib import Path

bad = []
for wf in sorted(Path(".github/workflows").glob("*.y*ml")):
    text = wf.read_text()
    if not re.search(r"(?m)^permissions:", text):
        bad.append(f"{wf}: no top-level permissions block")
    for n, line in enumerate(text.splitlines(), 1):
        m = re.match(r"\s*(?:-\s*)?uses:\s*['\"]?([^'\"\s#]+)", line)
        if not m:
            continue
        ref = m.group(1)
        if ref.startswith("./") or ref.startswith("docker://"):
            continue
        if not re.fullmatch(r"[^@]+@[0-9a-f]{40}", ref):
            bad.append(f"{wf}:{n}: action not pinned to a commit SHA: {ref}")
if bad:
    print("\n".join("FAIL " + b for b in bad))
    sys.exit(1)
print("OK workflow hardening (SHA-pinned actions, explicit permissions)")
PY
