# Issue

**Title:** Improvement of Spike Time Tiling Coefficient (STTC)

## Description

Improvement of Spike Time Tiling Coefficient (STTC) calculation by utilizing numpy function. (in `spike_train_correlation.py` )

Details:
- use `numpy.where` to find overlapping tiles in `run_T`
- some comments elaborated/changed

This enhancement was inspired by Thierry Nieus code: https://github.com/thierrynieus/Spike-Time-Tiling-Coefficient-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7ee38e853ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.