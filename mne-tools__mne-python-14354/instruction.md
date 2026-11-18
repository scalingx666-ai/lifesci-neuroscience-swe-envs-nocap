# Issue

**Title:** BUG: Fix SNIRF landmark length unit scaling

## Description

#### Reference issue (if any)

None.

#### What does this implement/fix?

`read_raw_snirf` divided `landmarkPos3D` by the length unit scale instead of multiplying. For files in mm, fiducials ended up 1e6 too far, e.g. lumomat nasion at 214 km instead of 0.21 m.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `457ec41f1475`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.