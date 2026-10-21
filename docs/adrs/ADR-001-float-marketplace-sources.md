# ADR-001: Float plugin sources to default branch; version SSOT in plugin.json

- **Status**: Accepted; Amendment 1 (2026-10-19, `maos` pinned) accepted when its PR merges (⏳ re-validate by **2026-11-26** — 6-month TTL)
- **Date**: 2026-05-26
- **Deciders**: Operator (DevSecOps / AI-eng), via HITL directive
- **Scope**: This marketplace (`eko-claude-plugins`) + all listed plugins — part of a cross-repo decision (companion ADRs in `vek-claude-plugins`, `vek-ai-toolkit`, `multi-agent-os`)

## Context

Pinning each plugin to a commit `sha` (plus a duplicated per-entry `version`) created recurring friction:

1. **Agents forget to bump the pin** when the plugin repo changes (caused a version/SHA desync fixed in `vek-claude-plugins` PR #5).
2. **Mandatory marketplace maintenance** on every plugin release (a second PR just to bump the pin).
3. **Latency** green-PR → user-visible.

`maos` is listed in **two** marketplaces (`eko-claude-plugins` + `vek-claude-plugins`), and the pins had drifted across them. Phase reality: **MVP / expansion, lean team, agility-critical, no production environment yet.**

Anthropic's plugin-marketplace docs support unpinned sources: `source.ref` defaults to the repo default branch; omitting `version` makes "every commit count as a new version."

## Decision

1. **Marketplace entries float**: `source = { "source": "github", "repo": "…", "ref": "main" }` — no `sha`, no per-entry `version`.
2. **Version SSOT lives in each plugin's own `plugin.json`** (e.g. `maos` → `multi-agent-os/.claude-plugin/plugin.json`).
3. Applies to **all** listed plugins. Marketplace becomes *set-and-forget*; the cross-marketplace `maos` SHA divergence auto-resolves (both track `main`).

## Consequences

**Positive**: zero marketplace maintenance; faster propagation; divergence auto-resolved.

**Negative / risks (accepted for MVP, TTL-boxed)**: reproducibility loss (users on different commits per refresh); supply-chain blast-radius from a tracked `main`.

**Mitigations**: own repos' `main` is PR-gated + branch-protected (`[C18]`); user-side `/plugin marketplace update` + startup auto-update still gate propagation; **re-validate by 2026-11-26**; re-pin on any incident.

## Re-validation trigger (TTL)

| When | Action |
|---|---|
| **2026-11-26** (6 months) | Re-assess float vs re-pin; reconsider once production exists |
| Any supply-chain incident | Re-pin the affected plugin immediately |

## References

- Anthropic plugin-marketplaces docs (version resolution)
- `vek-claude-plugins` PR #5 + ADR-001 (companion)
- `[C12]` Plugin Provenance, `[C14]` External-Repo Integration (conscious MVP deviation, time-boxed)
- Companion ADRs: `vek-ai-toolkit`, `multi-agent-os`

## Amendment 1 (2026-10-19): pin `maos` to a reviewed commit

- **Status**: Accepted on merge of the PR that introduces it (operator decision).
- **Scope**: the `maos` entry of this marketplace only. Entries added later float by default unless amended. The companion Vek marketplace is out of scope (separate owner; changed only by its own decision).

### Why the float premise no longer holds for `maos`

The float decision relied on one mitigation: "own repos' `main` is PR-gated + branch-protected". For `ekson73/multi-agent-os` that is weaker than stated:

1. The owner's readback on multi-agent-os#305 (2026-08-01) records that the active `main` ruleset contains deletion, non-fast-forward and Copilot review rules only, with no authenticated release-coherence check (`RUNTIME_ENFORCEMENT=NOT_ACHIEVED`), and that a second account has write access.
2. multi-agent-os#493 tracks a historical secret-scan finding in that public repository whose containment is not yet recorded.

With a floating source, any commit that reaches `main` reaches every consumer on its next refresh. A pin bounds that to commits someone reviewed for this marketplace.

### Decision

- `maos` source: `{"source":"url","url":"https://github.com/ekson73/multi-agent-os.git","ref":"main","sha":"<40-char>"}`. `sha` supersedes `ref`; `ref` stays only to name the branch the commit came from.
- Still **no** per-entry `version` (would break `/plugin update`).
- Initial pin: `e5df6a8e2ffef360463125361b1619d992c74d5b` (`main` HEAD on 2026-10-19, `plugin.json` 1.22.1). multi-agent-os has no tags or releases, so the pin is a commit, not a tag.
- What the pin freezes, reviewed 2026-10-19 at that commit (hooks and the scripts they run): no download-and-execute, no `eval` of outside input, no exfiltration found. Two on-by-default behaviours are kept by this pin and tracked for follow-up in multi-agent-os: the SessionStart preflight fetches the upstream and fast-forwards or `rebase --autostash`es the project checkout (opt out `PREFLIGHT_NO_AUTOHEAL=1`), and `worktree-gate.sh` launches an installed AI CLI with edit/shell tools when the hook itself errors (opt out `MAOS_SELFHEAL=0`). The pin stops new behaviour arriving unreviewed; it does not remove these.

### Bumping the pin

1. Pick the candidate commit on multi-agent-os `main`.
2. Review the **tree at the candidate commit** (`git show <sha>:<path> | cat -v`), not one commit's patch: an earlier commit can plant something the latest patch never shows. At minimum read, in full: `hooks/hooks.json` and every script it invokes (plus what they source), `.claude-plugin/`, any `.mcp.json`/`.lsp.json`, and the prompt-bearing content the plugin ships (`skills/**/SKILL.md`, `commands/`, `agents/`). Use `git diff <old-sha>..<candidate>` only to prioritise, never as the whole review.
3. Check that the candidate's `.claude-plugin/plugin.json` `version` differs from the currently pinned commit's. Claude Code uses that version to decide whether an installed copy is refreshed, so a SHA change with the same version leaves existing installs on the old commit. If the version did not change, get it bumped upstream first and pin the commit that carries the bump.
4. Open a PR here changing only `sha`, the marketplace `version`, `metadata.lastUpdated` and `CHANGELOG.md`; the PR body names the commit, its `plugin.json` version and what was reviewed.

### Exit

Return `maos` to float when multi-agent-os#305 is closed with runtime enforcement achieved and multi-agent-os#493 has recorded containment, or re-decide at the 2026-11-26 re-validation.
