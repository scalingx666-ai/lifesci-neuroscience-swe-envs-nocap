# Issue

**Title:** fix(designmatrix): drop every duplicate of a kept column in clean

## Description

.

`_clean` required the source column to be absent from `keep` before dropping a candidate, so after the first drop the source stopped dropping its other duplicates. v0.5.1 checked only the candidate. The clause is removed and one test pins the three-column case; a pre-existing test's "uncorrelated" column was a perfect negative correlation and is corrected.

Checks: `uv run poe ok` (1001 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12fcb1326ffe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.