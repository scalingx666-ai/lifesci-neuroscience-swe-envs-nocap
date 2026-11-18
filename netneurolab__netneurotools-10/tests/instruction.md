# Issue

**Title:** [REF] Better memory handling in func_consensus()

## Description

Previously bootstrapping in func_consensus() was handled...poorly. This
attempts to ~half the amount of memory consumed by only performing
operations on the upper triangle!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1d0b55c2ab9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.