# Issue

**Title:** stricter check in shortlink creation

## Description

Adding the suffix there prevents creating shortlinks with domains that just startWith ours but do not fully match.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `940d98fcf04d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.