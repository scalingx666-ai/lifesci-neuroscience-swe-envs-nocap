# Issue

**Title:** MRG: clean HRF module and add SPM HRFs

## Description

Some small cleanup to hrf module.

This pull request adds the SPM HRF, the SPM temporal derivative, and the SPM spatial derivative, along with a function to replicate `spm_hrf.m` in the SPM distribution.

Add SPM HRF, with temporal derivative and spatial derivative. Check
against saved output from SPM code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0903ab93eade`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.