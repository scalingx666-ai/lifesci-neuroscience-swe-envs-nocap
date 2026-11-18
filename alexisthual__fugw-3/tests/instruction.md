# Issue

**Title:** Feature/csr layout for sparse

## Description

Uses Compressed Sparse Row format for `mm` and `dc` solvers, resulting in much faster implementation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff4a2eff67b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.