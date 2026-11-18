# Issue

**Title:** Fix/accelerate sparse barycenter

## Description

. Accelerates the computation of the barycenter by computing the sparsity mask only once during the whole process.

- [x] Modified/created docstrings
- [x] Added new testing cases

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1063cd6c43c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.