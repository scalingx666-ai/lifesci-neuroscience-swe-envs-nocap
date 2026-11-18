# Issue

**Title:** improve templates for FieldLine OPM helmets

## Description

- added beta2 helmet, including fiducials
- rotate alpha1 helmet 90 degrees
- update plotting functions to deal with fiducials

Note that `headshape.fid` was already there for reading and plotting, and `mri.fid` is used in reading (but not plotting). Furthermore, `sens.fid` is already used when reading some of the EEG electrode formats.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1127f47fbfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.