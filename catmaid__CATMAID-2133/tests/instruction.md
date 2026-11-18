# Issue

**Title:** Improve volume import performance

## Description

These are miscellaneous changes that improve import performance for large volume meshes (>100K vertices). For the meshes I was using these cumulative changes brought import time with the dev server from 50 minutes down to 5 seconds. PRing for CI and because I haven't touched CATMAID in ages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73424a6393c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.