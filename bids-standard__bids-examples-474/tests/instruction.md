# Issue

**Title:** ci: Test on both main and dev validator branches

## Description

The bids-validator is going to start diverging its `main` and `dev` branches. The idea with `main` is to continue to target the latest BIDS release, while `dev` will include changes proposed for upcoming releases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d549036dad8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.