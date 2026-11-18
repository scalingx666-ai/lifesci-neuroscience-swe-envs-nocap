# Issue

**Title:** docs(app-payments): full API docs + IAP guide; bump to 0.3.0

## Description

Release-prep for an `app-payments` publish that includes `getCatalog`. Acts on doc-drift feedback: the front-door docs lagged the real exported API and the new demo.

## Why
- The npm README documented **only `requestPurchase`** — `hasItem`, `getOwnedItems`, and `getCatalog` (all exported in `src/client.ts`) were invisible, along with the entire ownership-gating pattern.
- IAP was missing from the guide set, `example-apps.md` cross-links, and the root README.
- The README's "Security model" bullet implied enforced buy-once, contradicting the appstore `IAP_SDK_INTEGRATION.md` (server accumulates rows; only `(userId, requestId)` is idempotent).
- npm `0.2.0` predates `getCatalog` and can't be overwritten, so a version bump is required before publishing the feature.

## Changes
- **`packages/app-payments/README.md`** — full four-function surface; correct-flow block (catalog → gate on ownership → purchase → apply → persist); empty-`txHash` gotcha; the two `priceUsdc` conventions + a base-units→display formatter; host-support note for `#472` with a graceful-degradation snippet; error-code table; corrected security bullet.
- **`docs/guides/using-iap-in-a-browser-app.md`** (new) — mirrors the `using-rppg`/`using-eeg` guide shape. Linked from the guides index and `example-apps.md`.
- **Root `README.md`** — adds `app-payments` to the capability table and package list (it was absent entirely).
- **`package.json`** — `0.2.0` → `0.3.0`.

## Not in this PR (publish last, by design)
- The actual `npm publish` (needs 2FA — your call).
- Bumping the demo's esm.sh pin to `0.3.0` (one-liner, after publish; the demo feature-detects `getCatalog` so it works in the meantime).
- The appstore `IAP_SDK_INTEGRATION.md` §7 edit (different repo).

## Verified
- [x] `pnpm run build` clean; `pnpm test` green (27/27).
- [x] New/updated relative doc links resolve.
- [ ] Skim the rendered README/guide before publish.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19313e431b64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.