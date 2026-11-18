# Issue

**Title:** Update ISC permutation doc to clarify pairwise groups

## Description

This addresses the confusion with issue #449 (via @mcdoar9). The documentation was unclear on how to supply pairwise ISCs for two groups to the permutation test. The documentation is now updated to make it more clear that pairwise ISCs must be computed on both groups at once (such that between-group ISCs are included in the pairwise ISC matrix) prior to this ISC matrix being supplied to `permutation_isc`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cba905aa2bf4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.