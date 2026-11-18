# Issue

**Title:** feat(deprecations): remove `CurationSorting` and `MergeUnitsSorting`

## Description

It is time! I also realized that a benchmark function and the compute merges were still using `MergeUnitsSorting`. NOw converted to `sorting_tools.apply_merges_to_sorting`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `923f305101de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.