# Issue

**Title:** ENH: Strip carriage returns from template input

## Description

CSV parsing problems like #1844 have happened before, removing the carriage return avoids the problem

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1ef76f9eaf9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.