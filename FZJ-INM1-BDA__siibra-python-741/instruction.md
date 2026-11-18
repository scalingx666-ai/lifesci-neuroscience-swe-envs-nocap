# Issue

**Title:** Fix/concurrent cache writes

## Description

## Summary

Fixes a race that broke `siibra.warm_cache()` on an empty cache, found when the siibra-tutorials CI started running each notebook on a fresh runner:

```
OSError: [Errno 39] Directory not empty: '.../FZJ-INM1-BDA-siibra-configurations-7d4f5c5' -> '.../c89dcd81...'
```

Also fixes `test_write_lock`, which fails on Python 3.14, and stops `HttpRequest.get()` from deleting the user's own local files.

## Changes

- **`Cache._fill(target, create, replace=False)`** (new, private, `cache.py`): creates a cache file or folder once, safely across threads and processes. It checks for the target without a lock, then under a `FileLock` checks again, writes to a unique temporary path and moves it into place with `os.replace()`. This is the pattern `ZipfileRequest` already used, now in one place.
- **`HttpRequest._retrieve()`**: downloads under the lock, so concurrent requests for the same file download it once. The streamed response is now closed when the server returns an error.
- **`GithubConnector` / `GitlabConnector`**: share one `_fetch_archive()` built on `Cache._fill()`. This fixes the `warm_cache()` race. Extraction uses tarfile's `data` filter where available (Python ≥ 3.12, or the security backports in 3.9.17+, 3.10.12+ and 3.11.4+).
- **`ZipfileRequest`**: member extraction uses `Cache._fill()`; behavior is unchanged.
- **`HttpRequest.get()`**: when decoding fails, only deletes the file if it lies inside the cache folder (new private `Cache._contains()`). Before, a decode error in a `FileLoader` deleted the user's own local file.
- **`test_write_lock`**: Python 3.14 starts multiprocessing workers with `forkserver` on Linux, so workers no longer inherited the warm-up function registered in the test, and the test measured nothing. It now registers in each worker and times inside the workers.

## Tests

- New tests for `Cache._fill()`: threads, processes, the lock-free path, failure cleanup, `replace`, and folders.
- New tests for `Cache._contains()`, including sibling folders, `..` paths and symlinks pointing out of the cache.
- The `_retrieve()` tests that mocked `open`/`os.rename` are replaced by behavior tests in a temporary directory, so they no longer leave `.lock` files in the repository root.
- New tests for concurrent archive fetching, archive path traversal, zip member extraction, and both sides of the `get()` fix: the user's local file survives, while a corrupt download in the cache is still removed.
- The new concurrency tests and the local-file test fail on the previous code; all pass on Python 3.9, 3.12 and 3.14.

## Notes

- Temporary and lock file names in the cache change: `<file>.tmp-<random>` and `<file>.lock` instead of `<file>_temp` and `<file>_temp.lock`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c320bd761f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.