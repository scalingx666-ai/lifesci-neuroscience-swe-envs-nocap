# Issue

**Title:** Fix header includes for GCC 12.

## Description

These headers were probably implicitly included before, but no longer in GCC 12. Comment with the component used where not obvious. (Thanks @matz-e )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0a32ca86e3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.