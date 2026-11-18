# Issue

**Title:** Guard PyQt5 import in plotting/utils_qt.py

## Description

.

PyQt5 is an optional plotting dependency. `brainspace/plotting/base.py` already wraps its PyQt5 imports in `try/except`, but [`brainspace/plotting/utils_qt.py`](brainspace/plotting/utils_qt.py) imported PyQt5 unconditionally at module top level. That made any direct import of `utils_qt` crash on PyQt5-less environments — fine today only because `base.py` lazy-imports it, but fragile to any future refactor.

Wrap the imports in `try/except` and expose `MainWindow = None` as a sentinel so callers can detect the unavailable case.

## Test plan
- [x] `from brainspace.plotting import utils_qt` works in environments with and without PyQt5.
- [x] Full test suite still passes (132 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1c514a9a466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.