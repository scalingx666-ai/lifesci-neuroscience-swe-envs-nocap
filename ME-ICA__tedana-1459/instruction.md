# Issue

**Title:** Expand interpolation option to perform two-stage interpolation+fitting

## Description

Closes none. Stems from 

Changes proposed in this pull request:

- Instead of just interpolating over failing voxels, the new version (1) interpolates over failing voxels, (2) re-runs the curvefit function on those failing voxels with the interpolated values as new initial values, and (3) interpolates over any voxels that fail the second curvefit step.
- I also moved the T2* estimation steps into a new function since so much is shared between t2smap and tedana.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ef5a33fabc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.