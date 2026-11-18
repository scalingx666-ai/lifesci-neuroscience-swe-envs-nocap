# Issue

**Title:** imageblk tilesource: Fix bug that prevents non-xy orientations from working

## Description

In experimenting with imageblk, I was unable to get non-xy orientations working in catmaid, always getting a weird error about baseURL not being defined.

Looks like it's a little javascript whoops.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f6d21badcd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.