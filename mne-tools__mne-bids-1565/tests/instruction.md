# Issue

**Title:** ENH: Speed up sidecar search

## Description

Let's take advantage of BIDS hierarchy to avoid some `**` in `find_matching_sidecar`.

Marking as draft as I need to check to see if it actually speeds up some accesses on a system + dataset I've been testing with.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4318eb1ea28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.