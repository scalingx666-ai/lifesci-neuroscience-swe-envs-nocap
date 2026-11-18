# Issue

**Title:** Fix pathing problems

## Description

@alessandrofelder Noticed your test data wasn't being found because our `MANIFEST` is told to ignore the `tests` directory when packaging.

Changed the `tox` command and paths in the to-be regression tests to point to the repository clone, which should then resolve the paths correctly using the repo clone.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6295447eba6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.