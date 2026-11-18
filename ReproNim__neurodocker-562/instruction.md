# Issue

**Title:** Add mamba option to miniconda

## Description

We're having trouble getting conda to install pandas in a timely fashion over in the freesurfer bids app: 

Adding an option to use the mamba solver with miniconda would solve that for us.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `827ff7949c2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.