# Issue

**Title:** HMM Free Energy Calculation

## Description

## Issue

On large datasets we run into a memory error (CPU RAM related) when training an HMM:
```
2025-04-16 05:39:41.804216: I tensorflow/core/kernels/data/shuffle_dataset_op.cc:452] ShuffleDatasetV3:38572:
Filling up shuffle buffer (this may take a while): 989 of 4000
/var/spool/slurmd/job39998766/slurm_script: line 10: 3736322 Killed
python 06_train_hmm.py 10 9
slurmstepd: error: Detected 1 oom_kill event in StepId=39998766.batch.
Some of the step tasks have been OOM Killed.
```
This is due to an inefficiency in how we calculate the variational free energy.

This PR resolves this issue.

## Changes

- Fixed the OOM error.
- Rewrote the implementation of the free energy and model evidence calculation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07310613fdfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.