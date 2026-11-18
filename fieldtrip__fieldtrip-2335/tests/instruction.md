# Issue

**Title:** FIX: t-value to p-value conversion in ft_regressconfound

## Description

The t-value to p-value conversion was missing an absolute operation, as also suggested here:
https://www.mathworks.com/matlabcentral/answers/175091-how-to-calculate-2-tailed-p-value-using-t-value-and-degree-of-freedom

Thanks to Ben Graul (Dartmouth College) for spotting the issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6441a1b7f71f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.