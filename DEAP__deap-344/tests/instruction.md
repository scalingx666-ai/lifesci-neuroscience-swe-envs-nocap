# Issue

**Title:** Make cxESTwoPoints call cxESTwoPoint instead of itself.

## Description

Make cxESTwoPoints call cxESTwoPoint instead of itself, avoiding infinite recursion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ce14ad83ac6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.