# Issue

**Title:** Fix for NumPy eig change

## Description

`np.eig` always returns complex values now, even for real positive semidefinite matrices. Fix our behavior accordingly. This one is trivial and fixes a real CircleCI error in main so I'll self-mark for merge-when-green

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b0b0b8ea8d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.