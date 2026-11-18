# Issue

**Title:** fix(cache): normalize path separators in sha256_dir

## Description

## Summary
- `sha256_dir()` fed the OS-native path separator into the hash (`str(fp.relative_to(path))`), so a directory source hashed differently on Windows vs. macOS/Linux for byte-identical content, and the `sorted()` ordering was separator-sensitive too.
- Now uses `.as_posix()` for both the hash input and the sort key, so directory-source hashes are stable across platforms.
- .

## Test plan
- [x] Added `test_sha256_dir_independent_of_path_separator` to `tests/test_cache.py`
- [x] `python3 -m pytest tests/test_cache.py -q` — 30 passed
- [x] `python3 -m pytest -q` (full suite) — 647 passed, 1 skipped

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7b030d9f101`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.