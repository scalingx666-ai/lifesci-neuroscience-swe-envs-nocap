# Issue

**Title:** Block Nilearn 0.13.0/0.13.1 and uv lock

## Description

. This addresses the issue raised in https://neurostars.org/t/tedana-26-0-1-t2-maps-with-extreme-outliers-compared-to-version-24-0-1/35893. My fix for the bug () has been merged into Nilearn, so when they release 0.13.2/0.14.0 it should work for tedana.

Changes proposed in this pull request:

- Specify nilearn shouldn't be 0.13.0 or 0.13.1.
- Run `uv lock`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daaa0260a48c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.