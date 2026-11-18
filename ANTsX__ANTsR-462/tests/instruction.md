# Issue

**Title:** BUG: preserve B-spline displacement weights and label registration me…

## Description

…trics

Only initialize uniform displacement weights when none are supplied. Retain label metrics when initialTransforms is NULL and handle transform file lists and vectors.

Add regression tests for weighted fitting, initial transform handling, and label-only registration.

Port ANTsPy  and  to ANTsR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `457095b1408e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.