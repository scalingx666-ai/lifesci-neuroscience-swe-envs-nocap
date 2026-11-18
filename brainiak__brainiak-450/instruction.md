# Issue

**Title:** dev: Pin scikit-learn <0.22 to fix fcma test

## Description

See issue #448.

Also, pin NumPy in `setup_requires` as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3afd2d5bab1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.