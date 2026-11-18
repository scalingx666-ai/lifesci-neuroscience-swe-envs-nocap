# Issue

**Title:** ENH: Wrapper for multi-label morphology. Preserves original labels,

## Description

This function wraps calls to iMath and does morphology on a multi-label image. It preserves the original label regions, which is often desirable with brain labels.

An example application is dilating cortical labels into white matter, without overwriting neighboring cortical voxels.

It is a bit slow, for a T1 image with OASIS labels it takes about a minute. It could be more efficiently implemented in C++ using ITK Label Maps.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06cf8b6f62c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.