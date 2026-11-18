# Issue

**Title:** redesign(BREAKING): auto-detect C or F order unless specified

## Description

Previously, we just defaulted to interpreting the array in C order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2809d200e40f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.