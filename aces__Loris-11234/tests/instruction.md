# Issue

**Title:** [dataquery] Small optimizations

## Description

This makes 2 small optimizations for the dataquery API.

1. There is no reason to convert the iterator of matchCandidates to an array just to get the count. Just use iterator_count in the count endpoint instead.
2. The temporary accesscandidates table inserts all candidates at once. Do it in batches of 2000 in order to put a limit on the size of the insert statement string generated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c6ede2cfd71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.