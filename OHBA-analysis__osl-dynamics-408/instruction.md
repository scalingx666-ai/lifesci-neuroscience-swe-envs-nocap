# Issue

**Title:** Fixes for Canonical-HMM-Networks

## Description

Changes:
- Tested the latest M/EEG processing code to work with the [Canonical-HMM-Networks](https://github.com/OHBA-analysis/Canonical-HMM-Networks) repo.
- Fixed batch processing (previously was using all the cores by default).
- Updated docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86f2642cc4c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.