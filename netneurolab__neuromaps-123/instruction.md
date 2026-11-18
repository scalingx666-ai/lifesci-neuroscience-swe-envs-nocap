# Issue

**Title:** [FIX] stats.compare_images compatible with more metrics

## Description

Changed 1 line of code to make `stats.compare_images()` compatible with metrics (e.g. `scipy.spatial.distance.cosine`) that may return an int instead of a float. (This PR is related to issue #103 )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfe44bdcfb08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.