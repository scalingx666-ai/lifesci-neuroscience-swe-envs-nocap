# Issue

**Title:** fix(web): add return-home entry to sidebar for hosted subpath deploys

## Description

## Problem

In multi-user hosted deployments (`VITE_LOCAL_MODE=0`), `@brainpilot/web` is mounted under a subpath (e.g. `/app`) while the marketing/home page lives at the site root `/`. Once inside `/app`, the UI offered **no way back** — no logo link, no "return home" button — so users had to hand-edit the address bar or hit the browser back button. Single-user local mode (`brainpilot up`) never needed this, so it was never designed.

## Fix

Add a **"return home"** link to the sidebar footer (next to Settings), shown **only when `runtimeConfig.localMode === false`** so single-user local mode is left untouched.

- New env **`VITE_HOME_URL`** (default `"/"`) makes the target configurable, mirroring the existing `BP_WEB_BASE` precedent — hosts can point it at their own landing/account page. The absolute default `/` correctly resolves to the site root even when the app is mounted at `/app` (decoupled from `BP_WEB_BASE`, which only affects the asset base).
- Rendered as a real `<a href>` (not a `<button>`) because it navigates away from the SPA — preserves middle-click / open-in-new-tab / copy-link affordances. Other nav items stay buttons since they trigger in-app actions.

## Changes

| File | Change |
|---|---|
| `packages/web/src/config.ts` | add `runtimeConfig.homeUrl` from `VITE_HOME_URL` (default `/`) |
| `packages/web/src/components/sidebar/Sidebar.tsx` | footer home link + `Home` icon, gated on `!localMode` |
| `packages/web/src/i18n/messages/sidebar.ts` | `sidebar.home` (zh: 返回主页 / en: Home) |
| `packages/web/src/__tests__/sidebarHomeLink.test.tsx` | new — link present in hosted mode, absent in local mode |

## Verification

- `npm test` (packages/web): **172 passed** (22 files), incl. the new test (written test-first, watched it fail RED → pass GREEN).
- `npm run build` (packages/web): `tsc -b` typecheck clean + `vite build` succeeds.

No new dependencies; ~16 lines of production code across 3 files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e30503f7ef2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.