# Compat Expansion 2026-08-17 — honest assessment

> **Data:** 2026-08-17 (dom) · **Fontes:** HOST-MATRIX-2026-08.md + MULTI-HARNESS-COMPAT.md + web search 2026-08-17 + last30days 2026-07-18→2026-08-17
> **Princípio:** `eko-plugin-marketplace = INDEX` (ponteiros), `multi-agent-os (maos) = PRODUCT` (skills). Honesto sobre o que é `ready` (install funciona hoje) vs `docs` (apenas ponteiro skills) vs `n/a`.

## 1. Versões / sinais atuais (2026-08-17)

| Host | Sinal 2026-08-17 | Pack surface | Fonte |
|---|---|---|---|
| **Claude Code** | CLI ~2.1.224, 141k★ | Marketplace + plugin | HOST-MATRIX, web search |
| **OpenCode** | npm ~1.18.x, ~196k★, plugins docs | Plugin npm/local + skills | web search joozio |
| **Pi** | 0.84.1, pi.dev packages | Package npm/git | HOST-MATRIX, pi.dev |
| **Codex CLI** | ~105k★, Skills docs + official Codex plugin para Claude (2026-04-02) | Skills + MCP | web search |
| **ChatGPT** | store OpenAI-owned | N/A | HOST-MATRIX |
| **Gemini CLI** | ~106k★, extensions hub | Extensions + skills | web search |
| **Antigravity** | transition Gemini CLI → Antigravity (Google free tier) | skills best-effort | HOST-MATRIX |
| **VS Code** | Marketplace + Open VSX | Editor extensions (VSIX) | HOST-MATRIX |
| **GH Copilot** | Official Skills + custom agents + hooks + MCP, skills.sh bridge | docs | HOST-MATRIX |
| **AWS Kiro** | IDE + Open VSX + Skills/MCP/ACP, Transform agents em Kiro (2026-04) | docs | web search aws kiro |
| **Kiro Crew** | in-product multi-agent, não é 3p registry | docs (sub de Kiro) | HOST-MATRIX |
| **Warp** | ~64k★ ADE, thin 3p pack mall, Warp→Claude integration | docs | web search warp |
| **Grok** | model/API (xAI), sem harness de código | N/A | HOST-MATRIX |
| **Muse Spark** | model dumps, sem registry estável | N/A | HOST-MATRIX |
| **DeepSeek harness** | `deepseek-reasonix` (Go binary, DeepSeek-native), `openclaude` suporta DeepSeek via OpenAI-compat | N/A (model) / docs via skills | web search deepseek |

> last30days 2026-07-18→2026-08-17: 49 itens, 17 nos últimos 7d, 5 fontes ativas. Top clusters: "AI Coding Without the Vibes" (96pts), "Musk full-stack AI coding play (Grok+Cursor)" (5pts), "Absurd Math $20 subs Codex vs Claude" (132pts). Nenhum cluster indica novo marketplace maduro além dos já mapeados.

## 2. Quais têm marketplace/registries/packages/plugins — honesto

| Host | Tem marketplace 3p? | eko publica lá? | Instalação honesta hoje |
|---|---|---|---|
| Claude Code | **Sim** (plugin marketplace) | **Sim** (`ekson73/eko-claude-plugins` → `maos`) | `/plugin marketplace add` + `/plugin install` |
| OpenCode | **Sim** (plugins npm) | **Sim** via MAOS (`packaging/opencode-maos`) | `npx skills add … -a opencode` + thin plugin |
| Pi | **Sim** (pi packages) | **Sim** via MAOS (`package.json` pi.skills) | `pi install git:...` / `npx skills` |
| Codex CLI | **Não** (Skills + MCP, sem Claude MP) | **Não** — docs via `npx skills add` | `npx skills add … -a codex` |
| Gemini CLI | **Parcial** (Extensions Google-owned) | **Não** | `npx skills add … -a gemini-cli` |
| Antigravity | **Não** (sibling de Gemini) | **Não** | `npx skills add … -a '*'` |
| VS Code Marketplace | **Sim** mas é **editor extensions** (VSIX/Open VSX), não agent pack index | **Não** | — |
| GH Copilot | **Sim** mas é skills/custom agents via skills.sh bridge, não eko mall | **Não** | `npx skills add … -a github-copilot` |
| AWS Kiro | **Não** (IDE + Open VSX, mas eko ≠ publisher) | **Não** | `npx skills add … -a kiro` |
| Kiro Crew | **Não** (feature de Kiro) | **Não** | mesmo de Kiro |
| Warp | **Thin** (3p pack mall, mas fino) | **Não** | `npx skills add … -a '*'` |
| Grok | **Não** (model) | **Não** | — |
| Muse | **Não** | **Não** | — |
| DeepSeek harness | **Não** (harness Go, mas provider de modelo) | **Não** | `npx skills add … -a '*'` via opencode/pi que já suporta DeepSeek |

