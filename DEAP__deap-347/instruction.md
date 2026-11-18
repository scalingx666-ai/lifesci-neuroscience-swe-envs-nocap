# Issue

**Title:** chore & fix(deap/tools/emo.py:selTournamentDCD): check on value of k & throw ValueError for failed input validation

## Description

Now, if number of individuals to select(stored in parameter `k`) is not multiple of 4, it will throw. In addition, throw `ValueError` instead of generic `Exception` when input is invalid.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1a52b207589`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.