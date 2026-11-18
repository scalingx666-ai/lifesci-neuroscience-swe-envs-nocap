# Issue

**Title:** afni.c: add functionality so umpto coords can be specified with lette…

## Description

…rs, like: 4r 3p 2i

For a long time we have discussed adding this functionality in, for interpeting jumpto coords. (Interestingly, the comma-separator functionality had already been there for a long time.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90f1c686ed18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.