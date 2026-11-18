# Issue

**Title:** [MRG] Use JSON for internal settings

## Description

- .
- Drop Python 3.3 support, because of a bug on travis with bytes, string, and encodings...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da1566492d41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.