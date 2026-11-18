# Issue

**Title:** ENH Add option to specify which sulci to show.

## Description

Previously, had option to specify a subset of ROIs to show on flatmaps, but could not specify which sulci to show. This PR adds the ability to also specify a subset of sulci.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `915ed736ce21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.