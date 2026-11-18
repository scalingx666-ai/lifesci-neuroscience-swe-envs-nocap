# Issue

**Title:** Change `x = x + y` to `x += y`

## Description

Most of the source code uses the latter construct. Standardise on that latter construct for consistency and hence "least astonishment".

When strings are involved, modernise interpolation using f-strings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c0ee3ee75a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.