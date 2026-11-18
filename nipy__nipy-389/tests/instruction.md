# Issue

**Title:** RF+TST: refactor design stacking for generality

## Description

Allow stacking empty designs, designs that are just arrays.  This makes
fits what the docstring describes, and is a little easier to use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc95f66b3994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.