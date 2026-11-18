# Issue

**Title:** Show stderr when mri_vol2surf fails

## Description

This should make it easier to debug problems when using `project_volume_data`. Not sure why we were just printing the command line before (which gets printed anyway).

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5dd4acdac31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.