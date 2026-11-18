# Issue

**Title:** added check for bootstrap to improve numeric behavior

## Description

This change is inspired by the fact that if the number of units is low, a bootstrap sample with very few unique units that computes a test statistic that depends on a measure of variance in the denominator (e.g. T-statistic) will become unstable numerically.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9009e0d718c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.