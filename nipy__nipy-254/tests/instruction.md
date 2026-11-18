# Issue

**Title:** Refactor registration measures

## Description

Make it possible to switch off normalization of similarity measures used for image registration. Conventional similarity measures are normalized by default so as to be independent of the image overlap size, but this may sometimes not be desired.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f78c408854fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.