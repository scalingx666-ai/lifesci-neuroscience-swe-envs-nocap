# Issue

**Title:** COMP: Update ITK, ANTs, roll back numpy changes

## Description

Require numpy < 2.4 for now.

Eventually we will update ITK to v6, at which point we should probably drop support for python 3.8 and 3.9. This will allow us to update numpy and scipy

Also would be a good point to update manylinux and cibuildwheel

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ffe2d911bce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.