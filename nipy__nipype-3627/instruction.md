# Issue

**Title:** Adjusted variable names for clarity and codespell false positives

## Description

Codespell currently fails due to false positive detection of “inports”, which are input ports and not a misspelling of imports.
Also makes the code more clear I think.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ef9fe4f9ed8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.