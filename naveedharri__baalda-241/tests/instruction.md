# Issue

**Title:** Throttle failed sign-ins per account

## Description

- Failed email sign-ins are counted per lowercased email in Postgres (migration 036 `signin_throttle`), across all IPs and instances.
- After 5 failures in 15 minutes the account gets 429 + `Retry-After`; lockouts escalate 1 → 5 → 15 min. A success or password reset clears the count.
- Unknown and real emails get byte-identical responses.
- Desktop: the sign-in dialog shows "Too many attempts. Try again in …, or reset your password." with a live countdown and keeps Sign in disabled until it passes.

Tests: server `signin-throttle` + `auth` (9 passed), desktop `signinThrottle` (3 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f27871a21bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.