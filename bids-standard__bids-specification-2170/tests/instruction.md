# Issue

**Title:** fix: Account for NIfTI time units when checking RepetitionTime

## Description

I've run across a BOLD dataset with temporal units set to msec. The RepetitionTime is consistent with pixdim[4], when this is accounted for.

This is an attempt at a rule that will work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17ae415b440c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.