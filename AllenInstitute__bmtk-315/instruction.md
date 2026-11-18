# Issue

**Title:** Making 'h5' and 'hdf5' as viable option for pointnet input

## Description

At one point, it started to check if the input files are 'nwb', 'csv', and 'sonata'.
If 'csv' is a viable option, users will try 'h5' or 'hdf5' (some config files are already using it), so making them viable options. No change is needed downstream code, as it is effectively a 'sonata' file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11207ccde933`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.