# Issue

**Title:** minor import fixes (absolute -> relative, package -> module)

## Description

, leaving circular imports in the following exceptions:

  - io.nwb
  - gui.merge <-> gui.masks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9362998b02df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.