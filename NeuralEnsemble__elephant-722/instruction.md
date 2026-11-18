# Issue

**Title:** [FIX] Caching changes in CI

## Description

# Desc
CI is meant to run against a cached copy of `elephant-data`, and never actually contact GIN, which nowadays answers GitHub runners mostly with `HTTP Error 403: Forbidden`. But several places still contacted GIN, i.e there are leaks

1. **Windows never used the cache.** The cache was saved at `~/elephant-data` with
   `enableCrossOsArchive: true`. The archive stores the path relative to the workspace (`../../../elephant-data`), so on Windows it was extracted to `D:\elephant-data`, while the export step looked in `$env:USERPROFILE\elephant-data`, found nothing and silently skipped setting `ELEPHANT_DATA_LOCATION`. Every data test on Windows then downloaded from GIN.
2. **The `docs` job had no `restore-elephant-data` step**, so the tutorial notebooks (`load_data()`) downloaded from GIN during `make html`.
3. **The restore action itself contacted GIN**: it ran `git ls-remote` on GIN to build the cache key. On a 403 error the step still succeeded with an empty hash, so the key silently became `datasets-`
4. **`cache_elephant_data.yml`** saved a stray cache under the key `datasets-` when `git ls-remote` failed. 

# Changes
1. Cache path is now `.ci-data/elephant-data` in both `cache_elephant_data.yml` and the restore action. It is relative to `$GITHUB_WORKSPACE`, so it is the same on all OSes.
2. Restore action: the export steps (Unix and Windows) now **fail** if the data directory is missing after restore.
3. Restore action: no more `git ls-remote` to GIN. It uses a primary key that is never hits (`use-restore-key`) and so falls back to `restore-keys: datasets-`, which picks the newest `datasets-*` cache.(Using `key: datasets-` directly would prefer an exact match, i.e. the stray `datasets-` entry,
   over newer hashed ones.) A new step prints the restored key.
4. `cache_elephant_data.yml`: `git ls-remote` is retried 3 times , then the result hash is checked for sanity
5. `CI.yml`: `restore-elephant-data` step added to the `docs` job.

# To-Do
- [x] Remove the stray cache once merged
- [x] Remove Pull request trigger from build_cache workflow before merge

# Note
**test-only cache for this PR**: A `pull_request` run can only restore caches from its own ref (`refs/pull/722/merge`), the base branch (in INM6), or the default branch (master on NeuralEnsemble). Caches on `master` still use the old `~/elephant-data` path, which gives a different cache version, so they don't match. 

To test the restore path in this PR, I **temporarily** added a `pull_request:` trigger to `cache_elephant_data.yml`. That run saved `datasets-<hash>` with the new `.ci-data/elephant-data` path on `refs/pull/722/merge`, and I then re-ran the CI jobs against it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9d75fa6e3d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.