# Issue

**Title:** [FIX] fix nilearn interface update for fetch_single_file

## Description

Thanks to #185 for raising this issue.

The breaking change comes from nilearn/nilearn#4725, and first appears in [0.11.0](https://github.com/nilearn/nilearn/releases/tag/0.11.0).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3770570d235a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.