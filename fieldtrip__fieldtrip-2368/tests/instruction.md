# Issue

**Title:** ENH - support for differently formatted faces_lines

## Description

This change uncomments some code that was already there, allowing to handle files that lack the textureindex (which is needed at least for the DCCN structure sensor, when the file is created without colors)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d9f1a0400f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.