# Host / harness research — August 2026

| Field | Value |
|---|---|
| **As-of** | 2026-08-10 |
| **Method** | Live version probes (npm/gh) + official docs + last30days (HN/social thin) + prior eko matrix |
| **Domain rule** | **eko** = distribution index only · **multi-agent-os** = agentic-tools product |
| **last30days** | v3.18.4 · HN-heavy; social APIs thin this run — product decisions weighted to **primary docs + repo signals**, not HN alone |

---

## 1. Version / signal snapshot (2026-08-10)

| Harness | Signal | Packaging surface (honest) |
|---|---|---|
| **Claude Code** | npm `@anthropic-ai/claude-code` **2.1.226**; gh ~141k★; pushed 2026-08-08 | **First-class plugin marketplace** + skills |
| **OpenCode** | npm **~1.18.16**; gh ~196k★; very active | **Plugins** (npm/local `.opencode/plugins`) + skills + MCP |
| **Pi** | coding-agent package ecosystem (pi.dev packages); operator runtime ~0.8x line | **Packages** (`package.json` `pi` + `pi-package`) |
| **Codex** | gh openai/codex ~105k★; active | **Skills + MCP** (not Claude-style 3p marketplace) |
| **skills.sh / Agent Skills** | npm `skills` **1.5.22**; [agentskills.io](https://agentskills.io) open standard (Discord live) | **Portable SKILL.md** install across many clients |
| **Gemini CLI** | gh ~106k★; **extensions** hub (geminicli.com/extensions) | Extensions + skills path |
| **Antigravity** | Google banner: free/One tier **Gemini CLI → Antigravity CLI** transition messaging (2026) | Treat as **successor/sibling CLI surface**, not a separate eko mall |
| **GitHub Copilot** | Official **Skills**, custom agents, hooks, MCP (cloud agent docs) | Skills/MCP/custom agents — **GitHub-owned** surfaces |
| **AWS Kiro** | IDE/CLI: Skills, MCP, ACP, AGENTS.md, Open VSX | Skills + Open VSX (eko ≠ VSX publisher) |
| **Kiro Crew** | Multi-agent / custom-agent crew feature **inside Kiro** | **Not** a separate public 3p marketplace |
| **Warp** | gh ~64k★ | ADE/workflows; thin third-party pack “mall” |
| **ChatGPT store** | OpenAI-controlled | N/A for eko |
| **VS Code Marketplace** | MS/Open VSX | Editor extensions — wrong abstraction for eko index |
| **Grok / xAI** | Model/API provider | N/A as pack host |
| **Meta Muse Code** | Product/community dumps | No stable 3p pack registry eko can own |

### last30days (dev register) — qualitative
What I learned: public discourse in the window is saturated with **“agent skills”** as a unit of extension (Show HN skill packs; skepticism threads about why skills exist). That reinforces **Agent Skills / skills.sh as the cross-harness bridge**, not building a new proprietary mall per host. It does **not** justify marking unstable hosts `ready`.

---
✅ All agents reported back!
└─ 🟡 HN: 6 storys │ 54 points │ 26 comments
---

---

## 2. Council verdict — what to CREATE / UPDATE / DEFER / NEVER

### Legend
| Verdict | Meaning |
|---|---|
| **A — eko expand** | Update catalog/hosts/docs pointers only |
| **B — MAOS expand** | Product packaging / skills quality (upstream) |
| **C — dual** | eko pointer + MAOS content |
| **D — no** | Do not build |

| Target | Marketplace / registry? | Verdict | Owner | Rationale |
|---|---|---|---|---|
| **Claude** | Yes — Claude plugin marketplace | **A keep ready** | eko | Only full mall eko **is** |
| **OpenCode** | Plugins registry (npm/local) | **A ready + B thin plugin** | eko+MAOS | Already packaged (#315) |
| **Pi** | Package install | **A ready + B package.json** | eko+MAOS | Already packaged |
| **Codex** | Skills dirs + MCP | **A docs + B skills quality** | eko+MAOS | skills.sh primary; no fake Codex mall |
| **ChatGPT** | OpenAI store | **D n/a** | — | Not controllable |
| **Gemini CLI** | **Extensions** + skills | **A docs** (clarify extensions ≠ eko product) | eko | May link extension *pattern*; do not publish Gemini extension as eko core |
| **Antigravity** | Successor CLI messaging | **A docs** (alias/transition note w/ Gemini) | eko | Do not invent separate marketplace; track transition |
| **VS Code** | MS Marketplace | **D n/a** | — | Wrong product shape |
| **GH Copilot** | Skills + custom agents + hooks + MCP | **A docs** (skills pointer) | eko | GitHub owns distribution; eko discovers MAOS skills |
| **AWS Kiro** | Skills + Open VSX + ACP | **A docs** | eko | skills.sh; no Open VSX package from eko |
| **Kiro Crew** | In-product multi-agent | **A docs sub-row** under Kiro | eko | Not a new catalog host type; document as feature surface |
| **Grok** | Model provider | **D n/a** | — | Use via model settings in other harnesses |
| **Meta Muse Code** | Unstable | **D n/a** | — | No registry |
| **Warp** | Thin 3p | **A docs** best-effort | eko | skills `*` only |
| **Agent Skills / skills.sh** | Meta-standard | **C emphasize** | eko docs + MAOS SKILL.md hygiene | **Strategic spine** for multi-harness |
| **MCP servers** | Portable tools | **B only** (if ever) | MAOS | eko never hosts MCP servers |
| **VSIX / Open VSX maos** | Editor stores | **D** (unless explicit product GO) | — | Domain violation + high maint |

---

## 3. Domain split (non-negotiable)

```text
eko-claude-plugins / eko-plugin-marketplace
  ✅ catalog.json statuses + install one-liners
  ✅ hosts/* discovery docs
  ✅ Claude marketplace.json entry pointing at MAOS
  ❌ skills/ agents/ commands/ hooks/ mcp-tools trees

multi-agent-os (maos)
  ✅ SKILL.md corpus (Agent Skills standard)
  ✅ Claude plugin manifest, Pi package.json, OpenCode thin plugin
  ✅ agents, commands, MCP tooling product
  ❌ becoming a multi-vendor “app store” UI
```

---

## 4. Recommended roadmap (post this research)

| Pri | Action | Repo | Effort |
|---|---|---|---|
| **P0** | Keep Claude marketplace green | eko | ongoing |
| **P0** | Keep catalog honest (`ready` only if install works) | eko | ongoing |
| **P1** | Publish this research + refresh MULTI-HARNESS + HOST-MATRIX | eko | **this change** |
| **P1** | Catalog: `aws-kiro-crew` docs sub-key; Gemini↔Antigravity transition notes; research as-of | eko | **this change** |
| **P2** | MAOS: dogfood `npx skills add … -a '*'` on operator machines; fix skill frontmatter if agents fail | MAOS | when broken |
| **P2** | Optional: publish `opencode-maos` to npm (still thin) | MAOS | low |
| **P3** | GitHub rename eko → eko-plugin-marketplace | eko | **HOLD** / cutover plan |
| **Defer** | Gemini **extension** package published by eko/MAOS | — | only if operator product GO |
| **Defer** | Open VSX Kiro extension | — | only if operator product GO |
| **Never** | eko hosts agentic-tools; ChatGPT/Grok/Muse malls; VS Code VSIX-as-eko-marketplace |

---

## 5. Impartial “does it make sense?” one-liners

| Idea | Sense? |
|---|---|
| Expand eko **docs** for every real harness | **Yes** — cheap, honest |
| Expand MAOS **skills** quality (portable) | **Yes** — highest ROI multi-harness |
| New eko marketplace format per host | **No** — only Claude has eko-owned mall |
| Gemini extension in MAOS | **Maybe later** — product decision, not index work |
| Kiro Crew as separate eko product | **No** — document under Kiro |
| Copilot “plugin clone of Claude MP” | **No** — use Skills + GitHub surfaces |
| Merge eko + MAOS monorepo | **No** — domain firewall |

---

## 6. Related
- [`../MULTI-HARNESS-COMPAT.md`](../MULTI-HARNESS-COMPAT.md)
- [`../HOST-MATRIX-2026-08.md`](../HOST-MATRIX-2026-08.md)
- [`../domain-boundary-eko-vs-maos.md`](../domain-boundary-eko-vs-maos.md)
- [`../plans/P3-rename-cutover-plan.md`](../plans/P3-rename-cutover-plan.md)
