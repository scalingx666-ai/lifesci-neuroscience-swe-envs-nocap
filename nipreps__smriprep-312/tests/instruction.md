# Issue

**Title:** FIX: Expand surfaces pattern to allow morphometrics

## Description

Forgotten piece of #305 - necessary for anatomical derivatives (at present)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af27c28853d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.