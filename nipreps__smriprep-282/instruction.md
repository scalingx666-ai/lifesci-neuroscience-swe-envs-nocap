# Issue

**Title:** FIX: Override nipype handling of recon-all hemi input

## Description

FreeSurfer has some bugs with limiting processing that requires both hemispheres to have completed. Changing `-autorecon-hemi lh` to `-autorecon-hemi lh -lh-only` (and likewise for rh) resolves the issue. We might even be able to simplify the workflow with this fix, but that's for another day.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86c40fa9c223`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.