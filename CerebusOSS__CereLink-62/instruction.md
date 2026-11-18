# Issue

**Title:** Cleanup, 3.10 update, and filled out Cython (mostly)

## Description

There are 3 different things in this PR. If you prefer, I can do them individually but only 1 at a time (otherwise merge conflicts).

1. Cleaned up CMakeLists some more. Made Python setup.py slightly easier to read.
2. Modified cbhwlib.h for 3.10/6.05 compatibility.
3. Big changes to Cython wrapper. Renamed some files. Wrapped many more functions and structures from cbsdk.h.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b1092ab10cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.