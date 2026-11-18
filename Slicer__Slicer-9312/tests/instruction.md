# Issue

**Title:** ENH: Remove support for building against VTK <= 9.4

## Description

This anticipates upcoming support for VTK 9.7.0 at which there will be support for VTK 9.5, 9.6 and 9.7.

This is a follow-up to  where the VTK minimum version was last updated to 9.4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f06f0be0506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.