# Issue

**Title:** Replace 3.7 with 3.8 in ASV, contributing docs, and matrix for GitHub CI

## Description

which was already partially done in other PRs (for appveyor). This one should drop from other CIs and docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edc8e3f8fb1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.