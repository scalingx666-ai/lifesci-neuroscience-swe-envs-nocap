# Issue

**Title:** fix: normalize relative paths in manifest delta matching

## Description

## Summary

- Normalize mixed `/` and `\` separators before indexing and matching relative manifest paths.
- Apply host-specific path normalization and case handling during comparison.
- Add cross-platform regression tests, including a Windows path with a non-ASCII username.

## Problem

On Windows, manifest entries stored with POSIX-style separators were not matched against scanned paths using backslashes. As a result, previously ingested sources could be reported as `NEW` instead of `MOD` or unchanged.

## Testing

- `python -m pytest tests/test_manifest_delta.py -q`
  - 8 passed
- `python -m pytest tests/test_manifest_delta.py tests/test_cache_manifest_shapes.py tests/test_cache.py -q`
  - 55 passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37596cffeef4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.