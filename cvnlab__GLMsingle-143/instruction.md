# Issue

**Title:** fixed bug in h5py dataset saving when fields are None

## Description

- for cases where the "data" argument of h5py create_dataset are None (as when the user disables GLMdenoise or fracridge), that function errors out
- we resolve this issue using the proper method of saving empty fields/objects in h5py (https://docs.h5py.org/en/stable/high/dataset.html#creating-and-reading-empty-or-null-datasets-and-attributes)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c822172880a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.