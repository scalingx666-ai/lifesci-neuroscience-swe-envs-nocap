# Issue

**Title:** Update resample.m

## Description

Fix out crash trying to resample Hanson/Wakeman data from 1100 Hz to 100 Hz when signal processing toolbox absent

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b34555f0e982`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.