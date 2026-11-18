# Issue

**Title:** ENH: allow install step from the build root

## Description

No longer need to cd to ANTS-build (though that still works)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b53aad349e67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.