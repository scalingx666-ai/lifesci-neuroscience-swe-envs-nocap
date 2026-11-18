# Issue

**Title:** Handle the limit of p = 0 in p log2 p

## Description

This patch defines a helper function, _xlog2x(x), that calculates
x * log2(x) but handles the case x == 0 by returning 0 rather than nan.
This is needed if the power spectrum has any component that is exactly
zero: in particular, if the f = 0 component is zero.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfce4639d86c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.