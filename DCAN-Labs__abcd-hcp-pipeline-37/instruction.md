# Issue

**Title:** Update Dockerfile

## Description

replace deprecated PGP keyservers

update dcan_bold_proc to 4.0.6 (previous hotfix branch was merged, no longer exists)

update workbench to 1.5.0 (1.4.2 link no longer works)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed7941ce7229`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.