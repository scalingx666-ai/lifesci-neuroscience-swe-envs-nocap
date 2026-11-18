# Issue

**Title:** Prepare v0.18.0 release

## Description

This rolls the recent correctness and packaging work into the 0.18.0 release.

- bumps the package version to 0.18.0
- adds the 0.18.0 changelog entry
- covers the NetworkX, Cypher, lifecycle, ingest, and uv packaging fixes merged in this release

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90db951b48a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.