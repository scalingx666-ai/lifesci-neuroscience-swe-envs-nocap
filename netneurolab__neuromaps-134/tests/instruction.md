# Issue

**Title:** [FIX] Fix doc load_data

## Description

It seems error messages have changed, making the try-except catches invalid. 

Although not sure about if it would cause backward incompatibility, but for sufficiently new Python version it should be generally okay I guess?

We should probably refactor these in the future though.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75863dfed81d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.