# Issue

**Title:** BUG: Repair 4D time-series template construction workflow

## Description

While working on other issues, Codex found that if given absolute paths, running the 4D time series loop could delete its input files.

This fixes that issue and other bugs

- time series bins are sampled correctly
- the sampling logic had problems, especially for shorter (< 32 volumes) input

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5960744cb707`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.