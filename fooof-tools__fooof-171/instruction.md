# Issue

**Title:** [FIX] Bounds incorrect in _drop_peak_overlap.

## Description

So far, the CF of one peak had been compared to the lower bound of the next gaussian. This PR fixes this so that the upper bound of one guassian is compared to the lower bound of the next. This may require adjustment to `_gauss_overlap_thresh`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f5864ac9bba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.