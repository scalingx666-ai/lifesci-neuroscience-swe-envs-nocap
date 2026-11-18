# Issue

**Title:** Bst exlusion zone options interactive

## Description

Add point-based exclusion & method selection [Only from the interactive option/no process]
Refactor exclusion-zone computation to accept arbitrary 3D point locations (pointLocs) instead of a ChannelMat. Extend the interactive workflow to let users choose how to define the exclusion zone: from channel positions, from a selected Brainstorm surface, or from a MATLAB workspace variable. Update ComputeInteractive to load points accordingly and pass them to Compute. Update usage text to mention sensors or 3D points and adjust messages. Minor formatting/flow improvements and error handling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75f3c41acd91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.