# Issue

**Title:** Merge pull request #235 from m-beau/master

## Description

- Changed feature extraction completely
- Added a datasets.py file for the custom dataset used for cell types classification
- Minor changes to h5.py, including a "selective_overwrite" feature

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4d338705e1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.