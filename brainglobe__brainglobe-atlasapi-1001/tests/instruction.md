# Issue

**Title:** create missing directory for blackcap and use brainglobe working dir for meshes

## Description

previously the script was not reproducible and expected a folder in the users home directory. this fixes both

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `942a5ae469a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.