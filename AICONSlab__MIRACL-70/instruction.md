# Issue

**Title:** [fix] replace deprecated nibabel.trackvis.read

## Description

Nibabel's method 'nibabel.trackvis.read' has been deprecated from version 2.5.0. It has been replaced with 'nibabel.streamlines.load' which returns an object that can't be assigned in parallel as it was done in the original code in which the object 'nibabel.trackvis.read' was returned. The deprecated method has been replaced and the syntax has been changed accordingly in 'miracl_sta_gen_tract_density.py' and 'miracl_lbls_stats.py'.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b96f9f1f93f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.