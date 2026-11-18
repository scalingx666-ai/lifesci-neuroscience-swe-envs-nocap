# Issue

**Title:** Handle UUID mismatch in datalad special remote configuration

## Description

## Overview

This PR fixes a regression where datasets created before a fixed UUID convention was adopted for the datalad special remote would fail when `ensure_datalad_remote()` was called. The issue occurs because the UUID-based lookup in `ensure_datalad_remote()` would not find the remote if it was configured under a different UUID, causing the code to attempt initializing a duplicate remote, which git-annex rejects with "There is already a special remote named...".

## Changes

### `datalad/customremotes/base.py`

1. **`init_datalad_remote()` function**: Added error handling to catch the "already a special remote named" error from git-annex. When this error occurs, the function now falls back to enabling the existing remote instead of failing. The fallback applies the provided options (except `uuid=`, which is create-time-only) via `enableremote`.

2. **`ensure_datalad_remote()` function**: Enhanced the special remote lookup to handle UUID mismatches. When the UUID-based lookup fails to find the remote, the function now falls back to a name-based lookup across all configured special remotes. This allows the function to locate remotes that were configured under legacy UUIDs.

### `datalad/customremotes/tests/test_base.py`

Added `test_ensure_datalad_remote_uuid_mismatch()` regression test that:
- Creates a dataset with a special remote configured under a legacy UUID
- Clones the dataset and verifies that `ensure_datalad_remote()` can locate and work with the existing remote despite the UUID mismatch
- Tests that repeated `init_datalad_remote()` calls gracefully fall back to enabling the existing remote and properly apply options

## Test Plan

The new regression test `test_ensure_datalad_remote_uuid_mismatch()` covers the fixed behavior. Existing tests continue to pass, ensuring backward compatibility.

https://claude.ai/code/session_01LRDjhBMNU4f4vR38oVTLDw

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bc08a64f984`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.