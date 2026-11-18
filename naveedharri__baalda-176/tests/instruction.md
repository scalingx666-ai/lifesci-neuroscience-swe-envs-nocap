# Issue

**Title:** Explain when attachment sync requires Pro

## Description

Free-vault attachment sync refusals previously produced only a transient toast and cleared file sync states. Users could later open an attachment without understanding why it had not synced.

Keep the server-confirmed Pro restriction visible in local attachment previews and Vault Health, with a Billing upgrade link. Affected attachment headers show Local only. Local previews and note syncing remain available. State is scoped to the vault, clears on switching, and rechecks after a confirmed upgrade; grandfathered accounts and billing-disabled servers retain their existing entitlements.

Validation: 2,160 desktop tests passed (12 skipped), 80 focused tests passed, and TypeScript/Vite production build passed. The billing suite passed 37 tests against a fresh disposable Postgres container, including Pro lifecycle and billing-disabled attachment entitlements. Added lifecycle and notice regressions. Verification was automated and code-level; no live two-device mixed-folder session was performed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3649ad5219c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.