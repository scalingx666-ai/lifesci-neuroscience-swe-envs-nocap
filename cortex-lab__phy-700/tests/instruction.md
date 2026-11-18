# Issue

**Title:** Faster memcache that requires hashable arguments

## Description

memcache is now faster, but it requires function arguments to be hashable (**no ndarrays**). Typically, this is used for `cluster_id => value` functions so this is okay.

There should be performance improvements when a memcached function is called many times with different arguments (example of the similarity function). Previously, the bottleneck was the computation of the hash of the function's arguments (using joblib's `hash()` function, which is overkill unless using ndarrays)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1940e01efcc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.