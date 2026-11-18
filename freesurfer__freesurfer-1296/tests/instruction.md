# Issue

**Title:** fix #1294: check if output matrix is large enough to hold a copy

## Description

also initialize it to zero just in case it's larger than input matrix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c338108cd06a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.