# Issue

**Title:** Teach write.cmtkreg() to give a warning if versions of CMTK reg differ

## Description

This should help us avoid errors when dealing with registrations created when CMTK's handling of affine matrices was broken.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `254e13ceb837`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.