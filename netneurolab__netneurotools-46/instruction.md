# Issue

**Title:** [ENH] Adds parcellation projection to/reduction from FreeSurfer vertices

## Description

Assuming users have a FreeSurfer-style annotation file with parcellation information, adds functions for projecting parcellated data to vertices and reducing vertex-level data to parcels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b71ede2fe4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.