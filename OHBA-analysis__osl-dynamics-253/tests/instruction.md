# Issue

**Title:** Upgrade TensorFlow Version

## Description

Changes:
- Upgraded to `tensorflow==2.11.0` and `tensorflow-probability==0.19`.
- Fixed bug where re-initialisation returned the same weights (now gives new random weights).
- Fixed bug with data leakage in splitting training and validation datasets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bc71bb7c3f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.