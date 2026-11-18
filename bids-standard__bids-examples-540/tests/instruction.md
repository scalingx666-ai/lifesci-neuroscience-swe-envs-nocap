# Issue

**Title:** chore: Remove exclusions for new examples

## Description

BIDS v1.11.0 is released. This stops excluding new examples from validation.

We probably will need a validator release to make this work, but just checking first.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5d03eef070b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.