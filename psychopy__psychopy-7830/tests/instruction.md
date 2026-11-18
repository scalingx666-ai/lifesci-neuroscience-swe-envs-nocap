# Issue

**Title:** fix: incorrect time base for PTB used

## Description

Cherry-pick the PTB microphone clock source bugfix from release

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8137bccc6e58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.