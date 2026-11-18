# Issue

**Title:** ENH: identity init transform for (bspline)syn-only

## Description

If using -t so or -t bo, the COM initialization is usually not wanted

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f512437c442`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.