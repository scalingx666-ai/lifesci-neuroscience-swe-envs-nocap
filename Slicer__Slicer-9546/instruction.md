# Issue

**Title:** BUG: Fix saving of slice view transform interaction settings

## Description

The settings that enable translation, rotation and scaling of a transform in slice views were not saved in the scene, and only the scaling one was copied with the node. The interaction handle size settings were not copied either, so scene views and sequences did not restore them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `713faf3e0099`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.