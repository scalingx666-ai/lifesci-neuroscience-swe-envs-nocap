# Issue

**Title:** FIX: invert result of skull-strip check in auto mode

## Description

By default, skull-stripping was conditional on a check whose logic was reversed in 0.13.1 (that is, run when all T1w images have had skulls stripped). This fixes the inversion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e460f6d04336`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.