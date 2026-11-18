# Issue

**Title:** FIX preserve manufacturer metadata from StreamInfo

## Description

## Summary

Preserve manufacturer metadata when converting a live `StreamInfo` description to an MNE `Info` object.

## Problem

`create_info()` already reads `manufacturer` from dictionary descriptions, including XDF-style metadata. However, `_read_desc_sinfo()` always returned `None`, even when the extended `StreamInfo` description contained a `<manufacturer>` element. The value was therefore silently dropped for live LSL metadata.

## Changes

- Read the direct `<manufacturer>` child from `StreamInfo.desc`.
- Map a missing or empty XML value to `None`, matching the current dictionary path.
- Add a focused regression test for the `StreamInfo` conversion path.
- Add the author reference and Version 1.15 changelog entry under `doc/`.

## Validation

```console
pytest tests/utils/test_meas_info.py -q
# 6 passed in 0.12s

ruff format --check src/mne_lsl/utils/meas_info.py tests/utils/test_meas_info.py
# 2 files already formatted

ruff check src/mne_lsl/utils/meas_info.py tests/utils/test_meas_info.py
# All checks passed!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `664a722c6815`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.