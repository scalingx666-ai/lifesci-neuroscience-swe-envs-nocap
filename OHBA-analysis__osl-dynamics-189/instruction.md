# Issue

**Title:** SE-HMM (Baum-welch using float64)

## Description

Use float64 for the baum-welch algorithm.

The default float32 is not accurate enough for the iterative baum-welch algorithm in SE-HMM and now the computation is all done in double precision for better numerical stability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4cb5e23745e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.