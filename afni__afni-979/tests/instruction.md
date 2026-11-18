# Issue

**Title:** 3dWarpDrive: new -setup_mask opt, for slicewise erode/dilate (with ne…

## Description

…w thd_automask func)

These changes are to adapt to new SLOMOCO behavior, but also allow that new functionality in a general way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afc1d1541fd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.