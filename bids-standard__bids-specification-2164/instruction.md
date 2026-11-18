# Issue

**Title:** fix: Use uvx linkchecker

## Description

Linkchecker got damaged by #2127. Was easy to overlook given that it fails all the time anyway. Will try to fix broken links before merging...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62fd793f0167`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.