# Issue

**Title:** Bump fsspec from 2025.5.1 to 2026.6.0

## Description

Update the locked transitive fsspec dependency from 2025.5.1 to 2026.6.0, the first patched version for [GHSA-27vj-qcqg-25rc / CVE-2026-104851](https://github.com/advisories/GHSA-27vj-qcqg-25rc). The advisory concerns template injection when parsing fsspec reference-filesystem documents.

Review found no compatibility issue: fsspec 2026.6.0 requires Python >=3.10, matching phy, and is installed through phylib → Dask → fsspec. Phy and phylib have no direct fsspec calls. The PR changes only fsspec's version and verified PyPI artifact hashes in uv.lock.

Validation: the integrated phy 2.2 branch with phylib 2.7.1, Tornado 6.5.10 and fsspec 2026.6.0 passed make test-full (495 core/GUI and 155 application tests, one existing visual benchmark skipped), lint/formatting, and uv build. Artifact hashes and Python metadata were checked against PyPI. The original full GitHub CI matrix passed; the branch has now been updated to current master and must pass the refreshed matrix before merge.

## Execution — 8 October 2026

The refreshed full CI matrix, documentation, spelling, and package build passed on `de58337c`. Merged fsspec 2026.6.0 as `8ac76e86`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d198375d9d9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.