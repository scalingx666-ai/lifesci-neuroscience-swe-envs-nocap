# Issue

**Title:** Add a few enhancements to morphometry plotting

## Description

- Allow for a custom colormap
- Allow for custom min/max
- Plot bivariate measures (curv and sulc) with the midpoint at 0
- Compute the min and max of the colormap robustly
- Allow morphometry colorbar to be optional

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b27896e1b2a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.