# Issue

**Title:** BF: fix bug modifying feature dictionary of MROI

## Description

When iterating through feature dictionary, the hroi module was using the
dictionary keys, which are being modified inside the loop.  Use a static
list of the keys to prevent this happening.

See:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ddecb889f22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.