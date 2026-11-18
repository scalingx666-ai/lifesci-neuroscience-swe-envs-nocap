# Issue

**Title:** fix(runtime): pin pi-coding-agent 0.80.3 + Azure store:false reasoning-replay fix

## Description

## Summary

Pin the vendored `@earendil-works/pi-coding-agent` to the latest **0.80.3** and re-establish the Azure OpenAI Responses `store:false` reasoning-replay fix. The bug survives the upstream `providers/`→`api/` refactor, so the version bump alone does not fix it — the patch is re-applied provider-scoped via an idempotent postinstall.

## Related Issues

Upstream: filed **earendil-works/pi#6409** (refs the closed-by-refactor #4272 and its unmerged fix PR #4256).

## Changes

- **Pin** `packages/runtime/package.json` → `@earendil-works/pi-coding-agent` exact `0.80.3` (was `^0.79.0`).
- **Replace `patch-package` with `scripts/patch-pi-ai.cjs`** (idempotent postinstall). 0.80.3 installs **workspace-local** (nested under `packages/runtime/node_modules/...` via pi's bundled `npm-shrinkwrap`), where patch-package cannot resolve the package; the script locates the converter wherever npm places it (`dist/api` or `dist/providers`, hoisted or nested), is a no-op if already patched, and **throws on upstream pattern drift** so a future pi bump can't silently ship the bug back.
- **Fix**, scoped to `api === "azure-openai-responses"` only: drop reasoning items with no `encrypted_content` (a bare `rs_` id 400s under `store:false`) and strip `rs_`/`fc_` server ids from replayed items. `openai` / `openai-codex` / `opencode` Responses paths are untouched.
- `package.json`: `postinstall` → `node scripts/patch-pi-ai.cjs`; drop `patch-package` devDep.
- `docker/main/Dockerfile` + `docker/sandbox/Dockerfile`: `COPY scripts` (was `COPY patches`); removed the now-stale `patches/` dir.
- `packages/runtime/src/__tests__/azure-responses-reasoning-id.test.ts`: rewritten for the 0.80.3 dist layout + a drop-when-no-`encrypted_content` case (4 tests).

## Type of Change

- [x] Bug fix (non-breaking change that fixes an issue)
- [x] CI/CD or build changes

## Verification

### How to test

1. `rm -rf node_modules && npm ci` — postinstall applies the fix (marker present; idempotent on re-run).
2. `npx vitest run packages/runtime/src/__tests__/azure-responses-reasoning-id.test.ts` — 4/4.
3. `npm run typecheck` and `BP_MOCK=1 npx vitest run`.

### What you personally verified

- `npm ci` (the Docker/CI path — no `--ignore-scripts`/`--omit=dev`) auto-applies the patch on a fresh install; the script is idempotent and errors on pattern drift.
- Regression test 4/4; full suite **694/694** (`BP_MOCK=1`); `npm run typecheck` clean.
- Confirmed by code inspection that the bug persists in 0.80.3 after the refactor (converter replays the `rs_` id; azure transport `store:false` with no `encrypted_content` backfill).
- **NOT verified against a live Azure endpoint** (no credentials available) — validated against the converter/transport source and the regression test, not a real network round-trip.

### Checks

- [x] `npm run typecheck` passes
- [x] `BP_MOCK=1 npx vitest run` passes
- [ ] Web build — n/a (no web changes)
- [x] Manually tested locally (`npm ci` + tests)
- [ ] Screenshots / recordings attached — n/a (no UI changes)

## Checklist

- [x] This PR is AI-assisted, and I have self-reviewed the generated code (see CONTRIBUTING.md)
- [x] My code follows the project's style
- [x] I have performed a self-review
- [ ] I have added/updated documentation as needed — n/a
- [x] My changes do not introduce new warnings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52fa34b5de93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.