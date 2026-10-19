# Security

## Reporting

Report a suspected vulnerability privately through GitHub's
**Security → Report a vulnerability** on this repository. If that button is not
shown, open an issue titled "Security contact request" with no details, and the
maintainer will reply with a private channel. Do not put vulnerability details
in a public issue.

## What this repository is

A catalog. It holds references to plugins, not their code (`AGENTS.md`,
`CLAUDE.md` §NOT-TODOs). It has no package-manager dependencies, no build, no
release artifacts and no CI secrets. Its supply-chain surface is therefore:

1. the plugin sources listed in `.claude-plugin/marketplace.json`;
2. the GitHub Actions used by `.github/workflows/`;
3. write access to `main`.

## Controls in place

| Control | Where |
|---|---|
| Secret scanning of full history, pinned gitleaks binary + SHA256, positive controls | `.github/workflows/gitleaks.yml` |
| Every external action pinned to a commit SHA; every workflow sets explicit `permissions` (enforced) | `scripts/validate-catalog.sh` |
| Pinned actions kept current | `.github/dependabot.yml` |
| Maintainer review on every path | `.github/CODEOWNERS` (needs branch protection, below) |
| No vendored plugin code | `validate-catalog.yml` "Forbid agentic-tool / vendored trees" |

Not in this repository, set by the owner in GitHub settings: branch protection
on `main` (required review from code owners, required status checks
`gitleaks` and `validate`), Dependabot security updates, and private
vulnerability reporting (off as of 2026-10-19).

## Tabletop: compromised upstream plugin (worm-style)

**Scenario.** An attacker gains push access to an upstream plugin repository
(for example through a stolen maintainer token, as in the 2025 "Shai-Hulud" npm
worm) and pushes a malicious commit to its default branch.

**Exposure today.** Marketplace entries float on `ref: main` (ADR-001, MVP,
TTL 2026-11-26). The next `/plugin marketplace update` on any consumer machine
installs the malicious commit with no change in this repository. Hooks in a
plugin run with the user's shell privileges.

**Detection.** None in this repository: a float pin has no diff to review.
Upstream's own scanners, or a user noticing odd hook behaviour.

**Response.**
1. Pin the affected entry to the last known-good commit with `sha` (supersedes
   `ref`, per `CLAUDE.md` §Updating a Plugin), or remove the entry. Bump the
   marketplace version and changelog.
2. Tell consumers to run `/plugin marketplace update` and to disable the plugin
   until they have.
3. Rotate any credential the plugin's hooks could read on affected machines
   (owner action).

**Mitigations to decide (owner).**
- End the float before the ADR-001 TTL: pin each entry to a reviewed commit SHA
  and move it forward through a reviewed PR.
- Enable branch protection on `main` so a stolen token for this repository
  cannot rewrite the catalog without review.

**Review.** Re-run this tabletop when ADR-001 is revisited or a new plugin is
added.
