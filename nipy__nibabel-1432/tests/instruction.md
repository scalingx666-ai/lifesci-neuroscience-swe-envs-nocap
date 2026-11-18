# Issue

**Title:** BF+TST: Philips R11 PAR/REC Changes

## Description

This should fix the issue that nibabel can't read PAR/REC files produced from Philips software R11. More information is in #1430

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8a175986da0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.