# Issue

**Title:** Add `sum_across_studies` to kda

## Description

`sum_across_studies` returns an array where study counts are sequentially added to a single dense matrix, rather than compiling an exhaustive matrix containg all study-level count data. 

This is much more effecient memory and compute wise, enabling MKDA Chi squared with Neurosynth as reference, using <1GB of memory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `886843cc72a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.