# Issue

**Title:** BF: fix error message return for missing version

## Description

A bug in the setup_helpers where I was not returning the error
message when we can't get the version of a package we need.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc95f66b3994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.