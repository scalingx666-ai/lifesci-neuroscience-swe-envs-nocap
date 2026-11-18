# Issue

**Title:** fixed bug when no repeats exist and user wants glmdenoise or fracridge

## Description

fixed logic in glmsingle.py and glmestimatesingletrial.m to ensure that glmdenoise and fracridge still run when there are no repeats, if the user has set the pcstop or fracs hyperparameters to special case values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c569bb653c1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.