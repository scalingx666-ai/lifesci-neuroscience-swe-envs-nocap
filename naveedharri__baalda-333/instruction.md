# Issue

**Title:** fix(desktop): prevent tab context menu clipping

## Description

## What does this PR do?

Fix the invisible context menu when right-clicking an open document tab. The menu was rendered inside `.tab-strip`, whose fade mask clips the menu below the tab row even though it uses fixed positioning.

Render the existing menu into `document.body` with `createPortal` so it escapes the mask. Keep the existing viewport placement, close actions, and dismissal handlers unchanged.

### Validation

- `pnpm exec vitest run src/__tests__/tabStore.test.ts src/lib/menuPlacement.test.ts` — 28 tests passed.
- `pnpm exec tsc --noEmit` — passed.
- `TAURI_ENV_PLATFORM=windows pnpm run build` — passed (frontend build, not a native Windows build).
- Browser simulator: macOS and Windows layouts, light/dark themes, 1600×1000 and 720×600 viewports, sidebar shown/hidden — all 16 combinations passed placement, pointer hit-testing, font/theme inheritance, repeated right-click, disabled-action, outside-click, and blur checks.
- Verified all four close actions, settings overlay ordering, and portal cleanup when leaving the vault screen.
- The fix was also confirmed in the native macOS development app. Native Windows behavior was not tested.

## Related issue

None. This is a small, localized UI bug fix; no architecture or protocol changes.

## Checklist

- [x] Issue discussion: not applicable to this small bug fix.
- [x] Relevant existing tests pass locally.
- [ ] Added or updated automated tests. Existing suites and separate browser regression checks were used; no repository test files were added.
- [x] SPDX headers: no new source files.
- [x] No secrets, credentials, or `.env` files are committed.
- [x] Core invariants are preserved: doc_id identity, binary-only wire, `.context/`, and debounce timings are unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e69a99669533`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.