# Issue

**Title:** [FIX] Use `scipy.interpolate` namespace

## Description

Instead of the `scipy.interpolate.ndgriddata` namespace which is now deprecated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f3068fbaf20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.