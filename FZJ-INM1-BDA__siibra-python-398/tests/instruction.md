# Issue

**Title:** Remove sparseinedx url connection. Simplify factory.build_map

## Description

sparsemap.py will receive further updates after reworking the zipfile connector:
- remove the need to download the whole zip file
- return bytes and load to memory (important for api)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff34c7f77fd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.