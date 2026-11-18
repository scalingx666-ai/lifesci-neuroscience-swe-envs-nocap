# Issue

**Title:** Fix tests

## Description

- Remove some unnecessary `pytest` options that were causing a deprecation warning
- Update import following refactoring of `brainglobe-napari-io`
- Remove import from `brainglobe-segmentation` following refactoring

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `281abb30f921`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.