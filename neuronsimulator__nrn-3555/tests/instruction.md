# Issue

**Title:** Better concurrency for wheels CI

## Description

Apparently the job is not cancelled if one pushes additional changes, which is a huge bottleneck in the CI speed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d1e2f1f6948`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.