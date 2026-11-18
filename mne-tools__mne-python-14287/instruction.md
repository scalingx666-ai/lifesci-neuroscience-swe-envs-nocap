# Issue

**Title:** FIX: Warn when bridged interpolation uses bad channels

## Description

## Summary

`interpolate_bridged_electrodes` temporarily clears `inst.info["bads"]` while building the interpolation. This can allow channels already marked bad to influence the result without notifying the caller.

This patch keeps the existing interpolation behavior and public API unchanged, but emits a warning naming the affected channels and documents the behavior.

## Changes

- Warn when `inst.info["bads"]` is non-empty.
- Document the behavior in the public docstring.
- Extend the existing regression test to check the warning and restoration of the original bad-channel list.
- Add a bugfix changelog fragment.

## Testing

- `.venv/bin/python -m pytest -p no:pytest-qt mne/preprocessing/tests/test_interpolate.py::test_interpolate_bridged_electrodes --verbose` — 1 passed
- `.venv/bin/python -m pytest -p no:pytest-qt mne/preprocessing/tests/test_interpolate.py --verbose` — 11 passed
- `.venv/bin/python -m pytest -p no:pytest-qt mne/tests/test_docstring_parameters.py --verbose` — 17 passed, 2 skipped
- Ruff check and format check passed
- Codespell passed
- `git diff --check` passed

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47d5be239f12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.