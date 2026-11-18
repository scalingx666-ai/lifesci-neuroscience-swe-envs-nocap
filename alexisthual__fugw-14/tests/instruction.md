# Issue

**Title:** Add L2 solver for FUGW

## Description

Add solver when all the divergences in FUGW are L2-squared (instead of KL)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a90f418029d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.