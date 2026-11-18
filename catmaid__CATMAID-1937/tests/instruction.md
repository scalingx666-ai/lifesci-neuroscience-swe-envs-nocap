# Issue

**Title:** Matplotlib 3

## Description

Matplotlib v2 is incompatible with python 3.8.

I'm not sure the extent to which unit tests could tell us if there's anything wrong with this, but I haven't come across any issues migrating other code from v2 to v3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76ab98adcaf5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.