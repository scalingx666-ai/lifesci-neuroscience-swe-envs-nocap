# Issue

**Title:** Add ability to use conda installation of niftyreg

## Description

Fixes  This picks up any local conda forge installation of `niftyreg`. Tested and working locally, but we should add some tests on the CI too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adf6c6cef4f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.