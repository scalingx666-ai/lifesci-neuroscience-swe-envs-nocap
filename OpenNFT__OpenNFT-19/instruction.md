# Issue

**Title:** Fix decode stdout/stderr

## Description

We are trying to detect encoding for stdout/stderr while installing Matlab engine for Python

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a5b656ffb53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.