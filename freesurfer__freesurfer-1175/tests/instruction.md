# Issue

**Title:** bf: mri_synthmorph: fix init transform variable name typo

## Description

In L542 of `mri_synthmorph/mri_synthmorph`, the variable `mov_to_new` is defined but never referenced again. In the full context of the code, I believe that this line is intended to redefine the `mov_to_net` variable to take the initial matrix transform into account and that this is simply a typo in the variable name. If I am correct, then this change should address bugs related to the application of initial transforms, but of course this should be verified.

In L643, I also corrected "mri_synthmoph" to be "mri_synthmorph", but this should not have any effect on code function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26355713d93c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.