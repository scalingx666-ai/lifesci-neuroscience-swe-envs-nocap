# Issue

**Title:** Fix gen design

## Description

It was designed that an AFNI style stimulus timing onset file with a negative onset can result in an all-zero design matrix, but this actually raised error. This PR fixes it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48a1b8b3cafc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.