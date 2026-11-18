# Issue

**Title:** COMP: Don't copy cmake build stamp file to install dir

## Description

One unwanted side effect of #1943 was to create `share/ANTs/superbuild-install-stamp.txt` in the install location. We don't actually need to copy this file to the output.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4524b2e5620`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.