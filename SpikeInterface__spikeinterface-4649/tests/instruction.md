# Issue

**Title:** Improve sparsity estimation for aggregated analyzers

## Description

Currently, when constricting a `SortingAnalyzer` via dicts, the only supported option for sparsity was `by_property`. This is ok for tetrodes, but is not the best option for multi shank probes.

This PR extends the logic of sparsity to first split by aggregation key and then apply whatever external sparsity is given (e.g. radius).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3691a27d5258`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.