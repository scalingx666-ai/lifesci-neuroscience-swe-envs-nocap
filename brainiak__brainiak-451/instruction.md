# Issue

**Title:** Split-merge

## Description

This pull request implements an improvement to the fitting procedure for the HMM, allowing for re-allocating events during fitting with a split-merge operation. This behavior is disabled by default so as not to break backwards compatibility and because it adds additional computation time, but can be enabled using the new split_merge flag in the constructor.

A draft of a blog post explaining the logic behind this change and some example fits can be found here: http://chrisbaldassano.com/Split-Merge.mhtml

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca3c62845bd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.