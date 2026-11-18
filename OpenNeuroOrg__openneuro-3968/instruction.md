# Issue

**Title:** fix(server): Create findable DOIs for new snapshots immediately

## Description

Fixes an issue where a new snapshot for a public dataset would get a draft DOI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c7761416ae7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.