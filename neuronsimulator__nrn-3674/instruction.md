# Issue

**Title:** Embed nrnunits in NMODL

## Description

Similar to #3471, but for NMODL. This solves a bunch of problems when implementing #3468 since the hardcoded paths to the nrnunits file are not useful for wheels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `773e7f281d34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.