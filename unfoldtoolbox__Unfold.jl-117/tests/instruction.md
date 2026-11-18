# Issue

**Title:** bugfix reshape + LMM

## Description

This PR does two things:
1. fixes the wrong data-size detection, e.g. size(data)=(3,100) + non-continuousTimeUnfoldModel would reshape it to (1,3,100)
2. enforces ordering of random effect terms, that is: `(1|B)+(1|A)` throws an error

- refactor reshaping, adressing #110
- adressing #110,starting for #115
- fixes also #33 by throwing an assertionError if unsorted ones are found
- fixes also #83

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00b671c60f42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.