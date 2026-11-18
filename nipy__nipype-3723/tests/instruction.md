# Issue

**Title:** [ENH] Add -w flag to dcm2niix interface

## Description

Add support for this:
`-w : write behavior for name conflicts (0,1,2, default 2: 0=skip duplicates, 1=overwrite, 2=add suffix)`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `114c73d2fc6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.