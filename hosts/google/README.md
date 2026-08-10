# Google — Gemini CLI + Antigravity

| Field | Value |
|---|---|
| **Gemini eko status** | `docs` |
| **Antigravity eko status** | `docs` |
| **Domain** | distribution pointer only |
| **Upstream product** | https://github.com/ekson73/multi-agent-os |
| **Research** | [HOST-RESEARCH-2026-08.md](../../docs/research/HOST-RESEARCH-2026-08.md) |
| **Compat** | [MULTI-HARNESS-COMPAT.md](../../docs/MULTI-HARNESS-COMPAT.md) |

## Reality check (2026-08)
- **Gemini CLI** has a real **Extensions** surface (browse/about on geminicli.com) **and** can consume portable **Agent Skills**.
- Public product messaging (2026) describes **transition of free/Google One tier Gemini CLI → Antigravity CLI**. Treat Antigravity as **successor/sibling**, not a second eko-owned marketplace.
- eko does **not** publish Gemini/Antigravity extensions. That would be a **MAOS product** decision later — not index work.

## Portable install (both)
```bash
# preferred when agent id known
npx skills add ekson73/multi-agent-os -g -a gemini-cli

# Antigravity / unknown id
npx skills add ekson73/multi-agent-os -g -a '*' -y
```

## Native (not eko-hosted)
- Gemini **Extensions**: use Google’s extension browser/docs if you need host-native packages.
- Do not expect `maos@eko-claude-plugins` to mean anything on Gemini.

## Verdict
| Action | Sense? |
|---|---|
| eko docs pointers | **Yes** |
| eko `ready` marketplace | **No** (we don’t own their registry) |
| MAOS Gemini extension package | **Defer** until explicit product GO |
