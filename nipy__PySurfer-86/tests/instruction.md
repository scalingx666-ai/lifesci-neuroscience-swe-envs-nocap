# Issue

**Title:** Check if colorbar is none before seting visibility

## Description

I was getting some errors when building figures with multiple layers, some of which I was plotting without a colorbar.

This should fix that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e467adef7507`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.