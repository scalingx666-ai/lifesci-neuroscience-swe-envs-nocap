# Issue

**Title:** MRG, FIX: Remove force render

## Description

Over at MNE  that seem to be triggered by the GUI stuff we do when `__del__` is called. This hopefully avoids the problem.

WIP until we can do some runs in MNE to see if it makes the problem go away.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7952423aab1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.