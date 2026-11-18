# Issue

**Title:** Adding compression capability in builder

## Description

I added compression capability in the builder.
The arguments are passed to create_dataset() method of node and edge h5py files.
It works with MPI as well, although I couldn't write a test case for using MPI.
I set 'gzip' (level 4) as the default compression method.

Compression ratio is about 1:5 (if individual weights are not stored in the h5 file) or 1:2 (if weights are stored).
Regardless of the compression algorithms (none, gzip, lzf), it does not seem to affect the execution time of the simulation much.

This change should be backward compatible, as you do not need to specify the compression method when h5 files are read.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ddd819c9eba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.