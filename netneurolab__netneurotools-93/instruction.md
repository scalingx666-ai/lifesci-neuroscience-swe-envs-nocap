# Issue

**Title:** [ENH] Allows spins with only one hemisphere

## Description

.

Title is relatively self-explanatory, but now you can provide coordinates for a single hemisphere and `netneurotools.stats.gen_spinsamples()` doesn't fail. Tests are updated to match.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fb4f78e11ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.