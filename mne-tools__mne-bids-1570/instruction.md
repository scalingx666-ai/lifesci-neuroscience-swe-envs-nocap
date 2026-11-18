# Issue

**Title:** FIX: Keep file lock next to symlink for datalad/git-annex datasets

## Description

## Summary

.

`_canonical_lock_path` called `Path.resolve()`, which follows symlinks. For datalad/git-annex datasets, JSON sidecars (and other tracked files) are symlinks to `.git/annex/objects/…/` — a directory that git-annex marks read-only by design. The resolved lock path could not be written, raising:

```
PermissionError: [Errno 13] Permission denied:
  '…/sub-001/.git/annex/objects/9z/qZ/MD5E-s473--….json.lock'
```

### Changes

- `_canonical_lock_path` now uses `os.path.abspath(os.path.expanduser(...))` — absolute + normalized, **without** following symlinks. The `.lock` companion stays next to the symlink (writable), not the annex target (read-only).
- `_open_lock` wraps lock acquisition in `contextlib.ExitStack` and catches `OSError` on `__enter__`, warning and proceeding without a lock (defense in depth for other read-only filesystems).
- The construction-failure warning in `_get_lock_context` now includes the path + underlying exception, matching the new acquisition-failure warning.

### Tests

Two regression tests added to `mne_bids/tests/test_fileio.py`:

- `test_open_lock_symlink_to_readonly_target` — reproduces the datalad scenario (symlink in writable dir → read-only target dir) and asserts the read succeeds without raising.
- `test_open_lock_readonly_parent_falls_back` — exercises the graceful fallback when the lock file cannot be created at all.

Both share a `_readonly` context-manager helper that temporarily strips the write bit and restores the original mode on exit.

## Test plan

- [x] `pytest mne_bids/tests/test_fileio.py` — 31 passed
- [x] `pytest mne_bids/tests/test_{fileio,tsv_handler,utils,path}.py` — 133 passed
- [x] `pre-commit run` — all hooks pass (ruff, ruff format, trailing whitespace, etc.)
- [x] Manual reproduction of the issue scenario fixed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8412217f09d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.