# Issue

**Title:** Fix some local version issues using black and also "make format-pr"

## Description

and neuronsimulator/coding-conventions#2

It is helpful for debugging when the format and format-pr targets print the version of black and the version of python that runs black. This appears in the CI log and when run locally.

Also "ninja format-pr" should work without spurious error messages about deleted files no longer in the branch.
I.e. adopt the cvode3 commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c9dab0c7f1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.