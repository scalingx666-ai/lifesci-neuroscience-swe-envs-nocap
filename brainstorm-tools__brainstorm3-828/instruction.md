# Issue

**Title:** Resample: also resample the std field if present

## Description

This PR is here to keep the standard deviation after resampling,



For contexte, we have estimated the average nirs response to a task using averaging (sampled at 10Hz). Now we want to compare with the fMRI response sample at 1Hz. This PR allow us to compare the two after resampling

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b575e82be319`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.