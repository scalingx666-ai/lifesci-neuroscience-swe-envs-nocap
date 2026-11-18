# Issue

**Title:** Changes up to divest v0.8.1

## Description

This PR remerges the `divest` codebase with the main one. It mostly adds `divest`-specific implementation details, but also makes some compatibility fixes and avoids calling `exit()`, which will quit R.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `073093371505`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.