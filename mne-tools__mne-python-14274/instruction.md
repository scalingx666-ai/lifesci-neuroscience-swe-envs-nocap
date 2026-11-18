# Issue

**Title:** Use uv in Azure and pip-pre

## Description

We are currently cloning a bunch of repos -- let's avoid that. Should help with the ~15m (!) install time I saw in Azure today. Also, use `uv` and caching to speed things up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f8ce92ab1ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.