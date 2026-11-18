# Issue

**Title:** skip writing empty meshes

## Description

This prevents wrapup from writing meshes which have no points. Doing this crashes the wrapup so it seems wise to avoid. We already skip generating meshes which are under a certain size so this seems to be consistent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98d86711585f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.