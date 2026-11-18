# Issue

**Title:** Updates for CLIP text

## Description

- Update `train_combined.py` for e2e training on CLIP text.
- Update sampling utils to handle averaging across CLIP text and image vectors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dc2ef587ef6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.