# Issue

**Title:** [codex] Preserve legacy device model names on read

## Description

fix #2185 

## Summary

Fixes the read-time remapping path for legacy files where `Device.model` is stored as a string containing characters such as `/` or `:`.

Instead of sanitizing the legacy value, PyNWB now constructs the remapped `DeviceModel` in HDMF construct mode, matching the normal file-read construction path. This preserves the original model name in memory while still avoiding the user-facing name validation that is meant to prevent invalid newly-created container names.

## Root cause

`DeviceMapper.model_carg` manually created a `DeviceModel` with `DeviceModel(...)`. That bypassed HDMF's usual read-time `in_construct_mode=True` path, so `AbstractContainer.__init__` rejected legacy model strings containing `/` or `:`.

## Validation

- `PYTHONPATH=src .tox/test-py312-pinned/bin/python -m pytest tests/unit/test_device.py -q`
- `PYTHONPATH=src .tox/test-py312-pinned/bin/python -m pytest tests/back_compat/test_read.py::TestReadOldVersions::test_read_device_model_str_attribute -q`
- Earlier full pinned tox run passed: `python -m tox -e test-py312-pinned -- tests/unit/test_device.py` (`683 tests - OK`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f667dc965de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.