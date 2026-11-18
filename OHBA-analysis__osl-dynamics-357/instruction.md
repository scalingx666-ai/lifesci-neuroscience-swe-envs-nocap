# Issue

**Title:** Fixed small bug in HMM/HIVE free energy calculation

## Description

Closes: 

Changes:
- Corrected how we average over batches when calculating the average free energy for a dataset. We now take into account the when there is a different number of sequences in each batch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25de21dac90f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.