# Issue

**Title:** Allow numpy datatypes in image_clone

## Description

The documentation for this function says you can use a numpy or ITK datatype string when cloning, but only ITK types were supported.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d5463897f46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.