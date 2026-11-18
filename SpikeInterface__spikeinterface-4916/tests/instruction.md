# Issue

**Title:** Parse params.py with ast instead of exec in read_python

## Description

## What
`read_python()` (core/core_tools.py) parsed a Python-style config file by `exec()`-ing its contents. That means reading a Phy/Kilosort folder (via `PhySortingExtractor` / `read_phy`, which reads `params.py`) or a Klusta config executes whatever is in that file. Since these outputs are routinely shared and downloaded, and `params.py` is expected to be a simple dictionary of values (sample_rate, n_channels, ...), this replaces the `exec` with a small `ast`-based parser that evaluates only literal assignments (numbers/strings/bools/None/list/tuple/dict, plus `range()`/`list(range())` with integer args) and ignores everything else.

## Why
We don't need to exec the params since it's a simple dictionary; this avoids executing arbitrary code from a params/config file.

## Changes
- `read_python()` rewritten to parse via `ast` (no `exec`). Fixes both the phy and klusta call sites. A realistic `params.py` parses unchanged; a `params.py` containing e.g. `import os; os.system(...)` is no longer executed.
- Added a small regression test (`core/tests/test_read_python_safe.py`): a config with a side-effecting line is not executed, and the reader's source contains no `exec`/`eval`.

## Note
I used Claude Code as an assistant to investigate and prepare this fix; I reviewed the analysis, the change, and the test before submitting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e28d878e240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.