# Issue

**Title:** fix: replace deprecated pkg_resources with importlib.resources

## Description

Updated BrainFlow EEG files:

- emulator/: cyton_windows.py, freeeeg32_windows.py, knightboard_windows.py

- python_package/brainflow/: board_shim.py, data_filter.py, ml_model.py

Eliminates pkg_resources deprecation warnings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ef5fe391526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.