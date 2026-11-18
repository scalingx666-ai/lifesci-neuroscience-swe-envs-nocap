# Issue

**Title:** Refactor Session and cluster metadata

## Description

- BaseClusterInfo is a generic class holding cluster-dependent data.
- ClusterMetadata derives from it.
- ClusterStats too. It acts like a cache; the defaultdict factory function acts as a function computing a cluster statistic, only called if the cluster is not in cache.
- .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d8c2e05144e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.