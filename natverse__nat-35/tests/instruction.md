# Issue

**Title:** write.hxsurf

## Description

Reading an Amira surface in and saving it to a file will not produce exactly the same file, due to some information being discarded when the Amira surface is read in, but reading the saved surface back into R will produce the same R object as the original file (as backed-up by the test added in 407a164).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `121e7e339687`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.