# Issue

**Title:** Remove segmentation tool

## Description

This tool was never functional and can be misleading to users (see catmaid/CATMAID#1694).

No rush on this, so it can land after release, hence no changelog yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d073fe62a69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.