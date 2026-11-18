# Issue

**Title:** Changes from divest 0.9

## Description

This covers the changes to the core code made for `divest`, up to version 0.9.0, rebased onto the `development` branch. They mostly fix some compile-time issues, including warnings from certain compilers, and get the R codepaths to match the main ones when handling diffusion acquisitions with b=0 throughout.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91129b1dc6eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.