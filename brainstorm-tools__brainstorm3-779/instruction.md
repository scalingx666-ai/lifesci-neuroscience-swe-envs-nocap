# Issue

**Title:** fix the export of freesurfer annotation

## Description

It seems that starting with freesurfer 7.3.2, we need to provide a label for each vertex of the surface. 

This add a new label (background) for all the vertex that doesnt have already a label.


Regards
Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ccd4243cb64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.