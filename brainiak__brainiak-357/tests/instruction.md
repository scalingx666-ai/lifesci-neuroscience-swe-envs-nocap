# Issue

**Title:** Add TensorFlow workaround for our Jenkins server

## Description

We want to be able to use TensorFlow as a dependency. TensorFlow
currently requires glibc >= 2.17 (not formally documented, see
).
We are currently running Jenkins on CentOS 6, which has glibc < 2.17.
Installing TensorFlow with Conda also installs the required glibc.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4679cd951582`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.