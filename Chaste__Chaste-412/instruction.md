# Issue

**Title:** Add basic compatibility testing

## Description

As @mirams suggests, just running the global test packs on our default (Ubuntu LTS runners) is likely to catch the vast majority of config issues.

This PR introduces those tests, on completely vanilla Ubuntu LTS runners. This should be as close as possible to the out-of-the-box setup most users will encounter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd78b1ee1f8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.