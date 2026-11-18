# Issue

**Title:** Release 0.1.88: Dependabot security updates

## Description

Bumps nodemailer (10.2.1), vitest (4.1.12), dompurify floor (3.4.17), undici (7.30.1) and zod (4.6.7) to close all 12 open Dependabot alerts. Silent release 0.1.88.

Checks: server tsc clean, server email tests pass, desktop vitest 3596 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ef2d2773dd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.