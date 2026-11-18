# Issue

**Title:** Refact: Baum-welch in log scale.

## Description

The baum-welch algorithim is numerically unstable in float32. Turning all the calculation in log scale greatly improves the numerical stability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e453c6c01221`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.