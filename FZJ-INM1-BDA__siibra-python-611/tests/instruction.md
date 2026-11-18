# Issue

**Title:** Fix nifti fetch voi

## Description

As of 4fd15440a796703128fcb85da2b4e28c6154b8e2, fetching voi from nifti volumes were broken. This PR fixes this issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f827b8d30f3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.