# Issue

**Title:** COMP: Allow modern numpy

## Description

Related to #813 

@neurolabusc reported not being able to install wheels requiring numpy 2.0.1 with Python 3.13 on OSX arm64. pip attempts to compile numpy but fails with an error about "string_fastsearch.h:132:5: error: no type named 'ptrdiff_t’".

Looks like others have had similar problems on Python 3.13.

I ran a test and we can install numpy 2.3 for all platforms, and all the tests run fine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4cba30bac3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.