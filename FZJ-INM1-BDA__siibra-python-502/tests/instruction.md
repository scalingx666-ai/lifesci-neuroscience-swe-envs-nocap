# Issue

**Title:** feat: add maps from nifti and label information

## Description

This is meant to be a preparation for querying features with volumes. The previous iterations required computation of the relations to the defined maps. With the ability to query with volumes, this computation is unnecessary.

In addition, this PR allows creating a map from multiple volumes and supplying parcellation specifications.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bf96579e75c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.