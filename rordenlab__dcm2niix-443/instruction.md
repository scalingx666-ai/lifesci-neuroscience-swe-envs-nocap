# Issue

**Title:** Development

## Description

Please review these changes 
- Detect GE software version
- Robust is27r3
- GE Slice Time Estimation limited to fMRI only (excluding diffusion & others)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07b47ca60718`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.