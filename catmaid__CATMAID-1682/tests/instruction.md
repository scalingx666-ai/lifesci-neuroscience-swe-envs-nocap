# Issue

**Title:** Selection table: Save all skeletons

## Description

Previously, only the visible skeletons (i.e. the current page) would be saved, probably due to server-side rendering. Now all skeletons in the table will be saved instead.

This should respect name and annotation filters, and current ordering.

UX query: should it also respect whether the skeleton is selected or not (the current implementation doesn't)?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d5469153391`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.