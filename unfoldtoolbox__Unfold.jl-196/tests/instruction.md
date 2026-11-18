# Issue

**Title:** faster design

## Description

- improved designmatrix due to interpolate=false, speedup 3x
- up to 20x faster designmat for FIR designs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88edeb18fb2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.