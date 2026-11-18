# Issue

**Title:** ENH: Support composite transforms in ReorientTensorImage

## Description

Reorienting with a composite transform removes the requirement to collapse all transforms into a single displacement field.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0b762586d54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.