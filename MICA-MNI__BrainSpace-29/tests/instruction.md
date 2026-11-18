# Issue

**Title:** [FIX] Fixed dimension size in joint alignment

## Description

Fix for the bug mentioned in #28. In short, joint alignment was using the wrong size of the wrong dimension to determine which columns to extract from the computed gradients. This was fixed by simply changing the dimension extracted by size_connectivity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `666e43c60374`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.