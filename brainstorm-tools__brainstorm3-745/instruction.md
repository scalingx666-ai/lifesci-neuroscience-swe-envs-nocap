# Issue

**Title:** [bugfix] Ensure that wavelength are integer

## Description

See error reported here: https://neuroimage.usc.edu/forums/t/nirstorm-error-mbll-raw-to-delta-hbo-hbr-hbt/48659/4

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99a8783d9599`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.