# Issue

**Title:** rf(resources): Use acres over vendored data loader

## Description

Created https://github.com/nipreps/acres based on fMRIPrep's data loader, to help avoid getting out-of-sync.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19201db6c97d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.