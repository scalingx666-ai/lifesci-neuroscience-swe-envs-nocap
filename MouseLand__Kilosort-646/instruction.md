# Issue

**Title:** Jacob/amplitudes

## Description

Updated variables exported to phy:
1) templates are normalized (but not unwhitened) before saving.
2) templates are unwhitened when computing cluster amplitudes.
3) actual whitening matrix inverse is saved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3f4459c7994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.