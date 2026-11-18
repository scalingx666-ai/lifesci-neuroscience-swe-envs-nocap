# Issue

**Title:** Fix all open Dependabot security alerts

## Description

Resolves all 40 open Dependabot alerts by bumping 10 packages to patched versions. No source code changes.

| Package | Before | After | Alerts |
|---|---|---|---|
| nodemailer | 7.0.13 | 9.1.1 | 20 |
| hono | 4.12.30 | 4.13.8 | 7 |
| undici (via jsdom) | 7.28.0 | 7.29.1 | 5 |
| browserslist | 4.28.6 | 4.29.0 | 2 |
| vitest / @vitest/mocker | 4.1.10 | 4.1.11 | 2 |
| @dicebear/initials | 9.4.2 | 9.4.3 | 1 |
| nanoid | 3.3.16 | 3.3.19 | 1 |
| postcss | 8.5.18 | 8.5.28 | 1 |
| baseline-browser-mapping | 2.10.43 | 2.11.25 | 1 |

Manifest changes: `hono`, `nodemailer`, `@types/nodemailer` (server), `@dicebear/collection` (desktop), `vitest` catalog entry. Everything else is a lockfile refresh within existing ranges — no overrides.

**nodemailer 7 → 9 (major):** reviewed the 8.0 and 9.0 breaking changes (`NoAuth` → `ENOAUTH` error code; TLS validation for remote content/OAuth2 fetches). Our only use is `createTransport(smtpUrl)` + `sendMail({from,to,subject,text,html})` in `src/email/mailer.ts`, which neither change touches.

## Verification
- Desktop: typecheck ✅, `vite build` ✅, tests 2360 passed / 12 skipped — identical to baseline
- Server: typecheck ✅, tests 952 passed / 9 skipped against a scratch DB, housekeeper 29/29
- 3 `blob-text` tests fail locally only when Polar billing env vars are set; they fail identically on unmodified `staging` and pass with billing unset (pre-existing, unrelated)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2f23c8458c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.