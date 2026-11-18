# Issue

**Title:** Compatibility for vtk>9.4

## Description

Fixes  while maintaining backwards compatibility for vtk < 9.4. 

For versions >9.4 sets default display to headless addressing 

New tests created to ensure backwards compatibility

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcc0bf64b82f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.