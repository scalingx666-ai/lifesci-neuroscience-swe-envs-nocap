# Issue

**Title:** Fix/container travis

## Description

This switches to the modern containerised travis for faster builds. Old style builds are now deprecated. This was achieved by compiling CMTK from source rather than trying to install from neurodebian (which was never added to the travis whitelist).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f335e3f8130`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.