# Issue

**Title:** fix: Adapt to numpy 2.5 deprecations

## Description

This feature was also used in the vendored copy of `scipy.io.netcdf`, so update that as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `249f6fbae82c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.