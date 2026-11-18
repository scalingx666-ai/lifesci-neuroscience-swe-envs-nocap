# Issue

**Title:** Raise FileNotFoundError for missing files in read_nwb and _get_backend

## Description

## Motivation

.

`read_nwb` (and `_get_backend`) reported a nonexistent path as an unrecognized backend rather than a missing file. Because `NWBHDF5IO.can_read` returns `False` for any path where `os.path.isfile()` is `False`, a missing file was indistinguishable from "exists but not HDF5" and fell into the Zarr branch:

- Without hdmf-zarr installed, the user was told to `pip install hdmf-zarr`, which has nothing to do with a typo'd filename.
- With hdmf-zarr installed, the message conflated "file not found" with "not valid NWB."

## Changes

- `read_nwb` and `_get_backend` now check `os.path.exists(path)` up front and raise `FileNotFoundError: Could not find the file '<path>'.` before backend detection. The hdmf-zarr hint remains for files that exist but no installed backend can read.
- Split the old `test_get_backend_invalid_file` (which passed a *missing* file) into `test_get_backend_missing_file` (`FileNotFoundError`) and a genuine `test_get_backend_invalid_file` using an existing-but-invalid file (`ValueError`).
- Added `test_read_missing_file` for `read_nwb`.
- Added a CHANGELOG entry.

## Checklist

- [x] Tests added/updated
- [x] CHANGELOG updated

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d96cf99c9cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.