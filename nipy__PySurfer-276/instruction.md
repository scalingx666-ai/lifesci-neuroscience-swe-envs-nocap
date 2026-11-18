# Issue

**Title:** ENH: Add kwargs in Brain.add_* and pass it to mayavi modules

## Description

Add kwargs in Brain.add_* and pass it to mayavi modules, so that we could directly manipulate mayavi display settings, like point resolution and overlay opacity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cd751178d1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.