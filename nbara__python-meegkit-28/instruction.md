# Issue

**Title:** RESS: Add option to return mixing and unmixing matrices

## Description

Pull request adding the changes discussed in #27 

The changes are very minimal. I tried to respect the style for the docstring and added also a small example of the potential use of the returned eigenvectors. 

Please check whether the end of the function (intending to take care of any combinantion of return_maps and return_comps) is OK or maybe there is a cleaner way of doing it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0676e2fd1dd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.