# Issue

**Title:** perf: use updated dijkstra3d to acquire maxima cheaply

## Description

See discussion in #64 

My tests show that this is worth about 0.5% - 1% normally, but worth a few percent when `fix_borders=False`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad7a894b988e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.