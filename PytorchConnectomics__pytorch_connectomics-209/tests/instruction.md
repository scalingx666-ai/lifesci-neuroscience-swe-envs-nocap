# Issue

**Title:** test-cache: drop glob fallback that silently used stale decoded files

## Description

## Summary
- Remove the `decoded_glob_suffix` path in `cache_resolver.resolve_cached_prediction_files` and the parallel block in `ConnectomicsModule`.

## Why
- The fallback intentionally accepted mismatched decoding kwargs, and its glob (`decoded_x1_ch0-1-2_*..._numba-0-0.7*.h5`) prefix-matched sibling files because Python `str(0.70)` drops the trailing zero. A sweep over `threshold=0.70` silently re-evaluated an existing 0.75 decode.

## Behavior change
- Exact-match (`preferred_decoded_suffix`) is unchanged.
- When the exact file is absent the code now falls through to the raw intermediate cache and **re-decodes** with the current config.
- Public helper `final_prediction_decoded_glob_suffix` and its 3 test references are removed.

## Test plan
- [ ] `pytest tests/unit -k cache_resolver` (or equivalent) passes.
- [ ] Manual: rerun a threshold sweep and verify each threshold produces a distinct decoded artifact.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a68b05ad62a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.