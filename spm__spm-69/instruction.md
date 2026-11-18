# Issue

**Title:** Split 'CPath' functionality from cfg_getfile into separate helper functions

## Description

cfg_getfile is a user interface function. In addition, it currently implements a number of filename mangling tools, which are more or less useful in its own right. This pull request creates a helper function `cfg_getfile_cpath.m` which can be used without going through `spm_select` or `cfg_getfile`.

In addition, SPM has introduced `spm_file` as a collection of utility functions for filename handling. Most SPM code already uses `spm_file(..., 'CPath')` instead of `spm_select('CPath', ...)`. This pull request removes the remaining calls to `spm_select('CPath', ...)` and replaces them with calls to `spm_file(..., 'CPath')`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d148b92888aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.