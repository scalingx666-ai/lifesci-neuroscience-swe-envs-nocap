# Issue

**Title:** ENH: automatic # of smoothing steps

## Description

This option is useful when the data is defined for a subsampled version of the surface and only a minimum amount of smoothing should be applied (this is what we do in mne-python).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cbdfc496f6ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.