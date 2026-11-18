# Issue

**Title:** skip filter feature

## Description

Explanation:

If the multitaper filter is skipped there is no need to remove the trend at the beginning since the trend at that point is specifically removed for the multitaper filter and then added back. So if we skip the filter we can jump directly to the robust referencing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce25032e1504`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.