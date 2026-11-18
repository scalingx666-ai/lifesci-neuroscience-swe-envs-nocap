# Issue

**Title:** Use cached data before prefetching NEMAR

## Description

## Problem

`BaseDataset.get_data()` prefetched NEMAR before inspecting MOABB's processing cache. On an offline cluster, a complete raw/epochs/array cache therefore still paid for NEMAR retries; with the provider pinned to `nemar`, loading failed before the cache was read.

## Fix

- Reuse the BIDS cache path and lock checks without deserializing cached EEG twice.
- Prefetch NEMAR only for subjects that actually need source data, preserving the existing longest-cache-prefix and overwrite behavior.
- Recheck pinned-NEMAR policy at the actual source boundary so a concurrently removed cache cannot fall through to an upstream host.

No provider API or cache format changes.

## Verification

- Regression test observed failing before the fix and passing after it.
- `moabb/tests/test_download.py` excluding opt-in download tests: **214 passed, 2 skipped**.
- Cache/overwrite tests in `moabb/tests/test_datasets.py`: **4 passed**.
- All touched-file pre-commit hooks pass.
- Maximum-depth correctness, architecture, impact, and simplification review: **APPROVE; no blockers; lean already**.
- A repository-wide `pytest -q` run was attempted under an isolated MNE config but did not complete within five minutes and was interrupted while blocked in `threading.py`; it emitted no test failure before interruption.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `402b3ac94a55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.