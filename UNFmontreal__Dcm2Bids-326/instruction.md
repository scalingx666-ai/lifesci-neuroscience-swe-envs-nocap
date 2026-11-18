# Issue

**Title:** [ENH] Add logging when dcm2niix skips dcm images

## Description

When dcm2niix skips some dcm images dcm2bids will issue a warning.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d29978cc7c48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.