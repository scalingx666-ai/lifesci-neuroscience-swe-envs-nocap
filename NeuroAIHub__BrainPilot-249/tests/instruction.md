# Issue

**Title:** feat(kb): panel completeness probes, per-stage warnings, inventory card, mirror/token controls

## Description

Six related enhancements to the KnowledgeBase panel, all surfacing state the pipeline was already producing but the UI wasn't reading. All backed by env-var-only credential passing (no argv leaks to `ps`) and covered by the existing test suites.

## Summary

| # | Area | What changed |
|---|------|--------------|
| 1 | Env completeness probe | Real `import` probe + model-weight check + 4-item checklist |
| 2 | Standalone model download button | With optional HF token (auth'd = ~5× throughput) |
| 3 | China pip mirror opt-in | Tsinghua tuna, `PIP_INDEX_URL` via env |
| 4 | HF mirror + token grouped UI | Mirror on → token disabled with explanation |
| 5 | Per-stage warning badges | ⚠ instead of ✓ when done event carries fail/fallback counts |
| 6 | KB inventory card | 4-stage disk consistency check + tail-scan for 1.5 GB chunks.json |

## 1. Environment completeness probe

- **backend-core/src/kb-builder.ts**: extend `describeKbEnvironment` with a real deps probe (`spawnSync` a venv-python `import` snippet mirroring `scripts/setup_env.py::REQUIRED_IMPORTS`) and a model-weight completeness check (same `config.json` + weight-file gate as `scripts/setup_models.py`). Cached 60 s per venv-python (mtime-invalidated); auto-cleared when `setup-env` / `setup-models` finish. New `POST /kb/probe` forces a refresh.
- **KB panel**: replaces "just venv exists?" with a 4-item green/red checklist (venv / deps / models / PDFs), a "sampled Xs ago" clock, and a Re-check button. Build button disables until all four are green.

## 2. Standalone "download models" button + HF token support

- **setup_models.py**: `--hf-token` flag (falls back to `HF_TOKEN` / `HUGGING_FACE_HUB_TOKEN` env). Passed to `snapshot_download` for authenticated downloads (~5× throughput on the ~2.5 GB weights). Only the last 4 chars are logged; full token never hits the event stream or `~/brainpilot/logs/`.
- **kb-builder.ts / app.ts**: `startKbModelSetup` / `startKbFullSetup` accept `hfToken`; injected via child env (**NOT argv**) so `ps` can't leak it.
- **KB panel**: new "Download model weights" button next to Reinstall venv, idempotent (HF Hub resumes; already-complete repo is skipped in seconds).

## 3. China pip mirror opt-in

- **setup_env.py**: `--pip-index-url` flag / `PIP_INDEX_URL` env. Applied to BOTH pip install calls (upgrade + requirements). Logs the mirror URL so the operator can confirm which index they hit.
- **kb-builder.ts**: `startKbEnvSetup` / `startKbFullSetup` accept `pipIndexUrl`; env-var delivery (same argv-immunity rationale as HF token — future tokenised corporate mirrors just work).
- **KB panel**: "Use China pip mirror (Tsinghua tuna)" checkbox, hardcoded to `https://pypi.tuna.tsinghua.edu.cn/simple`.

## 4. HF source group + mirror-vs-token clarification

- Merged the HF mirror checkbox and the HF token input into one bordered `HfSourceGroup` fieldset (they previously lived in different sections of the panel).
- When the mirror is checked, the token input is **disabled** with a hint explaining that hf-mirror.com is an anonymous reverse proxy that ignores `Authorization` headers, so the token has no effect. Prevents users wasting a key.
- Removed the duplicate "HF mirror" checkbox that previously sat in the build-config section.

## 5. Per-stage warning badges (yellow ⚠ instead of green ✓)

- `StageState` gains `status="warning"` and an `issues[]` list.
- `deriveDoneIssues` reads the numeric quality counters each stage already emits on its `done` event and translates any non-zero counter into an i18n warning line:

  | Stage | Trigger |
  |---|---|
  | `ocr` | `fail > 0` |
  | `extract` | `fallback > 0` or `empty > 0` |
  | `vectorize` | `fail > 0` |
  | `chunk` | accumulated `warn` events > 0 (no numeric counter available) |

- CSS: yellow progress fill + yellow ⚠ badge + inline issue list on the stage row.
- Also fixes an old `pushEvent` double-apply bug: the server SSE stream replays its buffer to every new subscriber, so opening the panel mid-build was applying each buffered event twice. New `lastAppliedTsRef` cursor drops the duplicates (previously masked because `progress → done` overwrite is idempotent, but our new warn accumulator would double-count).

## 6. On-disk KB inventory card

- New **backend-core/src/kb-inventory.ts** + `GET /kb/inventory` reads the four ledger files (`source/OCRed_pdf.json`, `source/KB_source.json`, `chunks/chunks.json`, `vectorstore/meta.json`) and returns aggregate counts + a consistency check.
- Handles multi-GB `chunks.json` via **tail-scan** for `total_chunks` (~20 ms on a 1.5 GB file vs ~11 s for `wc -l`).
- `detectIssues` suppresses downstream cascades: "5 new PDFs" doesn't also report "5 metadata missing / 5 chunks missing / 5 vectors missing" — only the first bottleneck is surfaced.
- **KB panel**: new `InventoryCard` component at the top of the tab. Green when all four stages agree; amber with an issue list otherwise. Auto-refreshes when a build completes.

## Security notes

- **HF token** stored only in React state (session-only, never persisted). Backend passes it to Python via env var — verified with `ps -eo pid,args` shows only `--kb-root ... --json`; token appears only in `/proc/<pid>/environ`.
- **`PIP_INDEX_URL`** delivered the same way (env var, not argv) so future tokenised corporate mirrors don't leak into the process list.
- Python side logs only the last 4 chars of the HF token (`using HF token (…abcd)`), never the full value.

## Tests

- **Backend workspace (backend-core / runtime / cli / protocol / client-cli)**: 673 tests pass on the branched-off `origin/development` base.
- **Web**: 170 tests pass.
- Standalone verification of `deriveDoneIssues` decision logic against 10 hand-crafted cases (clean OCR / dirty OCR / extract with fallback / extract with empty / vectorize with fail / chunk with warns / …) all classify correctly.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20b4b73d7887`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.