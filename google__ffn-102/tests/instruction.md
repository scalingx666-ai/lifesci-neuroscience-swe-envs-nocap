# Issue

**Title:** Terminate seed generation early to avoid OOMs in peak_local_max.

## Description

Terminate seed generation early to avoid OOMs in peak_local_max.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77edcd5ed9c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.