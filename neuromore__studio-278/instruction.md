# Issue

**Title:** Update Github CI Release Handling

## Description

* removes auto build trigger on release merge
* adds auto build trigger on tag creation

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f2ad06b21d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.