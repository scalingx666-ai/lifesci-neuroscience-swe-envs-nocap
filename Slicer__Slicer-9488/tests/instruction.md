# Issue

**Title:** Fix vector volume nrrd read write

## Description

Vector volume NRRD files were read by the NRRD storage node, which is meant for diffusion MRI, so the spatial vector type (RAS/LPS conversion) and the color type were lost. The NRRD storage node now only accepts files with diffusion weighted MRI metadata when it's picked automatically. It's still used for writing diffusion weighted volumes and vector volumes with more than 4 components. Saving a 9-component float vector volume crashed, because it was treated as a diffusion tensor; it's now written correctly by the NRRD storage node, and failed writes report an error instead of silently succeeding.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0abfc06e6bcc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.