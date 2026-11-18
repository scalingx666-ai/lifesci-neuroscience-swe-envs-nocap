# Issue

**Title:** neuromore staging back-end

## Description

* Changes old `test` backend to new `staging` backend
* Removes obsolete `swap` backend
* Makes `staging` and `localhost` backends also selectable in production builds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7dab859c86d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.