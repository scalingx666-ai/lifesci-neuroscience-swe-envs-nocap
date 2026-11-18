# Issue

**Title:** [FIX] Minor change to spin sample generation

## Description

Pre-generates kdtrees for computational efficiency. Also reverse matching of rotated --> original to original --> rotated for ease of use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e02a5cab410`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.