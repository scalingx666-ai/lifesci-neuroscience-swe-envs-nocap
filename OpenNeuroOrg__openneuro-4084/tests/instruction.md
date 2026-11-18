# Issue

**Title:** fix(server): Resolve async issues with passport auth and raise errors on auth failure

## Description

Passport authentication could silently swallow errors during authentication and throw an unrelated error instead of passing the specific failure to the express error handler. Fixes the wrapped unhandled promise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40b8017f2323`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.