# Issue

**Title:** [ENH] remove checks for participants.tsv or samples.tsv in derivatives

## Description

- do not copy participants.tsv to derivativates
- no warning for missing participants.tsv or samples.tsv in derivatives

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a99571734200`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.