# Issue

**Title:** perf(join_close_components): quadratic->linearithmic algorithm

## Description

Major improvement in speed and memory usage. Going from a quadratic in time and space algorithm to vastly reduced redundant calculation + use of a linearithmic kdtree datastructure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca63cce73948`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.