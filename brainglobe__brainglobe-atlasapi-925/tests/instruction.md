# Issue

**Title:** set default chunk size for all volumes including masks to 128

## Description

We ran into an issue where packaging was writing large chunk sizes of 128MB. This was causing neuroglancer links to not properly function. Here we write a more sensible chunk size of 128.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daf24f964dda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.