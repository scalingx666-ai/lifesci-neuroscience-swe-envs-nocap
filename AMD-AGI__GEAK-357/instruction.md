# Issue

**Title:** GEAK install shallow-clone the repo (--depth 1) and update README.md

## Description

The runtime checkout does not need git history, and the repo carries large blobs (perf_knowledge + example artifacts) across its history. A plain clone pulled ~180 MB; --depth 1 pulls ~5 MB and finishes in ~1s instead of minutes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `904ca2d6d6a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.