# Issue

**Title:** Neuroglancer volume fetching

## Description

- Allow overriding maximum bytes to download when fetching high-resolution volumes by setting env var `SIIBRA_MAX_FETCH_SIZE_GIB`. Also, use `max_bytes` to override the specific request. ( )
- Reintroduce desired color channel to be fetched using `channel` kwarg.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8156f1c0f558`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.