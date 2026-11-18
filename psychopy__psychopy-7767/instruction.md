# Issue

**Title:** BF: Update ptb speaker creation to work in Python 3.11

## Description

Was failing due to numpy's stricter rules in newer versions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d741d9d7ab45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.