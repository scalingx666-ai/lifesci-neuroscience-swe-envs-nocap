# Issue

**Title:** Server memory cap 3 GB (legacy config)

## Description

Config only.
- The repo-root railway.json, which production deploys still read, sets the server memory cap to 3 GB; it was resetting the live limit to 1 GB on every deploy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67cb3da983af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.