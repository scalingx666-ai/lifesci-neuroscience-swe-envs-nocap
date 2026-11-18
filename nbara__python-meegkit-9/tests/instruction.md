# Issue

**Title:** [FIX] dss_line() with nremove>1

## Description

This is an attempt to fix #8  

There was a bug in one of the utility functions. `dss_line()` should now also be more robust to 3D data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a10e7f9baddc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.