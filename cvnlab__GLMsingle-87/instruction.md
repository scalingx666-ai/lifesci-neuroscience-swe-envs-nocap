# Issue

**Title:** add diagnostics, add warning for trials near end of run, provide desi…

## Description

This commit includes several changes.

1. We now give the user some useful diagonistics about their design matrix.
2. We issue a warning if trials are dangerously close to the end of a run.
3. We provide a lot of design-related outputs (including designSINGLE) to the workspace, as well as writing these out to a new file.

We need a Python port of these changes.

I made the changes on the iotweaks branch.  So I guess someone can add the Python port to this branch too?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aa0bd2fcaf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.