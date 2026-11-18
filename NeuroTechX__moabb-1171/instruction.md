# Issue

**Title:** Pre-release 1.7.1

## Description

## Summary

- catch leaked `httpx.TransportError` exceptions at the NEMAR download boundaries
- preserve the `auto` provider fallback when NEMAR is unreachable through a proxy
- release the fix as MOABB 1.7.1

## Verification

- regression test fails with all transport catches reverted and passes with the fix restored
- supplied BNCI2014_001 MWE loads from disk for both `ConnectError` and `ProxyError`
- `pytest -q moabb/tests/test_download.py`
- `pre-commit run --files CITATION.cff README.md docs/source/cite.rst docs/source/whats_new.rst moabb/__init__.py moabb/datasets/download.py moabb/tests/test_download.py`
- wheel and sdist build successfully and pass `twine check`; isolated wheel import reports `1.7.1`

Upstream report:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9037ff6a1855`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.