# Issue

**Title:** [MNT] - Minor updates from linting

## Description

Small set of code updates from running linting. 

Main changes:
- Errors that are raised from an exception are now 'raised from' (https://stackoverflow.com/questions/24752395/python-raise-from-usage)
- some list comprehensions switched to be generator comprehension (https://stackoverflow.com/questions/47789/generator-expressions-vs-list-comprehensions)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9422808b078`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.