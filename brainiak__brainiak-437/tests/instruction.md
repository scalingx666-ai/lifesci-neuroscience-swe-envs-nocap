# Issue

**Title:** Drift update

## Description

Update to how drift is calculated and used. The new default for drift drops off power on the basis functions systematically. Drift is also scaled separately from the brain noise since that scale is based on a detrended version of drift

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7c7b6e45b41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.