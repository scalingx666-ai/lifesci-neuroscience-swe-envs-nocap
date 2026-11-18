# Issue

**Title:** Fix/xyz.character nas

## Description

@alexanderbates this is an important fix that could affect your spreadsheet updates. Specifically `xyzmatrix.character()` was previously silently dropping rows with no/bad values. If these results were then used to calculate e.g. new ids in another column without checking the number of replacement values, they would end up misaligned.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0efa75bd0685`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.