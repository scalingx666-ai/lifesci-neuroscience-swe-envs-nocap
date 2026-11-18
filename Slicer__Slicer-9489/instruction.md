# Issue

**Title:** Vector volume nrrd units labels

## Description

NRRD file can store voxel unit and label (for example "mm/s" and "velocity") but this information was only saved in the scene. This PR writes this information to standard NRRD fields, for single volumes and for volume sequences, and read back on load. Volumes also keep them when copied into a sequence.

The first commit updates ITK to include  which adds writing of the label and units of the NRRD pixel axis.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8064fe663806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.