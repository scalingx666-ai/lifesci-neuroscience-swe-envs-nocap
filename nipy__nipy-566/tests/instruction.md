# Issue

**Title:** RF: nibabel.onetime.auto_attr -> functools.cached_property

## Description

Nipy has a minimum Python of 3.8, so we can use the stdlib `functools.cached_property`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adca4d10c07a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.