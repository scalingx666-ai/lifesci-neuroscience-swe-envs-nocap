# Issue

**Title:** Improved implementation of regularizers

## Description

Closes: 

Changes:
- Added a strength argument to custom regularisers.
- Rewrote the implementation of regularizers.
- Removed `StaticLossScalingFactorLayer`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccc8640706a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.