## 3. Cálculo honesto — o que faz sentido criar/atualizar/expandir

### Faz sentido (manter `ready`)
- **Claude, OpenCode, Pi** — `ready` já, são os 3 com install real funcionando hoje. **Nenhum novo `ready` a criar** neste ciclo. Manter `registry/catalog.json` truthful + `hosts/{claude,opencode,pi}/README.md` + MAOS packaging (`packaging/opencode-maos`, `package.json` pi.skills).

### Faz sentido (manter `docs` — ponteiro skills, não novo marketplace)
- **Codex, Gemini/Antigravity, GH Copilot, Kiro, Warp, DeepSeek (via skills)** — todos já `docs` com `npx skills add`. Expandir significaria publicar extensão nativa Google/Open VSX — **não faz sentido como eko**: seria produto MAOS, não índice, e exigiria GO explícito + manutenção contínua. Manter docs é honesto e de baixo custo. Atualizar `MULTI-HARNESS-COMPAT.md` install matrix já cobre.
- **deepseek-harness** específico: não criar `hosts/deepseek/` como marketplace; DeepSeek é **modelo**, não harness com registry 3p. Usuário já usa DeepSeek via `opencode` (75+ providers) ou `pi` — documentar isso, não criar novo host.

### Não faz sentido
- **VS Code Marketplace (como eko marketplace), ChatGPT store, Grok, Muse** — `n/a` correto. São stores controladas (OpenAI/MS) ou sem pack system (Grok/Muse). Tentar `ready` seria mentira e violaria `anti-theater`.
- **Novo host `warp-terminal` separado de `warp`** — é o mesmo produto (Warp Terminal). Não criar host duplicado.
- **Novo host `grok` ou `muse`** — não são harness de código com marketplace; são modelos. Criar entry seria `never` do HOST-MATRIX.

### Separação de domínios (eko vs maos) — lembrar

| Fazer em `eko-claude-plugins` (INDEX) | Fazer em `multi-agent-os` (PRODUCT) |
|---|---|
| `registry/catalog.json` + `hosts/*/README.md` + `docs/MULTI-HARNESS-COMPAT.md` (ponteiros) | `skills/` 84 skills, `packaging/opencode-maos`, `package.json` pi.skills, `hosts` nativos se houver GO |
| Nunca criar `skills/` em eko | Nunca publicar marketplace em maos |

## 4. Plano — o que atualizar neste PR vs deferir

**Neste PR (P0-P2b, baixo risco, honesto):**
- [x] Verificar `last30days` + web search 2026-08-17 — nenhum novo marketplace maduro além dos 3 `ready`
- [ ] Bump doc `docs/HOST-MATRIX-2026-08.md` — atualizar sinais de versão (OpenCode 1.18.x, Pi 0.84.1, Codex Skills docs já linkados) + nota `deepseek-harness` como `n/a (model)` para não inventar host
- [ ] Sincronizar `docs/MULTI-HARNESS-COMPAT.md` se divergir (já cobre Warp/Kiro/Gemini)
- [ ] `registry/catalog.json` — manter `ready` só Claude/Pi/OpenCode, `docs` para Codex/Gemini/Kiro/Warp, `n/a` para Grok/Muse/VS Code/ChatGPT/deepseek — **sem novo entry `deepseek-harness`**

**Deferir (precisa GO explícito, não é deste loop):**
- Publicar extensão Gemini ou Open VSX maos (produto, não índice)
- Criar host nativo `deepseek-reasonix` em eko (modelo, não marketplace)

**Never:**
- Transformar eko em VS Code/Grok marketplace

## 5. Veredicto council (honesto, imparcial)

> Após expandir para 14 harnesses nominados (claude, opencode, pi-agent, codex, chatgpt, gemini, antigravity, vscode, copilot, kiro, kiro-crew, grok, muse, warp, deepseek-harness), **manter o status quo de `ready` (3) vs `docs` (6) vs `n/a` (5) é o honesto**. Nenhum novo `ready` é justificável hoje — todos os `docs` já têm ponteiro `npx skills` funcional, e os `n/a` não têm registry 3p onde eko deveria publicar. A honestidade é manter `catalog.json` truthful, não inflar.

