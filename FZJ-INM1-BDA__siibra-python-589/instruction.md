# Issue

**Title:** fix: memory usage when warming the cache

## Description

Current implementation of warming data results in memleak (well, we call it in memory caching)

this PR fixes this, and the memory foot print is consistently < 1G when warming the cache. For comparison, without this PR, memory footprint goes beyond 4G, when the process is OOM killed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b72b05d41173`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.