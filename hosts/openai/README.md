# OpenAI — Codex (+ ChatGPT note)

| Field | Value |
|---|---|
| **eko status** | `docs / n/a` |
| **Domain** | distribution pointer only — **no** agentic-tools in eko |
| **Upstream product example** | `maos` → https://github.com/ekson73/multi-agent-os |
| **Catalog** | `registry/catalog.json` → `providers.openai` (or mapped key) |

## Codex — status `docs`
Codex is skill/MCP-centric for coding-agent extensibility, **not** a Claude-like plugin marketplace eko can host.

### Discovery pointer (content lives in MAOS)
```bash
npx skills add ekson73/multi-agent-os -g -a codex
```
eko only documents this line; skills are agentic-tools **upstream**.

## ChatGPT — status `n/a`
ChatGPT Plugin / GPT store is **OpenAI-controlled**. eko cannot publish or mirror that store. Out of scope.

## Evidence (≈2026-08)
openai/codex ~105k★; docs: Skills + MCP + (separate) ChatGPT Plugins product surface.
