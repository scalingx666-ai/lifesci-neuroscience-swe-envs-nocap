# Issue

**Title:** BF: fix undefined names in triggerbox parallel port module

## Description

`psychopy/hardware/triggerbox/parallel.py` uses `sys` and `logging` without importing them, so any code path reaching them raises `NameError`:
- `_setupPort()` branches on `sys.platform` (Linux / win32 / Mac)
- the "no driver found" and "imported on a Mac" warnings call `logging.warning`

Separately, `setPortAddress()` referenced an undefined local `address` when converting a hex-string address (e.g. `"0x0378"`) and then stored the *unconverted* `portAddress` argument — so hex-string addresses were never converted and the conversion branch itself raised `NameError`. Now uses the `portAddress` parameter consistently.

Imports follow the convention in `psychopy.parallel` (`import sys` + `from psychopy import logging`). Found via `pyflakes`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d37c2378ac3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.