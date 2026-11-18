# Issue

**Title:** feat(kb): OCR provider abstraction, live-progress SSE, spawn-log secret hygiene

## Description

## Summary

Three tightly-coupled fixes to the KnowledgeBase pipeline that came out of a Windows / non-CN smoke test. Together they make the KB panel usable end-to-end for international users, fix a live API-key leak, and eliminate a real-time-progress race that forced users to refresh the page after clicking **Build**.

### 1. `imgs/*` and `.DS_Store` broke `snapshot_download` on hf-mirror.com
`BAAI/bge-m3` ships stray macOS `.DS_Store` files under `imgs/`. hf-mirror.com returns **403 Forbidden** on those. `snapshot_download` is all-or-nothing, so one 403 on a non-essential asset aborted the whole 2 GB weight pull. Added them to `ignore_patterns`.

### 2. Byte-level model-download progress
`setup_models.py` previously emitted one `progress` event per repo (2 events total for the whole 2.5 GB pull). Now hooks its own `tqdm_class` into `snapshot_download` and translates every chunk update into throttled NDJSON events (max ~2/s, or on 1% ticks) with `downloaded_bytes / total_bytes / speed_bps / eta_sec / current_file`. Existing frontend deriver keys off the same `percent` field, so the bar picks up the granularity with **zero UI changes**.

### 3. Vectorize stage: fine-grained progress
`vectorize.py` only emitted `progress` every `PRINT_EVERY=500` chunks. A small KB (a few hundred chunks) went from 0% → 100% without moving the bar. Added a 0.5s heartbeat + a synthetic `0%` at start so the bar leaves "pending grey" before the first (slow, on CPU) batch lands.

### 4. OCR provider abstraction (SiliconFlow → any OpenAI-compatible endpoint)
`ocr_pdfs.py` was hardcoded to `api.siliconflow.cn` + `deepseek-ai/DeepSeek-OCR`. International users without a SiliconFlow account had to fork the script. Now:

- New `--preset` (siliconflow | openai | anthropic | mistral | zhipu | qwen | custom) + `--base-url` + `--model` + `--prompt` + `--api-key` flags
- Each field resolves independently: **CLI > provider-specific env var** (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, …) **> generic `OCR_API_KEY` > `API_config.json` > preset default**
- Presets ship sane per-provider default prompts (DeepSeek-OCR keeps its grounding tokens; generic vision models get a plain "transcribe as markdown" instruction)
- Backend `KbApiConfig` extended; legacy `{siliconflow: {API_KEY}}` shape still read + mirrored on write for CLI/UI mixed-version safety
- New UI: provider dropdown + base URL / model inputs + collapsed "advanced: custom prompt" field; no silent default — new users pick a provider explicitly

### 5. 🔒 Spawn-log secret hygiene (**security fix**)
`spawned <argv...>` was broadcast as an SSE event with `--ocr-api-key sk-...` / `--meta-api-key sk-...` values **in cleartext** — visible to any SSE subscriber, cached in `recentEvents`, rendered into the KB panel's log DOM, captured in every log screenshot.

Two defences:
- API keys now ride in `buildChildEnv()` via `OCR_API_KEY` / `META_LLM_API_KEY` env vars (Python resolvers already recognise these). Bonus: keys no longer visible in `ps` / Task Manager either.
- `redactArgvForLog()` masks any flag matching `/key|token|secret|password/i` to `***{last4}` as a backstop for future contributors.

### 6. Persistent SSE across build starts/stops (the "have to refresh" bug)
Old flow: panel mounts → `/kb/status.active=false` → no SSE. User clicks Build → `openSse()` → backend sees no active build → sends `idle` and **closes** the connection → frontend closes too. Real spawn starts a moment later, events flow into a bus with **no listener**. User refreshes to see progress.

Fix: SSE stream stays open across build starts/stops. `idle` becomes a non-terminal marker; panel opens SSE unconditionally on mount, closes on unmount. Cleanup wired to both `ReadableStream.cancel()` and the Request abort signal, idempotent via a `closed` flag.

## Test plan

- ✅ `npm run build -w packages/backend-core` — clean
- ✅ `npm run build -w packages/web` — clean
- ✅ Unit test of `redactArgvForLog`: `--ocr-api-key sk-uupnsyabcxyz` → `--ocr-api-key ***cxyz`, `--meta-api-key=sk-yCSw...` → `--meta-api-key=***alue`, non-secret flags untouched
- ✅ Unit test of `resolve_ocr_config`: default preset falls through to siliconflow; env override switches to openai; CLI flag beats env
- ✅ End-to-end SSE race repro (`curl -sN /api/kb/events` first, then `POST /api/kb/build`): confirmed events flow through the pre-existing connection
- ✅ End-to-end SiliconFlow build with 2 PDFs (177 chunks, ok=2 fail=0)

## Files touched (10)

- `KnowledgeBase/scripts/{setup_models,ocr_pdfs,build_kb,vectorize}.py`
- `packages/backend-core/src/{app,config,kb-builder}.ts`
- `packages/web/src/components/settings/KnowledgeBasePanel.tsx`
- `packages/web/src/utils/api.ts`
- `packages/web/src/i18n/messages/settings.ts` (17 new keys × 2 languages)

## Non-changes / caveats

- `docs/` Next.js build has an **unrelated** Windows lightningcss native-binary issue; not part of this PR
- Windows `_common.py` emit output shows `��` for `→` / `…` in cmd (GBK codepage); NDJSON mode with `ensure_ascii=False` is unaffected — separate polish

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4595545d897`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.