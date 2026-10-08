# ECC for Codex CLI

This supplements the root `AGENTS.md` with a repo-local ECC baseline.

## Repo Skill

- Repo-generated Codex skill: `.agents/skills/eko-claude-plugins/SKILL.md`
- Claude-facing companion skill: `.claude/skills/eko-claude-plugins/SKILL.md`
- Keep user-specific credentials and private MCPs in `~/.codex/config.toml`, not in this repo.

## MCP Baseline

Treat `.codex/config.toml` as the default ECC-safe baseline for work in this repository.
The generated baseline enables GitHub, Context7, Exa, Memory, Playwright, and Sequential Thinking.

### Contributor setup: Context7

The repository configures `[mcp_servers.context7]` with
`url = "https://mcp.context7.com/mcp"`. Codex merges project and user config by key,
so a legacy entry in `~/.codex/config.toml` can leave both transports configured
and cause `url is not supported for stdio`.

If your user config has a legacy `[mcp_servers.context7]` entry, remove its
`command` and `args` to use the repository URL, or replace its transport settings
with `url = "https://mcp.context7.com/mcp"`. In either case, preserve any required
`http_headers`, including `[mcp_servers.context7.http_headers]`, in your user config.

## Multi-Agent Support

- Explorer: read-only evidence gathering
- Reviewer: correctness, security, and regression review
- Docs researcher: API and release-note verification

## Workflow Files

- No dedicated workflow command files were generated for this repo.

Use these workflow files as reusable task scaffolds when the detected repository workflows recur.