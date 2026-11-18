# Issue

**Title:** BF+TST: bug in nifti convert for 'unknown' space

## Description

'unknown' space should work if the header matches, but if there is no header,
the zooms weren't being set, and the check was failing.  Fix and test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95f15397a62b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.