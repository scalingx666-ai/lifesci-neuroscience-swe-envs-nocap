# Issue

**Title:** force scipy version 1.4.1

## Description

Something was changed by scipy in the optimization functions after version 1.4.1.

This PR proposes to force dmipy to work with scipy 1.4.1.

The new dmipy version goes from 1.0.4 to 1.0.5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e723478d175f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.