# Issue

**Title:** Update hmrR_PruneChannels.m

## Description

Fixed the issue of not propagating excluded channel indices from first wavelength to the second wavelength. Added sanity check/test to confirm it is working.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `252f4bd372c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.