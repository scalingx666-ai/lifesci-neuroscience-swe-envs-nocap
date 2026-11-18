# Issue

**Title:** FIX: Use `mris_convert --to-scanner`, and update normalization step

## Description

Following exploration in #292, this should get us to a point where we're producing files that are at least less broken from the perspective of connectome workbench and compatible with FreeSurfer.

I initially set the `VolGeom` affine to an LIA affine, but FreeSurfer will set that as the default. Removing it seemed more honest in that it indicates that this is, in effect, *not* a FreeSurfer-generated GIFTI but one edited by sMRIPrep. I can revert this to LIA if people think that would be better.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03bf056c1dcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.