# Issue

**Title:** ENH: Relax the Python package version requirements

## Description

Relax the Python package version requirements: constrain versions within
a range, and test the min and max versions so that there is some more
flexibility when using different package versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `331e5d5c64ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.