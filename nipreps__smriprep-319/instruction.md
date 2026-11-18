# Issue

**Title:** ENH: Merge T2w images and coregister to T1w template

## Description

The approach taken here is to merge the T2w images in exactly the same way as T1w images (N4 -> mri_robust_template) and then bbregister. This is the approach taken by `recon-all`, and seems the safest way to do this without running brain extraction first. Therefore this is only available if FreeSurfer is run.

.

We could probably throw in #13 at the same time and pass the merged T2w image to FreeSurfer...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a078959ab28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.