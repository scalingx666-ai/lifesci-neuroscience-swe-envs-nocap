# Issue

**Title:** fix for selected sessions bug

## Description

Changed aas_getdependencies_bydomain to include selected session when generating the cache hash. Also did some minor cleanup. There was a question last skype whether this will play nice when connecting pipelilnes. Testing should focus on that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d86027d44568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.