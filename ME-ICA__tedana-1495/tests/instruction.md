# Issue

**Title:** Add support for 3D (anatomical) inputs to t2smap

## Description

Related to #1091. This will just give t2smap the ability to run on a list of 3D files, like an MEGRE scan.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `561d18b7b88b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.